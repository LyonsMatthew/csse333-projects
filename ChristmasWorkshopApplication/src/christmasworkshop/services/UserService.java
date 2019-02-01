package christmasworkshop.services;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Random;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.swing.JOptionPane;

import sodabase.ui.SodaByRestaurant;

public class UserService {
	private static final Random RANDOM = new SecureRandom();
	private static final Base64.Encoder enc = Base64.getEncoder();
	private static final Base64.Decoder dec = Base64.getDecoder();
	private DatabaseConnectionService dbService = null;

	public UserService(DatabaseConnectionService dbService) {
		this.dbService = dbService;
	}

	public boolean useApplicationLogins() {
		return true;
	}
	
	public boolean login(String username, String password) {
		try {
			this.dbService.getConnection().setAutoCommit(false);
			String query = "SELECT PasswordSalt, PasswordHash FROM [User] WHERE Username = ?";
			PreparedStatement stmt = this.dbService.getConnection().prepareStatement(query);
			stmt.setString(1, username);
			dbService.getConnection().commit();
			ResultSet rs = stmt.executeQuery();
			
			int saltIndex = rs.findColumn("PasswordSalt");
			int hashIndex = rs.findColumn("PasswordHash");
			rs.next();
			String salt = rs.getString(saltIndex);
			String hash = rs.getString(hashIndex);
			
			String passwordHash = hashPassword(dec.decode(salt), password);
			if (hash.equals(passwordHash)) return true;
		}
		catch (SQLException ex) {
			JOptionPane.showMessageDialog(null, "Something failed during login");
			ex.printStackTrace();
		}
		JOptionPane.showMessageDialog(null, "Login Failed");
		return false;
	}

	public boolean register(String username, String password) throws SQLException {
		//TODO: Task 6
		byte[] salt = getNewSalt();
		String hash = hashPassword(salt, password);
		
		CallableStatement cs = dbService.getConnection().prepareCall("{? = call Register(?, ?, ?)}");
		cs.registerOutParameter(1, Types.INTEGER);
		cs.setString(2, username);
		cs.setString(3, getStringFromBytes(salt));
		cs.setString(4, hash);
		cs.execute();
		int returnValue = cs.getInt(1);
		if (returnValue == 1) {
			JOptionPane.showMessageDialog(null, "Username cannot be null or empty.");
			return false;
		} if (returnValue == 2) {
			JOptionPane.showMessageDialog(null, "PasswordSalt cannot be null or empty.");
			return false;
		} if (returnValue == 3) {
			JOptionPane.showMessageDialog(null, "PasswordHash cannot be null or empty.");
			return false;
		} if (returnValue == 4) {
			JOptionPane.showMessageDialog(null, "ERROR: Username already exists.");
			return false;
		}
		return true;
	}
	
	public byte[] getNewSalt() {
		byte[] salt = new byte[16];
		RANDOM.nextBytes(salt);
		return salt;
	}
	
	public String getStringFromBytes(byte[] data) {
		return enc.encodeToString(data);
	}

	public String hashPassword(byte[] salt, String password) {

		KeySpec spec = new PBEKeySpec(password.toCharArray(), salt, 65536, 128);
		SecretKeyFactory f;
		byte[] hash = null;
		try {
			f = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
			hash = f.generateSecret(spec).getEncoded();
		} catch (NoSuchAlgorithmException e) {
			JOptionPane.showMessageDialog(null, "An error occurred during password hashing. See stack trace.");
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			JOptionPane.showMessageDialog(null, "An error occurred during password hashing. See stack trace.");
			e.printStackTrace();
		}
		return getStringFromBytes(hash);
	}

}
