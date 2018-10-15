<%@page import="com.milin.java.CustomersUser.Cuser"%>
<%@page import="com.milin.java.dao.UserDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	request.getRequestDispatcher("head.jsp").include(request, response);
%>
<%
	UserDAO userDao=new UserDAO();
	Cuser cuser=(Cuser)session.getAttribute("loginUser");
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
		<table class="tabLe">
			<thead class="tableHead">
				<tr>
					<td>
						列号
					</td>
					<td>
						用户名
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
				<tr>
					<td>
						<%=cuser.getId()%>
					</td>
					<td>
						<%=cuser.getEmail()%>
					</td>
					<td>
						<%=cuser.getName() %>
					</td>
					<td>
						<%=cuser.getGender() %>
					</td>
					<td>
						<%=cuser.getAddress() %>
					</td>
					<td>
						<%=cuser.getPhone() %>
					</td>
					<td>
						<%=cuser.getType() %>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="fromBox">
			<button id="btn1">更新密码</button>
			<form id="fromPassword" action="UpPassword.jsp" method="post">
				<input type="text" name="oldPassword" placeholder="旧密码" /><br />
				<input type="text" name="newPassword" placeholder="新密码" /><br />
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
