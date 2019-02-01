package christmasworkshop.services;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Scanner;

import javax.swing.JOptionPane;

import sodabase.ui.SodaByRestaurant;

public class GiftService {
	private DatabaseConnectionService dbService = null;

	public GiftService(DatabaseConnectionService dbService) {
		this.dbService = dbService;
	}
	
	public boolean exec() throws SQLException {
		Scanner in = new Scanner(System.in);
		
		System.out.print(">> Name: ");
		String name = in.next();
		System.out.print(">> Manufacturer ID: ");
		String manf = in.next();
		
		CallableStatement cs = dbService.getConnection().prepareCall("{? = call insert_gift(?, ?)}");
		cs.registerOutParameter(1, Types.INTEGER);
		cs.setString(2, name);
		cs.setString(3, manf);
		cs.execute();
		int returnValue = cs.getInt(1);
		if (returnValue == 1) {
			System.out.println("\tERROR 1: The manufacturer ID is not valid because it is not in the manufacturer table");
			System.out.println("\tOperation Aborted");
			return false;
		}
		return true;
	}

//	public ArrayList<SodaByRestaurant> getSodasByRestaurants(String rest, String soda, String price,
//			boolean useGreaterThanEqual) {
//		//TODO: Task 3 and Task 4
//		try {
//			this.dbService.getConnection().setAutoCommit(false);
//			Double doublePrice = null;
//			if (price != null && price.length() > 0) doublePrice = Double.parseDouble(price);
//			String query = buildParameterizedSqlStatementString(rest, soda, doublePrice, useGreaterThanEqual);
//			
//			PreparedStatement stmt = this.dbService.getConnection().prepareStatement(query);
//			int i = 1;
//			if (rest != null && rest.length() > 0) {
//				stmt.setString(i, rest);
//				i++;
//			}
//			if (soda != null && soda.length() > 0) {
//				stmt.setString(i, soda);
//				i++;
//			}
//			if (price != null && price.length() > 0) {
//				stmt.setDouble(i, doublePrice);
//				i++;
//			}
//			dbService.getConnection().commit();
//			ResultSet rs = stmt.executeQuery();
//			return parseResults(rs);
//		}
//		catch (SQLException ex) {
//			JOptionPane.showMessageDialog(null, "Failed to retrieve sodas by restaurant.");
//			ex.printStackTrace();
//			return new ArrayList<SodaByRestaurant>();
//		}
//		
//	}

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
