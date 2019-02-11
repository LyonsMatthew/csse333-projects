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
	
	public boolean exec() throws SQLException {
		Scanner in = new Scanner(System.in);
		String call_string = "{? = call " + name + "(";
		for(String a : argumentNames) {
			call_string += "?, ";
			System.out.print(">> " + a + ": ");
			arguments.add(in.nextLine());
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
