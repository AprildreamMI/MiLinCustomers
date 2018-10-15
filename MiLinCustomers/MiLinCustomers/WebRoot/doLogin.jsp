<%@ page language="java" contentType="text/html; charset=utf-8 " %>
<%@page import="com.milin.java.dao.UserDAO"%>
<%@page import="com.milin.java.CustomersUser.Cuser"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String userEmail=request.getParameter("c_Email");
	String userPassword=request.getParameter("c_Password");
	String userName=request.getParameter("c_Name");
	String userGender=request.getParameter("c_Gender");
	UserDAO userDao=new UserDAO();
	String msg="";
	if(userName=="")
	{
		Cuser cuser=(Cuser) session.getAttribute("loginUser");
		if(cuser==null)
		{
			cuser=userDao.ReturnCuser(userEmail);
			if(cuser!=null&&cuser.getPasswordString().equals(userPassword))
			{
				session.setAttribute("loginUser", cuser);
				response.sendRedirect("userMain.jsp");
			}else {
				msg="用户名或密码错误";
				session.setAttribute("msg", msg);
				response.sendRedirect("error.jsp");
				return;
			}
		}else {
				msg="重复登录,请刷新登录页面";
				session.setAttribute("msg", msg);
				response.sendRedirect("error.jsp");
				return;
		}
	}
	else {
			if(userEmail!=""&&userPassword!=""&&userName!=""&&userGender!="")
				if(userDao.FindUser(userEmail))
				{
					msg="用户名相同";
					session.setAttribute("msg", msg);
					response.sendRedirect("error.jsp");
					return;
				}else {
					Cuser newcuser=new Cuser(userEmail,userPassword,userName,userGender,"base");
					if(userDao.AddUser(newcuser)){
						msg="注册成功";
						session.setAttribute("msg", msg);
						response.sendRedirect("bingo.jsp");
						return;
					}else{
						msg="注册失败---表单填写错误";
						session.setAttribute("msg", msg);
						response.sendRedirect("error.jsp");
						return;
					}
				}
	}
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>doLogin</title>
  </head>
  
  <body>
  </body>
</html>
