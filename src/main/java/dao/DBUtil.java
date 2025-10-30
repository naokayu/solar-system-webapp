package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/solar_system";
    private static final String USER = "root"; 
    private static final String PASS = "pass"; 

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("✅ MySQLドライバ読み込み成功");
            return DriverManager.getConnection(URL, USER, PASS);
        } catch (ClassNotFoundException e) {
            throw new SQLException("ドライバが見つかりません: " + e.getMessage());
        }
    }

    // 接続テスト用 main()
    public static void main(String[] args) {
        try (Connection conn = getConnection()) {
            System.out.println("✅ 接続成功！");
        } catch (SQLException e) {
            System.out.println("❌ 接続失敗: " + e.getMessage());
        }
    }
}
