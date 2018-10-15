package com.milin.java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import com.milin.java.CustomersUser.Cuser;

public class UserDAO 
{
	public BaseDAO baseDAO;
	public PreparedStatement pstmt=null;
	
	private Connection connection=null;
	private Statement statement=null;
	private ResultSet resultSet=null;
	
	/**
	 * @return ��ѯ�����û�-���������û�
	 */
	public Vector<Cuser> FindAllTmUsers()
	{
		try {
			baseDAO=new BaseDAO();
			connection=baseDAO.getConnection();
			statement=connection.createStatement();
			
			String sqlString="select * from customers";
			resultSet=statement.executeQuery(sqlString);
			
			Vector<Cuser> vTmUsers=new Vector<Cuser>();
			
			while (resultSet.next()) {
				vTmUsers.add(new Cuser(resultSet.getString("c_Id"), resultSet.getString("c_Email"), 
						resultSet.getString("c_Password"), resultSet.getString("c_Name"),resultSet.getString("c_Gender"),
						resultSet.getString("c_Address"),resultSet.getString("c_Phone"),resultSet.getString("c_Type")));
			}
			
			return vTmUsers;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("��ѯ�����û�����");
		}finally {
			try {
				resultSet.close();
				statement.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("��ѯ�����û�����");
			}
		}
		return null;
	}
	
	/**
	 * @param tmUser
	 * @return �����û��Ƿ����
	 */
	public boolean FindUser(String email)
	{
		try {
			baseDAO=new BaseDAO();
			connection=baseDAO.getConnection();
			
			String sql = "select * from customers where c_Email=?";
			
			pstmt=connection.prepareStatement(sql);
			
			pstmt.setString(1,email);
			
			resultSet=pstmt.executeQuery();
			
			if (resultSet.next()) {
				return true;
			}
			else {
				return false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("��ѯ��"+email+"����");
		}finally {
			try {
				resultSet.close();
				pstmt.close();
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("��ѯ��"+email+"����");
			}
		}
		
		return false;
	}
	
	/**
	 * @param email
	 * @return ��ѯ�������û�
	 */
	public Cuser ReturnCuser(String email)
	{
		try {
			baseDAO=new BaseDAO();
			connection=baseDAO.getConnection();
			
			String sql = "select * from customers where c_Email=?";
			
			pstmt=connection.prepareStatement(sql);
			
			pstmt.setString(1,email);
			
			resultSet=pstmt.executeQuery();
			if (resultSet.next()) {
				return new Cuser(resultSet.getString("c_Id"), resultSet.getString("c_Email"), 
						resultSet.getString("c_Password"), resultSet.getString("c_Name"),resultSet.getString("c_Gender"),
						resultSet.getString("c_Address"),resultSet.getString("c_Phone"),resultSet.getString("c_Type"));
			}
			else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("��ѯ��"+email+"����");
		}finally {
			try {
				resultSet.close();
				pstmt.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("��ѯ��"+email+"����");
			}
		}
		
		return null;
	}
	
	/**
	 * @param tmUser
	 * @return ����û�
	 */
	public boolean AddUser(Cuser tmUser)
	{	
		try {
			baseDAO=new BaseDAO();
			connection=baseDAO.getConnection();
			
			String sql = "insert into customers(c_Email,c_Password,c_Name,c_Gender,c_Type) values(?,?,?,?,?)";
			
			pstmt=(PreparedStatement) connection.prepareStatement(sql);
			
			pstmt.setString(1, tmUser.getEmail());
			pstmt.setString(2, tmUser.getPasswordString());
			pstmt.setString(3, tmUser.getName());
			pstmt.setString(4, tmUser.getGender());
			pstmt.setString(5, "base");
			
			int i=pstmt.executeUpdate();
			
			if (i==1) {
				return true;
			}else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("����û���"+tmUser.getEmail()+"����");
		}finally {
			try {
				pstmt.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("����û���"+tmUser.getEmail()+"����");
			}
		}

		return false;
	}
	
	/**
	 * @param tmUser
	 * @return ��������
	 */
	public boolean UpdataeUser(Cuser tmUser)
	{
		try {
			baseDAO=new BaseDAO();
			connection=baseDAO.getConnection();
			
			String sql = "update customers set  c_Password=? where c_Email=?";
			
			pstmt=connection.prepareStatement(sql);
			
			pstmt.setString(1, tmUser.getPasswordString());
			pstmt.setString(2, tmUser.getEmail());
			
			int i=pstmt.executeUpdate();
			if (i==1) {
				return true;
			}else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(tmUser.getEmail()+"�޸��������");
		}
		finally {
			try {
				pstmt.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println(tmUser.getEmail()+"�޸��������");
			}
		}
		
		return false;
	}
	
	/**
	 * @param tmUser
	 * @return ɾ���û�
	 */
	public boolean DeleteUser(String email)
	{
		try {
			baseDAO=new BaseDAO();
			connection=baseDAO.getConnection();
			
			String sql = "delete from customers where c_Email=?";
			
			pstmt=connection.prepareStatement(sql);
			
			pstmt.setString(1, email);
			
			int i=pstmt.executeUpdate();
			if (i==1) {
				return true;
			}else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("ɾ����"+email+"����");
		}
		finally {
			try {
				pstmt.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("ɾ����"+email+"����");
			}
		}
		return false;
	}
	
}
