package christmasworkshop.services;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import sodabase.ui.SodaByRestaurant;

public class SodasByRestaurantService {

	private DatabaseConnectionService dbService = null;

	public SodasByRestaurantService(DatabaseConnectionService dbService) {
		this.dbService = dbService;
	}
	
	public boolean addSodaByRestaurant(String rest, String soda, double price) throws SQLException {
		CallableStatement cs = dbService.getConnection().prepareCall("{? = call AddSells(?, ?, ?)}");
		cs.registerOutParameter(1, Types.INTEGER);
		cs.setString(2, soda);
		cs.setString(3, rest);
		cs.setDouble(4, price);
		cs.execute();
		int returnValue = cs.getInt(1);
		if (returnValue == 1) {
			JOptionPane.showMessageDialog(null, "ERROR 1: Soda name cannot be null or empty.");
			return false;
		} if (returnValue == 2) {
			JOptionPane.showMessageDialog(null, "ERROR 2: Rest name cannot be null or empty.");
			return false;
		} if (returnValue == 3) {
			JOptionPane.showMessageDialog(null, "ERROR 3: Price cannot be null or empty.");
			return false;
		} if (returnValue == 4) {
			JOptionPane.showMessageDialog(null, "ERROR 4: Given soda does not exist.");
			return false;
		} if (returnValue == 5) {
			JOptionPane.showMessageDialog(null, "ERROR 5: Given restaurant name does not exist.");
			return false;
		}
		return true;
	}

	public ArrayList<SodaByRestaurant> getSodasByRestaurants(String rest, String soda, String price,
			boolean useGreaterThanEqual) {
		//TODO: Task 3 and Task 4
		try {
			this.dbService.getConnection().setAutoCommit(false);
			Double doublePrice = null;
			if (price != null && price.length() > 0) doublePrice = Double.parseDouble(price);
			String query = buildParameterizedSqlStatementString(rest, soda, doublePrice, useGreaterThanEqual);
			
			PreparedStatement stmt = this.dbService.getConnection().prepareStatement(query);
			int i = 1;
			if (rest != null && rest.length() > 0) {
				stmt.setString(i, rest);
				i++;
			}
			if (soda != null && soda.length() > 0) {
				stmt.setString(i, soda);
				i++;
			}
			if (price != null && price.length() > 0) {
				stmt.setDouble(i, doublePrice);
				i++;
			}
			dbService.getConnection().commit();
			ResultSet rs = stmt.executeQuery();
			return parseResults(rs);
		}
		catch (SQLException ex) {
			JOptionPane.showMessageDialog(null, "Failed to retrieve sodas by restaurant.");
			ex.printStackTrace();
			return new ArrayList<SodaByRestaurant>();
		}
		
	}
	/**
	 * Creates a string containing ? in the correct places in the SQL statement based on the filter information provided.
	 * 
	 * @param rest - The restaurant to match
	 * @param soda - The soda to match
	 * @param price - The price to compare to
	 * @param useGreaterThanEqual - If true, the prices returned should be greater than or equal to what's given, otherwise less than or equal.
	 * @return A string representing the SQL statement to be executed 
	 */
	private String buildParameterizedSqlStatementString(String rest, String soda, Double price, boolean useGreaterThanEqual) {
		String sqlStatement = "SELECT Restaurant, Soda, Manufacturer, RestaurantContact, Price \nFROM SodasByRestaurant\n";
		ArrayList<String> wheresToAdd = new ArrayList<String>();

		if (rest != null) {
			wheresToAdd.add("Restaurant = ?");
		}
		if (soda != null) {
			wheresToAdd.add("Soda = ?");
		}
		if (price != null) {
			if (useGreaterThanEqual) {
				wheresToAdd.add("Price >= ?");
			} else {
				wheresToAdd.add("Price <= ?");
			}
		}
		boolean isFirst = true;
		while (wheresToAdd.size() > 0) {
			if (isFirst) {
				sqlStatement = sqlStatement + " WHERE " + wheresToAdd.remove(0);
				isFirst = false;
			} else {
				sqlStatement = sqlStatement + " AND " + wheresToAdd.remove(0);
			}
		}
		return sqlStatement;
	}

	private ArrayList<SodaByRestaurant> parseResults(ResultSet rs) {
		try {
			ArrayList<SodaByRestaurant> sodasByRestaurants = new ArrayList<SodaByRestaurant>();
			int restNameIndex = rs.findColumn("Restaurant");
			int sodaNameIndex = rs.findColumn("Soda");
			int manfIndex = rs.findColumn("Manufacturer");
			int restContactIndex = rs.findColumn("RestaurantContact");
			int priceIndex = rs.findColumn("Price");
			while (rs.next()) {
				sodasByRestaurants.add(new SodaByRestaurant(rs.getString(restNameIndex), rs.getString(sodaNameIndex),
						rs.getString(manfIndex), rs.getString(restContactIndex), rs.getDouble(priceIndex)));
			}
			System.out.println(sodasByRestaurants.size());
			return sodasByRestaurants;
		} catch (SQLException ex) {
			JOptionPane.showMessageDialog(null,
					"An error ocurred while retrieving sodas by restaurants. See printed stack trace.");
			ex.printStackTrace();
			return new ArrayList<SodaByRestaurant>();
		}

	}


}
