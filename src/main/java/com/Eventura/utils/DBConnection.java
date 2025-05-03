package com.Eventura.utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

		private static String url = "jdbc:mysql://localhost:3306/eventplan";
		private static String user = "root";
		private static String pass = "Lukshan";
		private static Connection con;
		
		public static Connection getConnection(){
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection(url, user, pass);
			}
			catch(Exception e) {
				
				System.out.println("Database Not Connect !");
				e.printStackTrace();
			}
			return con;
		}
}
