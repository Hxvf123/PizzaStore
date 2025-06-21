package Models.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Models.DTO.Account;
import java.sql.DriverManager;

public class AccountDAO {

    public Connection getConnection() throws Exception {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;database=PizzaShop";
            Connection cnn = DriverManager.getConnection(url, "sa", "12345");
            return cnn;
        } catch (ClassNotFoundException | SQLException ex) {
            throw ex;
        }
    }

    public Account login(String userID, String password) throws Exception {
        Account account = null;
        Connection cnn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        try {
            cnn = getConnection();
            String sql = "SELECT UserID, FullName, Type FROM Users WHERE UserID = ? AND Password = ?";
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, userID);
            preStm.setString(2, password); 
            rs = preStm.executeQuery();
            if (rs.next()) {
                String fullName = rs.getString("FullName");
                int type = rs.getInt("Type");
                account = new Account(userID, password, fullName, type);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (preStm != null) {
                preStm.close();
            }
            if (cnn != null) {
                cnn.close();
            }
        }
        return account;
    }

    public boolean register(String userID, String password, String fullName, int type) throws Exception {
        Connection cnn = null;
        PreparedStatement preStm = null;
        try {
            cnn = getConnection();
            String sql = "INSERT INTO Users (UserID, Password, FullName, Type) VALUES (?, ?, ?, ?)";
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, userID);
            preStm.setString(2, password);
            preStm.setString(3, fullName);
            preStm.setInt(4, type);
            int rows = preStm.executeUpdate();
            return rows > 0;
        } catch (Exception ex) {
            throw ex;
        } finally {
            if (preStm != null) {
                preStm.close();
            }
            if (cnn != null) {
                cnn.close();
            }
        }
    }

    

    
}
