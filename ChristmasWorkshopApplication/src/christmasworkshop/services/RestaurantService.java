package christmasworkshop.services;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;

import javax.swing.JOptionPane;

public class RestaurantService {

	private DatabaseConnectionService dbService = null;
	
	public RestaurantService(DatabaseConnectionService dbService) {
		this.dbService = dbService;
	}
	
	public boolean addResturant(String restName, String addr, String contact) throws SQLException {
		//TODO: Task 5
		CallableStatement cs = dbService.getConnection().prepareCall("{? = call AddRestaurant(?, ?, ?)}");
		cs.registerOutParameter(1, Types.INTEGER);
		cs.setString(2, restName);
		cs.setString(3, addr);
		cs.setString(4, contact);
		cs.execute();
		int returnValue = cs.getInt(1);
		if (returnValue == 1) {
			JOptionPane.showMessageDialog(null, "ERROR 1: Restaurant name cannot be null or empty");
			return false;
		} if (returnValue == 2) {
			JOptionPane.showMessageDialog(null, "ERROR 2: Restaurant name already exists.");
			return false;
		}
		return true;
	}
	

	public ArrayList<String> getRestaurants() throws SQLException {	
		//TODO: Task 2 

		ArrayList<String> rests = new ArrayList<String>();
		String query = "SELECT name FROM Rest";
		Statement stmt = dbService.getConnection().createStatement();
		ResultSet rs = stmt.executeQuery(query);
		while(rs.next()) {
			rests.add(rs.getString("name"));
		}
		return rests;
	}
}
