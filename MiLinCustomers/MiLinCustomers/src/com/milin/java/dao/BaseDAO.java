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
	private static String DRIVER_MYSQL_DRIVER="com.mysql.jdbc.Driver";//ȥ���������ݿ�����ΪJDBC
	private static String URL_MYSOQ_URL="jdbc:mysql://127.0.0.1:3306/milintb?useUnicode=true&characterEncoding=utf8"; //ȷ�������ַ������ڸ��ַ�����ָ������Ҫ����
																		        //���ݿ������milintb��ʹ�õ����ݿ������MySql
	
	private static String SQLNAME_MYSQL_NAME = "root";
	private static String SQLPASSWORD_MYSQL_PASSWORD = "asdzxc456";
	
	private static Connection Connection_CON = null;
	private static Statement Statement_STMT= null;
	private static ResultSet ResultSet_RS= null;                     //�����ѯ�����
	private static PreparedStatement PSTEMT=null;
	
	/**
	 * ֱ�ӳ�ʼ��
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
	 * @return ��ȡConnection
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
				System.out.println("�������˻�����url����");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("���ݿ���������ʧ��");
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
