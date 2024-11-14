package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import bean.ProductBean;
import db.DBconnection;

public class ProductDAO {
	public boolean insertProducts(ProductBean product) throws SQLException {
	    String sql = "INSERT INTO product (productName, category, price, stock, description, productImage) VALUES (?, ?, ?, ?, ?, ?)";
	    try (Connection conn = DBconnection.getConnection(); 
	         PreparedStatement stmt = conn.prepareStatement(sql)) {
	        
	        // Set parameters
	        stmt.setString(1, product.getProductName());
	        stmt.setString(2, product.getCategory());
	        stmt.setDouble(3, product.getPrice());
	        stmt.setString(4, product.getStock());
	        stmt.setString(5, product.getDescription());
	        stmt.setString(6, product.getProductImage());

	        int affectedRows = stmt.executeUpdate();
	        
	        return affectedRows > 0; // Return true if rows were affected (successful insert), false otherwise
	    } catch (SQLException e) {
	        System.out.println("Error while inserting product: " + e.getMessage());
	        return false; // Return false in case of an error
	    }
	}

		public ProductBean getUserById(int productId) throws SQLException { 
			String sql = "SELECT * FROM product WHERE productId = ?"; 
			try (Connection conn = DBconnection.getConnection();
				  PreparedStatement stmt = conn.prepareStatement(sql)) { 
				stmt.setInt(1, productId);
				  ResultSet rs = stmt.executeQuery(); if (rs.next()) {
					  return new
				ProductBean(rs.getInt("productId"), rs.getString("productName"), rs.getString("category"), rs.getDouble("price"), rs.getString("stock"), rs.getString("description"), rs.getString("productImage")); } }
				  return null;
				  }
	
		public boolean updateProduct(ProductBean product) throws SQLException {
		    String sql = "UPDATE product SET productName = ?, category = ?, price = ?, stock = ?, description = ?, productImage = ? WHERE productId = ?";
		    try (Connection conn = DBconnection.getConnection();
		         PreparedStatement stmt = conn.prepareStatement(sql)) {
		        
		        stmt.setString(1, product.getProductName());
		        stmt.setString(2, product.getCategory());
		        stmt.setDouble(3, product.getPrice());
		        stmt.setString(4, product.getStock());
		        stmt.setString(5, product.getDescription());
		        stmt.setString(6, product.getProductImage());
		        stmt.setInt(7, product.getProductId());
		        
		        int rowsUpdated = stmt.executeUpdate();
		        return rowsUpdated > 0; // Return true if product was updated successfully
		    }
		}


	    // Method to delete a user by userRegID
	    public boolean deleteProducts(int productId) throws SQLException {
	        String sql = "DELETE FROM product WHERE productId = ?";

	        try (Connection conn = DBconnection.getConnection(); 
	             PreparedStatement stmt = conn.prepareStatement(sql)) {
	            
	            stmt.setInt(1, productId);
	            int affectedRows = stmt.executeUpdate();
	            return affectedRows > 0;
	        }
	    }
	    
	    public List<ProductBean> getAllProducts() throws SQLException {
	        List<ProductBean> productList = new ArrayList<>();
	        String sql = "SELECT * FROM product";  // Correct SQL query
	        try (Connection conn = DBconnection.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(sql);
	             ResultSet rs = stmt.executeQuery()) {
	            
	            while (rs.next()) {
	                // Add each product to the list
	                ProductBean product = new ProductBean(
	                    rs.getInt("productId"),
	                    rs.getString("productName"),
	                    rs.getString("category"),
	                    rs.getDouble("price"),
	                    rs.getString("stock"),
	                    rs.getString("description"),
	                    rs.getString("productImage")
	                );
	                productList.add(product);
	            }
	        }
	        return productList;
	    }
	    public ProductBean getProductById(int productId) throws SQLException { 
	        String sql = "SELECT * FROM product WHERE productId = ?"; 
	        try (Connection conn = DBconnection.getConnection();
	              PreparedStatement stmt = conn.prepareStatement(sql)) { 
	            stmt.setInt(1, productId);
	            ResultSet rs = stmt.executeQuery(); 
	            if (rs.next()) {
	                return new ProductBean(
	                    rs.getInt("productId"), 
	                    rs.getString("productName"),
	                    rs.getString("category"), 
	                    rs.getDouble("price"), 
	                    rs.getString("stock"), 
	                    rs.getString("description"), 
	                    rs.getString("productImage")
	                ); 
	            }
	        }
	        return null;
	    }

	    public List<String> getAllStockStatuses() throws SQLException {
	        List<String> stockStatuses = new ArrayList<>();
	        String sql = "SELECT status FROM stock_table";

	        try (Connection connection = DBconnection.getConnection();
	             PreparedStatement statement = connection.prepareStatement(sql);
	             ResultSet resultSet = statement.executeQuery()) {

	            while (resultSet.next()) {
	                String status = resultSet.getString("status");
	                stockStatuses.add(status);
	            }
	        }

	        return stockStatuses;
	    }
	    public int getCountProducts() throws SQLException {
	        int totalProducts = 0;  // Variable to store the total count
	        
	        String countSql = "SELECT COUNT(*) FROM product";  // Query to get the count of products
	        
	        try (Connection conn = DBconnection.getConnection();
	             PreparedStatement countStmt = conn.prepareStatement(countSql);
	             ResultSet countRs = countStmt.executeQuery()) {
	            
	            if (countRs.next()) {
	                totalProducts = countRs.getInt(1);  // Get the total count of products
	            }
	            
	        }
	        return totalProducts;  // Return the count
	    }


	    public ProductBean getProductsById(int productId) throws SQLException { 
	        String sql = "SELECT product.productId, product.productName, product.price, product.stock, product.description, product.productImage "
	                   + "FROM product "
	                   + "WHERE product.productId = ?"; 

	        try (Connection conn = DBconnection.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(sql)) { 

	            stmt.setInt(1, productId);
	            ResultSet rs = stmt.executeQuery(); 

	            if (rs.next()) {
	                return new ProductBean(
	                    rs.getInt("productId"), 
	                    rs.getString("productName"),
	                    "",  // Empty string for categoryName since it's not needed
	                    rs.getDouble("price"), 
	                    rs.getString("stock"), 
	                    rs.getString("description"), 
	                    rs.getString("productImage")
	                ); 
	            }
	        }
	        return null;
	    }

	}


