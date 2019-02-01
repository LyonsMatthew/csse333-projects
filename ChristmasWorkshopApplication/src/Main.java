import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import christmasworkshop.services.DatabaseConnectionService;
import christmasworkshop.services.GiftService;
import christmasworkshop.services.StoredProcedure;

public class Main {

	public static final String serverUsername =  "SodaBaseUserdavelltr29";
	public static final String serverPassword = "Password123";
	public static final String databaseName = "ChristmasWorkshop";
	public static final String serverName = "golem.csse.rose-hulman.edu";
	
	// grant execute on (stored_proc) to (username)
	
	public static void main(String[] args) throws SQLException {
		//ApplicationRunner appRunner = new ApplicationRunner();
		//appRunner.runApplication(args);
		
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
		boolean success = con.connect(serverUsername, serverPassword);
		if (!success) System.exit(1);
		System.out.println("Connected!");
		
		GiftService gift = new GiftService(con);
		
		boolean run = true;
		while (run) {
			System.out.println("What would you like to do?");
			System.out.print("> ");
			String command = in.nextLine();
			command = command.replaceAll(" ", "");
			command = command.replaceAll("_", "");
			command = command.toLowerCase();
			if (spMap.containsKey(command)) {
				spMap.get(command).exec();
			}
		}		
	}

}
