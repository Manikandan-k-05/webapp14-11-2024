package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;

import bean.RegisterBean;
import db.DBconnection;

public class UserRegistrationDAO {

    // Create method for inserting a new user
	public void registerUser(RegisterBean user) throws SQLException {
	    String sql = "INSERT INTO userRegistration (registerEmail, registerPhone, registerPassword) VALUES (?, ?, ?)";

	    try (Connection conn = DBconnection.getConnection(); 
	         PreparedStatement stmt = conn.prepareStatement(sql)) {
	        
	        // Set parameters
	        stmt.setString(1, user.getRegisterEmail());
	        stmt.setString(2, user.getRegisterPhone());
	        stmt.setString(3, user.getRegisterPassword());

	        int affectedRows = stmt.executeUpdate();
	        
	        if (affectedRows > 0) {
	            System.out.println("Registration successful!");
	        } else {
	            System.out.println("Unable to register user.");
	        }
	    } catch (SQLException e) {
	        System.out.println("Error while registering user: " + e.getMessage());
	    }
	}


    // Method to find a user by their email
    public RegisterBean getUserByEmail(String email) throws SQLException {
        String sql = "SELECT * FROM userRegistration WHERE registerEmail = ?";
        try (Connection conn = DBconnection.getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                	RegisterBean user = new RegisterBean();
                    user.setUserRegID(rs.getInt("userRegID"));
                    user.setRegisterEmail(rs.getString("registerEmail"));
                    user.setRegisterPhone(rs.getString("registerPhone"));
                    user.setRegisterPassword(rs.getString("registerPassword"));
                    return user;
                }
            }
        }
        return null;  // Return null if no user found with that email
    }
    
    public RegisterBean getUserByEmailAndPassword(String email, String password) throws SQLException {
        String query = "SELECT * FROM userRegistration WHERE registerEmail = ?";
        RegisterBean user = null;
        
        try (Connection conn = DBconnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(query)) {
            
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            
            if (rs.next()) {
                user = new RegisterBean();
                user.setRegisterEmail(rs.getString("registerEmail"));
                user.setRegisterPassword(rs.getString("registerPassword")); // Assumes password is stored as a hash
            }
        }
        return user;
    }


    // Method to check if email already exists
    public boolean isEmailExists(String email) throws SQLException {
        String sql = "SELECT * FROM userRegistration WHERE registerEmail = ?";
        try (Connection conn = DBconnection.getConnection();  
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();  // Returns true if the email exists
            }
        }
    }

    // Method to update user information (e.g., update password)
    public boolean updateUser(RegisterBean user) throws SQLException {
        String sql = "UPDATE userRegistration SET registerPhone = ?, registerPassword = ? WHERE userRegID = ?";

        try (Connection conn = DBconnection.getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, user.getRegisterPhone());
            stmt.setString(2, user.getRegisterPassword());
            stmt.setInt(3, user.getUserRegID());

            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        }
    }

    // Method to delete a user by userRegID
    public boolean deleteUser(int userRegID) throws SQLException {
        String sql = "DELETE FROM userRegistration WHERE userRegID = ?";

        try (Connection conn = DBconnection.getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, userRegID);
            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        }
    }
    
    public boolean updatePhoneNumber(String email, String newPhone) throws SQLException {
        String sql = "UPDATE userRegistration SET registerPhone = ? WHERE registerEmail = ?";

        try (Connection conn = DBconnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, newPhone);
            stmt.setString(2, email);

            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0; // Returns true if the update was successful
        }
    }
    public List<RegisterBean> getAllUsers() throws SQLException {
        String sql = "SELECT * FROM userRegistration";
        List<RegisterBean> users = new ArrayList<>();

        try (Connection conn = DBconnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                RegisterBean user = new RegisterBean();
                user.setUserRegID(rs.getInt("userRegID"));
                user.setRegisterEmail(rs.getString("registerEmail"));
                user.setRegisterPhone(rs.getString("registerPhone"));
                user.setRegisterPassword(rs.getString("registerPassword")); // Password might be hashed

                users.add(user);
            }
        } catch (SQLException e) {
            System.out.println("Error fetching users: " + e.getMessage());
        }
        return users;
    }

}
