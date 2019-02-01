package christmasworkshop.services;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;

import javax.swing.JOptionPane;

public class SodaService {

	private DatabaseConnectionService dbService = null;
	
	public SodaService(DatabaseConnectionService dbService) {
		this.dbService = dbService;
	}

	public boolean addSoda(String sodaName, String manf) throws SQLException {
		CallableStatement cs = dbService.getConnection().prepareCall("{? = call AddSoda(?, ?)}");
		cs.registerOutParameter(1, Types.INTEGER);
		cs.setString(2, sodaName);
		cs.setString(3, manf);
		cs.execute();
		int returnValue = cs.getInt(1);
		if (returnValue == 1) {
			JOptionPane.showMessageDialog(null, "ERROR 1: Soda name cannot be null or empty.");
			return false;
		} if (returnValue == 2) {
			JOptionPane.showMessageDialog(null, "ERROR 2: Soda name already exists.");
			return false;
		}
		return true;
	}
	
	public ArrayList<String> getSodas() throws SQLException {
		//TODO: Task 2
		ArrayList<String> sodas = new ArrayList<String>();
		String query = "SELECT name FROM Soda";
		Statement stmt = dbService.getConnection().createStatement();
		ResultSet rs = stmt.executeQuery(query);
		while(rs.next()) {
			sodas.add(rs.getString("name"));
		}
		return sodas;
	}
}
