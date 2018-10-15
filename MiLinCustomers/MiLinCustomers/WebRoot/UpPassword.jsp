<%@page import="com.milin.java.dao.UserDAO"%>
<%@page import="com.milin.java.CustomersUser.Cuser"%>
<%@ page language="java" contentType="text/html; charset=utf-8 " %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	UserDAO userDao=new UserDAO();
	Cuser cuser=(Cuser)session.getAttribute("loginUser");
	
	String CPassword=cuser.getPasswordString();
	String FoldPassword=request.getParameter("oldPassword");
	String FnewPassword=request.getParameter("newPassword");
	if(CPassword.equals(FoldPassword))
	{
		Cuser pCuser=new Cuser(cuser.getEmail(),FnewPassword);
		if(userDao.UpdataeUser(pCuser))
		{
			String msg="修改密码成功";
			session.setAttribute("msg", msg);
			response.sendRedirect("bingo.jsp");
		}else {
			String msg="修改密码失败";
			session.setAttribute("msg", msg);
			response.sendRedirect("error.jsp");
		}
	}else{
		String msg="原密码不正确,修改密码失败";
		session.setAttribute("msg", msg);
		response.sendRedirect("error.jsp");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>更新用户密码</title>
    

  </head>
  
  <body>
  
  </body>
</html>
