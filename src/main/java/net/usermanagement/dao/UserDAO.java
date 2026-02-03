package net.usermanagement.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.usermanagement.model.User;

public class UserDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin@2205";
    
    private static final String INSERT_USERS_SQL = "INSERT INTO user (name, email, country, state, city, gender) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SELECT_USER_BY_sr_no = "SELECT sr_no, name, email, country, state, city, gender FROM user WHERE sr_no = ?";
    private static final String SELECT_ALL_USERS = "SELECT * FROM user";  
    private static final String UPDATE_USERS_SQL = "UPDATE user SET name = ?, email = ?, country = ?, state = ?, city = ?, gender = ?  WHERE sr_no = ?";
    private static final String DELETE_USERS_SQL = "DELETE FROM user WHERE sr_no = ?";

    protected Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return conn;
    }

    // Create user
    public void insertUser(User user) throws SQLException {
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(INSERT_USERS_SQL)) {
            System.out.println("Inserting user: " + user.getName());
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getCountry());
            pstmt.setString(4, user.getState()); 
            pstmt.setString(5, user.getCity()); 
            pstmt.setString(6, user.getGender());
            pstmt.executeUpdate();
            System.out.println("User inserted successfully.");
        } catch (Exception e) {
            e.printStackTrace(); // Print stack trace for any error
        }
    }   
    // Update user
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        try (Connection conn = getConnection();
             PreparedStatement statement = conn.prepareStatement(UPDATE_USERS_SQL)) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getCountry());
            statement.setString(4, user.getState());
            statement.setString(5, user.getCity());
            statement.setString(6, user.getGender());
            statement.setInt(7, user.getSr_no());

            rowUpdated = statement.executeUpdate() > 0;
            System.out.println("Updated user: " + user.getName());
        }
        return rowUpdated;
    }
    // Select user by sr_no 
    public User selectUser(int sr_no) {
        User user = null;
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SELECT_USER_BY_sr_no)) {
            pstmt.setInt(1, sr_no);
            System.out.println("Executing query: " + pstmt);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                String state = rs.getString("state"); // Add this line
                String city = rs.getString("city"); // Add this line
                String gender = rs.getString("gender");
                user = new User(sr_no, name, email, country, state, city, gender);
            }
        } catch (SQLException e) {
            e.printStackTrace();  
        }
        return user;  
    }
    // Select all users
    public List<User> selectallusers() {
        List<User> user = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SELECT_ALL_USERS);) {
            System.out.println("Retrieving users from database."); 
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int sr_no = rs.getInt("sr_no");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                String state = rs.getString("state"); 
                String city = rs.getString("city"); 
                String gender = rs.getString("gender");

                user.add(new User(sr_no, name, email, country, state, city, gender));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("Number of users retrieved: " + user.size()); 
        return user;
    }

    // Delete user  
    public void deleteUser(int sr_no) throws SQLException {
        try (Connection conn = getConnection(); 
             PreparedStatement statement = conn.prepareStatement(DELETE_USERS_SQL)) {
            statement.setInt(1, sr_no);
            statement.executeUpdate();
            System.out.println("Deleted user with sr_no: " + sr_no);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
