/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author Aayuj
 */
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

import model.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class AuthenticationController {
 private static int currentUserId = 1;


 public static int getUserId(){
	 return currentUserId;
 };

	// User Registration Method

	public static boolean registerUser(String full_name, String phone, String email,String password) {
	
	

		try (Connection conn = DatabaseConnection.getConnection()) {
			String query = "INSERT INTO users (full_name, phone, email,password) VALUES (?, ?, ?,?)";
			PreparedStatement pstmt = conn.prepareStatement(query);

			pstmt.setString(1, full_name);
			pstmt.setString(2, phone);
			pstmt.setString(3, email);
			pstmt.setString(4, password);

			int rowsAffected = pstmt.executeUpdate();
			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	// Simple password hashing (Note: Use a more secure method in production)
	public static String hashPassword(String password) {
		return String.valueOf(password.hashCode());
	}

	// Login Method
	public static boolean loginUser(String email, String password) {
	
		
		try (Connection conn = DatabaseConnection.getConnection()) {
			String query = "SELECT * FROM users WHERE email = ? AND password = ?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				currentUserId = rs.getInt("id");
			

				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

		public static boolean updateUser(int userId, String name, String username) {
		try (Connection conn = DatabaseConnection.getConnection()) {
			String query = "UPDATE users SET name = ?, username = ? WHERE id = ?";
			PreparedStatement pstmt = conn.prepareStatement(query);

			pstmt.setString(1, name);
			pstmt.setString(2, username);
			pstmt.setInt(3, userId);

			int rowsAffected = pstmt.executeUpdate();
			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
}