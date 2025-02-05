package controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Aayuj
 */
import model.Product;
import model.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.*;
import java.util.List;



public class ProductController {


	public static boolean addProduct(String food_name, String category , String description, String ingredient, String instruction) {
		try (Connection conn = DatabaseConnection.getConnection()) {
			String query = "INSERT INTO product (food_name, category, description,ingredient,instruction) VALUES (?, ?, ?,?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(query);

			pstmt.setString(1, food_name);
			pstmt.setString(2, category);
			pstmt.setString(3, description);
			pstmt.setString(4, ingredient);
                        pstmt.setString(5, instruction);

			int rowsAffected = pstmt.executeUpdate();
			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
           
	}
        
        public static boolean updateProduct(int userId,String food_name, String category , String description, String ingredient, String instruction) {
		try (Connection conn = DatabaseConnection.getConnection()) {
			String query = "update product set food_name = ?, category = ?, description = ? ,ingredient = ? ,instruction = ? where id = ? ";
			PreparedStatement pstmt = conn.prepareStatement(query);

			pstmt.setString(1, food_name);
			pstmt.setString(2, category);
			pstmt.setString(3, description);
			pstmt.setString(4, ingredient);
                        pstmt.setString(5, instruction);
                        pstmt.setInt(6, userId);
                        
			int rowsAffected = pstmt.executeUpdate();
			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
           
	}
        
                public static boolean deleteProduct(int userId) {
		try (Connection conn = DatabaseConnection.getConnection()) {
			String query = "delete from product where id = ? ";
			PreparedStatement pstmt = conn.prepareStatement(query);

                        pstmt.setInt(1, userId);
                        
			int rowsAffected = pstmt.executeUpdate();
			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
           
	}
                
              
                public static List<Product> fetchAllProducts() {
		List<Product> products = new ArrayList<>();

		try (Connection conn = DatabaseConnection.getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery("SELECT * FROM product")) {

			while (rs.next()) {
				Product product = new Product(
						rs.getInt("id"),
						rs.getString("food_name"),
						rs.getString("category"),
						rs.getString("description"),
						rs.getString("ingredient"),
						rs.getString("instruction")
					
				);
				products.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

		return products;
	}
                
        


// Overloaded method to fetch product by ID
public static Object[] fetchProduct(int productId) {
    try (Connection conn = DatabaseConnection.getConnection()) {
        String query = "SELECT id, food_name, category, description, ingredient, instruction FROM product WHERE id = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, productId);
        ResultSet rs = pstmt.executeQuery();
        
        if (rs.next()) {
            Object[] product = new Object[6];
            product[0] = rs.getInt("id");
            product[1] = rs.getString("food_name");
            product[2] = rs.getString("category");
            product[3] = rs.getString("description");
            product[4] = rs.getString("ingredient");
            product[5] = rs.getString("instruction");
            return product;
        }
        
        return null; // Return null if product not found
        
    } catch (SQLException e) {
        e.printStackTrace();
        return null;
    }
}
	
}
