package com.milin.java.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class BaseDAO 
{
	private static String DRIVER_MYSQL_DRIVER="com.mysql.jdbc.Driver";//去顶连接数据库驱动为JDBC
	private static String URL_MYSOQ_URL="jdbc:mysql://127.0.0.1:3306/milintb?useUnicode=true&characterEncoding=utf8"; //确定链接字符串，在该字符串中指出了需要连接
																		        //数据库的名字milintb及使用的数据库管理工具MySql
	
	private static String SQLNAME_MYSQL_NAME = "root";
	private static String SQLPASSWORD_MYSQL_PASSWORD = "asdzxc456";
	
	private static Connection Connection_CON = null;
	private static Statement Statement_STMT= null;
	private static ResultSet ResultSet_RS= null;                     //保存查询结果集
	private static PreparedStatement PSTEMT=null;
	
	/**
	 * 直接初始化
	 */
	public BaseDAO() 
	{
		try {	
			Class.forName(DRIVER_MYSQL_DRIVER);
			Connection_CON=DriverManager.getConnection(URL_MYSOQ_URL, SQLNAME_MYSQL_NAME, SQLPASSWORD_MYSQL_PASSWORD);
			Statement_STMT=Connection_CON.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @return 获取Connection
	 */
	public Connection getConnection()
	{
		try {
			Class.forName(DRIVER_MYSQL_DRIVER);
			try {
				Connection_CON=DriverManager.getConnection(URL_MYSOQ_URL, SQLNAME_MYSQL_NAME, SQLPASSWORD_MYSQL_PASSWORD);
				return Connection_CON;
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("密码或或账户名及url错误");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("数据库驱动连接失败");
		}
		return null;
	}
	
	public void close()
	{
		try {
			ResultSet_RS.close();
			Statement_STMT.close();
			Connection_CON.close();
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
}
