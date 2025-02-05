/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Aayuj
 */


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

	private static final String URL = "jdbc:mysql://localhost:3306/receip";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "power123";

	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(URL, USERNAME, PASSWORD);
	}

	// Create database and table if not exists
	public static void initializeDatabase() {
		try {
			Connection conn = getConnection() ;
			// Create database
			conn.createStatement().execute("CREATE DATABASE IF NOT EXISTS receip");

			// Use the database
			conn.createStatement().execute("USE receip");

			// Create users table
			String createTableQuery = "CREATE TABLE IF NOT EXISTS users ("
					+ "id INT AUTO_INCREMENT PRIMARY KEY,"
					+ "name VARCHAR(100) NOT NULL,"
					+ "username VARCHAR(50) UNIQUE NOT NULL,"
					+ "password VARCHAR(255) NOT NULL,"
					+ "created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)";

			conn.createStatement().execute(createTableQuery);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}