import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Map;

import christmasworkshop.services.DatabaseConnectionService;
import christmasworkshop.services.StoredProcedure;

public class StoredProcedureParser {

	public static void parse(Map<String, StoredProcedure> spMap, DatabaseConnectionService con) {
		try {
			BufferedReader reader = new BufferedReader(new FileReader("StoredProcedures.txt"));
			String line;
			StoredProcedure sp = new StoredProcedure(con);
			String currentName = "";
			boolean first = true;
			while ((line = reader.readLine()) != null) {
				if (line.startsWith("procedure")) {
					if (first) {
						first = false;
					} else {
						spMap.put(currentName, sp);
					}
					sp = new StoredProcedure(con);
					currentName = line.substring(10, line.length());
					sp.setName(currentName);
					currentName = currentName.replaceAll(" ", "");
					currentName = currentName.replaceAll("_", "");
					currentName = currentName.toLowerCase();
				} else if (line.startsWith("argument")) {
					String[] argumentData = line.split(" ");
					String type = argumentData[1];
					String argument = "";
					for(int i=2;i<argumentData.length;i++) {
						argument += argumentData[i] + " ";
					}
					argument = argument.substring(0, argument.length()-1);
					sp.addArgumentName(argument);
					sp.addArgumentType(type);
				} else if (line.startsWith("error")) {
					int returnCode = Integer.parseInt(line.substring(6, 7));
					String message = line.substring(8, line.length());
					sp.addErrorMessage(returnCode, message);
				}
			}
			spMap.put(currentName, sp);
			reader.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
