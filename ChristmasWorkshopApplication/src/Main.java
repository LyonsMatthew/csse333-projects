import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintStream;
import java.lang.ProcessBuilder.Redirect;
import java.sql.SQLException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import christmasworkshop.services.DatabaseConnectionService;
import christmasworkshop.services.StoredProcedure;

public class Main {

	public static final String serverUsername =  "SodaBaseUserdavelltr29";
	public static final String serverPassword = "UGFzc3dvcmQxMjM=";
	public static final String databaseName = "ChristmasWorkshop4";
	public static final String serverName = "golem.csse.rose-hulman.edu";
	public static final Base64.Encoder enc = Base64.getEncoder();
	public static final Base64.Decoder dec = Base64.getDecoder();
	
	// grant execute on (stored_proc) to (username)
	
	public static void main(String[] args) throws SQLException, IOException {
		//ApplicationRunner appRunner = new ApplicationRunner();
		//appRunner.runApplication(args);
		
		String temp = enc.encodeToString(serverPassword.getBytes());
		System.out.println(new String(serverPassword.getBytes()));
		System.out.println(temp);
		byte[] lemp = dec.decode(temp.getBytes());
		System.out.println();
		
		DatabaseConnectionService con = new DatabaseConnectionService(serverName, databaseName);
		Scanner in = new Scanner(System.in);
		
		Map<String, StoredProcedure> spMap = new HashMap<>();
		StoredProcedureParser.parse(spMap, con);
		
//		System.out.println("Please login");
//		System.out.print("> Username: ");
//		String username = in.next();
//		
//		System.out.print("> Password: ");
//		String password = in.next();
		
		System.out.println("Logging in...");
		boolean success = con.connect(serverUsername, new String(dec.decode(serverPassword.getBytes())));
		if (!success) System.exit(1);
		System.out.println("Connected!");
		
		boolean run = true;
		while (run) {
			System.out.println("What would you like to do?");
			System.out.print("> ");
			String command = in.nextLine();
			command = command.replaceAll(" ", "");
			command = command.replaceAll("_", "");
			command = command.toLowerCase();
			if (command.equals("help")) {
				for(String s : spMap.keySet()) {
					System.out.print(s + " ");
				}
				System.out.println("");
			} else if (command.equals("quit")) {
				break;
			} else if (spMap.containsKey(command)) {
				spMap.get(command).exec();
			}
		}
	}

}
