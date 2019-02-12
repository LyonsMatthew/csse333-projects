package christmasworkshop.services;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

public class StoredProcedure {
	
	private String name;
	private Map<Integer, String> returnValueToMessage = new HashMap<>();
	private List<String> argumentNames = new ArrayList<>();
	private List<String> argumentTypes = new ArrayList<>();
	private List<String> arguments = new ArrayList<>();
	private  DatabaseConnectionService dbService = null;

	public StoredProcedure(DatabaseConnectionService dbService) {
		this.dbService = dbService;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void addErrorMessage(int returnCode, String message) {
		returnValueToMessage.put(returnCode, message);
	}
	
	public void addArgumentName(String name) {
		argumentNames.add(name);
	}
	
	public void addArgumentType(String type) {
		argumentTypes.add(type);
	}
	
	private boolean validateArgumentType(int i) {
		String type = argumentTypes.get(i);
		if (type.startsWith("int")) {
			try { Integer.parseInt(arguments.get(i)); } catch (NumberFormatException e) {
				System.out.println("Must be an integer.");
				return false;
			}
		} else if (type.startsWith("varchar")) {
			//always true lol
		} else if (type.startsWith("boolean")) {
			if (arguments.get(i).equals("0") 
				|| arguments.get(i).toLowerCase().equals("false")
				|| arguments.get(i).toLowerCase().equals("no")) {
				arguments.set(i, "0");
				return true;
			} else if (arguments.get(i).equals("1") 
				|| arguments.get(i).toLowerCase().equals("true")
				|| arguments.get(i).toLowerCase().equals("yes")) {
			arguments.set(i, "1");
			return true;
			} else {
				System.out.println("Must be a boolean.");
				return false;
			}
		} else if (type.startsWith("decimal")) {
			try { 
				Double.parseDouble(arguments.get(i));
				String precisionAndScale = type.substring(7);
				String precision = precisionAndScale.split(",")[0];
				String scale = precisionAndScale.split(",")[1];
				String argPrecision = arguments.get(i).split("\\.")[0];
				if (argPrecision.length() > (Double.parseDouble(precision) - Double.parseDouble(scale))) {
					System.out.print("Decimal is too big. ");
					System.out.print("Precision: " + precision);
					System.out.println(", scale: " + scale + ".");
					return false;
				}
			} catch (NumberFormatException e) {
				System.out.println("Must be a decimal number.");
				return false;
			}
		} else if (type.startsWith("money")) {
			try { 
				Double.parseDouble(arguments.get(i));
				String precision = "19";
				String scale = "4";
				String argPrecision = arguments.get(i).split("\\.")[0];
				if (argPrecision.length() > (Double.parseDouble(precision) - Double.parseDouble(scale))) {
					System.out.print("Decimal is too big. ");
					System.out.print("Precision: " + precision);
					System.out.println(", scale: " + scale + ".");
					return false;
				}
			} catch (NumberFormatException e) {
				System.out.println("Must be a decimal number.");
				return false;
			}
		} else if (type.startsWith("date")) {
			String[] dateParts = arguments.get(i).split("-");
			String year = dateParts[0];
			String month = dateParts[1];
			String day = dateParts[2];
			if (dateParts.length != 3
				|| year.length() != 4
				|| month.length() != 2
				|| day.length() != 2) {
				System.out.println("Must be in format YYYY-MM-DD.");
				return false;
			}
			try {
				int iyear = Integer.parseInt(year);
				if (Integer.parseInt(month) > 12) {
					System.out.println("Invalid month.");
					return false;
				}
				int[] daysInMonth = new int[12];
				daysInMonth[0] = 31; daysInMonth[1] = 28; daysInMonth[2] = 31;
				daysInMonth[3] = 30; daysInMonth[4] = 31; daysInMonth[5] = 30;
				daysInMonth[6] = 31; daysInMonth[7] = 31; daysInMonth[8] = 30;
				daysInMonth[9] = 31; daysInMonth[10] = 30; daysInMonth[11] = 31;
				if (((iyear % 4 == 0) && (iyear % 100) != 0) || iyear % 400 == 0) {
					daysInMonth[1] = 29;
				}
				if (Integer.parseInt(day) > daysInMonth[Integer.parseInt(month)-1]) {
					System.out.println(day + " " + daysInMonth[Integer.parseInt(month)-1]);
					System.out.println("Invalid day.");
					return false;
				}
			} catch (NumberFormatException e) {
				System.out.println("Must be in format YYYY-MM-DD.");
				return false;
			}
		}
		return true;
	}
	
	public boolean exec() throws SQLException {
		Scanner in = new Scanner(System.in);
		String call_string = "{? = call " + name + "(";
		for(int i=0;i<argumentNames.size();i++) {
			call_string += "?, ";
			System.out.print(">> " + argumentNames.get(i) + ": ");
			arguments.add(in.nextLine());
			if (!validateArgumentType(i)) {
				System.out.println("Operation aborted.");
				arguments.clear();
				return false;
			}
		}
		if (arguments.size() > 0) {
			call_string = call_string.substring(0, call_string.length()-2) + ")}";
		} else call_string = call_string.substring(0, call_string.length()-1) + "}";
//		System.out.println(call_string);
//		System.out.print(">> Name: ");
//		String name = in.next();
//		System.out.print(">> Manufacturer ID: ");
//		String manf = in.next();
		
		CallableStatement cs = dbService.getConnection().prepareCall(call_string);
		cs.registerOutParameter(1, Types.INTEGER);
		for(int i=0;i<arguments.size();i++) {
			cs.setString(i+2, arguments.get(i));
		}
		arguments.clear();
		ResultSet rs = null;
		if (cs.execute()) {
			rs = cs.getResultSet();
		}
		int returnValue = 0;
		if (returnValueToMessage.containsKey(returnValue)) {
			System.out.println("ERROR " + returnValue + ": " + returnValueToMessage.get(returnValue));
			System.out.println("Operation aborted.");
			return false;
		}
		printResultSet(rs);
		return true;
	}
	
	public void printResultSet(ResultSet rs) throws SQLException {
		if (rs == null) {
			System.out.println("Success!");
			return;
		}
		int col = rs.getMetaData().getColumnCount();
		while (rs.next()) {
			for(int i=1;i<col;i++) {
				System.out.print(rs.getMetaData().getColumnName(i) + ": " + rs.getString(i) + ", ");
			}
			System.out.println(rs.getMetaData().getColumnName(col) + ": " + rs.getString(col));
		}
	}
}
