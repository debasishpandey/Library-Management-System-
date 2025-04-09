package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
   private static final String jdbcUrll = "jdbc:mysql://interchange.proxy.rlwy.net:41074/railway?user=root&password=PUltKYqJmyBoklImskytMnQQjHyaFCMA";

    public  Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(jdbcUrll);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
        return con;
    }
}
