
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.CategoryBean;
import db.DBconnection;

public class CategoryDAO {

    // Insert a new category into the database
    public boolean insertCategory(CategoryBean category) throws SQLException {
        String sql = "INSERT INTO category (categoryName) VALUES (?)";
        
        try (Connection conn = DBconnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setString(1, category.getCategoryName());
            int affectedRows = stmt.executeUpdate();
            
            return affectedRows > 0; // Return true if insertion is successful
        } catch (SQLException e) {
            System.out.println("Error while inserting category: " + e.getMessage());
            return false; // Return false in case of an error
        }
    }

    // Retrieve all categories from the database
    public List<CategoryBean> getCategories() throws SQLException {
        List<CategoryBean> categories = new ArrayList<>();
        String sql = "SELECT * FROM category";
        
        try (Connection conn = DBconnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
             
            while (rs.next()) {
                CategoryBean category = new CategoryBean(rs.getInt("categoryId"), rs.getString("categoryName"));
                categories.add(category);
            }
        }
        return categories;
    }

    // Update a category in the database
    public boolean updateCategory(CategoryBean category) throws SQLException {
        String sql = "UPDATE category SET categoryName = ? WHERE categoryId = ?";
        
        try (Connection conn = DBconnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setString(1, category.getCategoryName());
            stmt.setInt(2, category.getCategoryId());
            int affectedRows = stmt.executeUpdate();
            
            return affectedRows > 0; // Return true if the update is successful
        } catch (SQLException e) {
            System.out.println("Error while updating category: " + e.getMessage());
            return false; // Return false in case of an error
        }
    }

    // Delete a category from the database
    public boolean deleteCategory(int categoryId) throws SQLException {
        String sql = "DELETE FROM category WHERE categoryId = ?";
        
        try (Connection conn = DBconnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setInt(1, categoryId);
            int affectedRows = stmt.executeUpdate();
            
            return affectedRows > 0; // Return true if the deletion is successful
        } catch (SQLException e) {
            System.out.println("Error while deleting category: " + e.getMessage());
            return false; // Return false in case of an error
        }
    }

    // Retrieve a category by ID
    public CategoryBean getCategoryById(int categoryId) throws SQLException {
        String sql = "SELECT * FROM category WHERE categoryId = ?";
        CategoryBean category = null;
        
        try (Connection conn = DBconnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setInt(1, categoryId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    category = new CategoryBean(rs.getInt("categoryId"), rs.getString("categoryName"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error fetching category by ID: " + e.getMessage());
        }
        return category;
    }
}
