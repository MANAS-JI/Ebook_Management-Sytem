package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

	private static Connection conn = null;
	public static Connection getConnection () {
		try {
			if(conn == null) {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook-app","root","Manasji@10");
			return conn;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
