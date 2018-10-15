<%@page import="com.milin.java.CustomersUser.Cuser"%>
<%@page import="com.milin.java.dao.UserDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	request.getRequestDispatcher("head.jsp").include(request, response);
%>
<%
	UserDAO userDao=new UserDAO();
	List<Cuser> list;
	list=userDao.FindAllTmUsers();
 %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>用户首页</title>
    <link rel="stylesheet" href="css/login.css" type="text/css">
  </head>
  <script src="js/jquery1.0.0.1.js"></script>
  <body>
	   <div class="boxTable">
		<table class="tabLe" style="width:750px;height:250px">
			<thead class="tableHead">
				<tr>
					<td>
						列号
					</td>
					<td>
						用户名
					</td>
					<td>
						密码
					</td>
					<td>
						姓名
					</td>
					<td>
						性别
					</td>
					<td>
						用户地址
					</td>
					<td>
						用户手机号
					</td>
					<td>
						用户类型
					</td>
				</tr>
			</thead>
			<tbody id="tableBody">
				<%
					for (int i = 0; i < list.size(); i++) {
						out.println("<tr>");
						out.println("<td>" + list.get(i).getId() + "</td>");
			   			out.println("<td>" + list.get(i).getEmail() + "</td>");
			   			out.println("<td>" + list.get(i).getName() + "</td>");
			   			out.println("<td>" + list.get(i).getPasswordString() + "</td>");
			   			out.println("<td>" + list.get(i).getGender() + "</td>");
			   			out.println("<td>" + list.get(i).getAddress() + "</td>");
			   			out.println("<td>" + list.get(i).getPhone() + "</td>");
			   			out.println("<td>" + list.get(i).getType() + "</td>");
			   			out.println("</tr>");
					}
				 %>
			</tbody>
		</table>
		<div class="fromBox">
			<button id="btn1">删除用户</button>
			<form id="fromPassword" action="ReomveUser.jsp" method="post">
				<input type="text" name="userName" placeholder="要删除的用户邮箱" /><br />
				<div class="signBox2" style="text-align: left">
					<button id="logn2" type=submit>提交</button>
					<button id="sign2" type=reset>取消</button>
				</div>
			</form>
		</div>
	</div>
  </body>
	  <script>
		var tableBody=document.getElementById("tableBody");
		var trArr=tableBody.children;
		var btn1=document.getElementById("btn1");
		var frobox=document.getElementsByClassName("fromBox")[0];
		var sing2=document.getElementById("sign2");
		btn1.onclick=function () {
		    animate(frobox,{"height":500})
	    }
	    sing2.onclick=function () {
			animate(frobox,{"height":50})
	    }
		for(var i=0;i<trArr.length;i++)
			{
				if(i%2!==0)
					{
						trArr[i].style.backgroundColor="#a3a3a3";
					}
				else{
						trArr[i].style.backgroundColor="#ccc";
					}
			}
		
		for(var i=0;i<trArr.length;i++)
			{
				var color="";
				trArr[i].onmouseover=function () {
					color=this.style.backgroundColor;
					this.style.backgroundColor="#ffffff";
				}
				trArr[i].onmouseout=function () {
					this.style.backgroundColor=color;
				}
			}
	</script>
</html>
