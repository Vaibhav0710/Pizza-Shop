package com.sunbeam.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    private final static String URL = "jdbc:mysql://localhost:3306/pizzashop";
    private final static String USER_NAME = "D3_86907_Vaibhav";
    private final static String Password = "manager";

    public static Connection getconnection() throws SQLException {
        return DriverManager.getConnection(URL, USER_NAME, Password);
    }
}
