package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
    private static final String jdbcUrl = "jdbc:mysql://interchange.proxy.rlwy.net:41074/railway?user=root&password=PUltKYqJmyBoklImskytMnQQjHyaFCMA";
    private static Connection con = null;

    public static Connection getConnection() {
        if (con == null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(jdbcUrl);
            } catch (ClassNotFoundException | SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return con;
    }
}
