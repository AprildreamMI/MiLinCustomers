<%@ page language="java" contentType="text/html; charset=utf-8 " %>
<%@page import="com.milin.java.CustomersUser.Cuser"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>头部文件</title>
    <link rel="stylesheet" href="css/login.css" type="text/css">
  </head>
<body>
		<div class="w">
			<div class="imgTop">
				<img src="img/milinLog.png" width="300px" alt="密林"/>
			</div>
		    <div class="head">
		       	<% 
		       		if(session.getAttribute("loginUser")==null) { 
		       	%>	
		      			您尚未<a href="login.jsp">&nbsp;&nbsp;登陆</a>&nbsp;|&nbsp;<a href="login.jsp">注册</a>
		      	<%
		      		}else{
		      			Cuser loginUser=(Cuser)session.getAttribute("loginUser");
		      	 %>
		      	 		您好：<%=loginUser.getName() %>
		      	 		&nbsp;&nbsp;&nbsp;&nbsp;[<%=(loginUser.getType()).equals("base")? "普通用户":"管理员"%>]
		      	 		<%
			      	 		System.out.println("*====================================================*");
							System.out.println("*====================================================*");
			      	 		System.out.println(loginUser.getType());
		      	 		 %>
		      	 		<a href="login.jsp">登出</a>
		      	 <%
		      	 		if(loginUser.getType().equals("main")){
		      	 %>
		      	 			&nbsp;|&nbsp;&nbsp;|&nbsp;<a href="userList.jsp">用户管理</a>
		      	 <%	
		      	 	  }
		      	 
		      	 	}
		      	  %>
		    </div>
		</div>
</body>
</html>
