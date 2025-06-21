package Models.DAO;

import Models.DTO.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ProductDAO {

    public Connection getConnection() throws Exception {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;database=PizzaShop";
            Connection conn = DriverManager.getConnection(url, "sa", "12345");
            return conn;
        } catch (ClassNotFoundException | SQLException ex) {
            throw new Exception("Database connection error: " + ex.getMessage());
        }
    }


    public List<Product> getAllProducts() throws Exception {
        String productID, productName, productImage, description;
        double unitPrice;
        int quantity;
        Connection cnn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Product> productList = new ArrayList<>();

        try {
            cnn = getConnection();
            String sql = "SELECT * FROM Products";
            stmt = cnn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                productID = rs.getString("ProductID");
                productName = rs.getString("ProductName");
                unitPrice = rs.getDouble("UnitPrice");
                quantity = rs.getInt("Quantity");
                productImage = rs.getString("ProductImage");
                description = rs.getString("Description");

                Product product = new Product(productID, productName, unitPrice, quantity, productImage, description);
                productList.add(product);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (cnn != null) {
                cnn.close();
            }
        }
        return productList;
    }

    public boolean addProduct(Product product) throws Exception {
        String sql = "INSERT INTO Products (ProductID, ProductName, UnitPrice, Quantity, ProductImage, Description) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, product.getProductID());
            stmt.setString(2, product.getProductName());
            stmt.setDouble(3, product.getUnitPrice());
            stmt.setInt(4, product.getQuantity());
            stmt.setString(5, product.getProductImage());
            stmt.setString(6, product.getDescription());

            return stmt.executeUpdate() > 0;
        }
    }

    public boolean updateProduct(Product product) throws Exception {
        String sql = "UPDATE Products SET ProductName=?, UnitPrice=?, Quantity=?, ProductImage=?, Description=? WHERE ProductID=?";
        try (Connection conn = getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, product.getProductName());
            stmt.setDouble(2, product.getUnitPrice());
            stmt.setInt(3, product.getQuantity());
            stmt.setString(4, product.getProductImage());
            stmt.setString(5, product.getDescription());
            stmt.setString(6, product.getProductID());

            return stmt.executeUpdate() > 0;
        }

    }

    public boolean deleteProduct(String productID) throws Exception {
        String sql = "DELETE FROM Products WHERE ProductID=?";
        try (Connection conn = getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, productID);
            return stmt.executeUpdate() > 0;
        }
    }

    public List<Product> searchProducts(String searchValue) throws Exception {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT * FROM Products WHERE ProductName LIKE ? OR ProductID LIKE ?";
        try (Connection conn = getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, "%" + searchValue + "%");
            stmt.setString(2, "%" + searchValue + "%");
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String productID = rs.getString("ProductID");
                    String productName = rs.getString("ProductName");
                    double unitPrice = rs.getDouble("UnitPrice");
                    int quantity = rs.getInt("Quantity");
                    String productImage = rs.getString("ProductImage");
                    String description = rs.getString("Description");

                    Product product = new Product(productID, productName, unitPrice, quantity, productImage, description);
                    productList.add(product);
                }
            }
        }
        return productList;
    }

    public Product getProductByID(String productID) throws Exception {
        String sql = "SELECT * FROM Products WHERE ProductID=?";
        try (Connection conn = getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, productID);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String productName = rs.getString("ProductName");
                    double unitPrice = rs.getDouble("UnitPrice");
                    int quantity = rs.getInt("Quantity");
                    String productImage = rs.getString("ProductImage");
                    String description = rs.getString("Description");

                    return new Product(productID, productName, unitPrice, quantity, productImage, description);
                }
            }
        }
        return null;
    }

    public List<Product> searchByPrice(double minPrice, double maxPrice) throws Exception {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT * FROM Products WHERE UnitPrice BETWEEN ? AND ?";
        try (Connection conn = getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setDouble(1, minPrice);
            stmt.setDouble(2, maxPrice);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String productID = rs.getString("ProductID");
                    String productName = rs.getString("ProductName");
                    double unitPrice = rs.getDouble("UnitPrice");
                    int quantity = rs.getInt("Quantity");
                    String productImage = rs.getString("ProductImage");
                    String description = rs.getString("Description");

                    Product product = new Product(productID, productName, unitPrice, quantity, productImage, description);
                    productList.add(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("Error while searching products by price: " + e.getMessage());
        }
        return productList;
    }

    public List<Product> searchByName(String searchValue) throws Exception {
        List<Product> productList = new ArrayList<>();
        String sql = "SELECT * FROM Products WHERE ProductName LIKE ?";
        try (Connection conn = getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, "%" + searchValue + "%");
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String productID = rs.getString("ProductID");
                    String productName = rs.getString("ProductName");
                    double unitPrice = rs.getDouble("UnitPrice");
                    int quantity = rs.getInt("Quantity");
                    String productImage = rs.getString("ProductImage");
                    String description = rs.getString("Description");

                    Product product = new Product(productID, productName, unitPrice, quantity, productImage, description);
                    productList.add(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("Error while searching products by name: " + e.getMessage());
        }
        return productList;
    }

}
