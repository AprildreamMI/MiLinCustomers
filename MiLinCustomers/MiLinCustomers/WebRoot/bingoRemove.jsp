<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" contentType="text/html; charset=utf-8 " %>
<!DOCTYPE html>
<html lang="en">
  <head> 
    <title>成功</title>
    <link rel="stylesheet" href="css/login.css" type="text/css">
  </head>
  <body>
  <div class="w">
			<div class="imgTop">
				<img src="img/milinLog.png" width="300px" alt="密林"/>
			</div>
			<hr style="margin:50px 0px">
			<div align="center">
	        <font color="red">
	        	<%=session.getAttribute("msg") %>
	        </font>
	        <br>
	        <a href="javascript:history.back()">点击返回上一个页面</a>
    </div>
	</div>
  </body>
</html>
