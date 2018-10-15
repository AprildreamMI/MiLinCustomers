<%@page import="com.milin.java.dao.UserDAO"%>
<%@page import="com.milin.java.CustomersUser.Cuser"%>
<%@ page language="java" contentType="text/html; charset=utf-8 " %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	UserDAO userDao=new UserDAO();
	
	String userName=request.getParameter("userName");
	if(userDao.FindUser(userName))
	{
		if(userDao.DeleteUser(userName))
		{
			String msg="删除用户成功,请返回刷新页面";
			session.setAttribute("msg", msg);
			response.sendRedirect("bingoRemove.jsp");
		}else{
			String msg="删除用户失败，数据库出错";
			session.setAttribute("msg", msg);
			response.sendRedirect("bingoRemove.jsp");
		}
	}else{
		String msg="删除用户失败，不存在此用户";
		session.setAttribute("msg", msg);
		response.sendRedirect("bingoRemove.jsp");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>删除用户</title>
    

  </head>
  
  <body>
  
  </body>
</html>
