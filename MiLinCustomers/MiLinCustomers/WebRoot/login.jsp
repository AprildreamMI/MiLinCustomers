<%@ page language="java" contentType="text/html; charset=utf-8 " %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	session.setAttribute("loginUser", null);
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>登陆密林</title>
	<link rel="stylesheet" href="css/login.css" type="text/css">
</head>
<script src="js/jquery1.0.0.1.js"></script>
<script>
	window.onload=function ()
	{
	    var fromBox=document.getElementById("fromBox");
		var lognBox=document.getElementsByClassName("lognBox")[0];
		var signBox=document.getElementsByClassName("signBox")[0];
	    var sign1=document.getElementById("sign1");
	    var sign2=document.getElementById("sign2");
        var span=document.getElementsByClassName("txt")[0];
		var inputAtt=document.getElementsByTagName("input");
		var namederd=document.getElementsByClassName("Namegendr")[0];
	    sign1.onclick=function () {
	        hien(lognBox);
	        show(signBox);
	        show(namederd);
		}
		sign2.onclick=function () {
			hien(signBox);
			hien(namederd);
			show(lognBox);

        }

		for(var i=0;i<inputAtt.length;i++)
		{
		    inputAtt[i].index=i;
            inputAtt[i].onblur=function () {
                if((/^[\w\-\.]+\@[\w]+\.[\w]{2,4}$/.test(document.getElementById("inputEmail").value))&&(/^[\$a-zA-Z0-9_-]{6,18}$/.test(document.getElementById("inputPassword").value)))
                {
                    lognBox.children[0].disabled=false;
                    span.style.color="green";
                    span.innerHTML="恭喜您,输入正确！";
                    if(this.index>1)
					{

                        if((/^[\u4e00-\u9fa5]{2,4}$/.test(document.getElementById("inputName").value))&&(/^(男|女)$/.test(document.getElementById("inputGender").value)))
                        {
                            signBox.children[0].disabled=false;
                            span.style.color="green";
                            span.innerHTML="恭喜您,输入正确！";
                        }else {
                            signBox.children[0].disabled=true;
                            span.style.color="red";
                            span.innerHTML="格式错误,请重新输入,或点击下输入框外";
                        }
					}
                }else {
                    lognBox.children[0].disabled=true;
                    span.style.color="red";
                    span.innerHTML="格式错误,请重新输入,或点击下输入框外";
                }
            }
		}
	}
</script>
<body>
<div class="main">
	<div class="w">
		<div class="imgTop">
			<img src="img/milinLog.png" width="300px" alt="密林"/>
		</div>
		<h1>请使用版本较高浏览器打开</h1>
		<div class="login">
			<form  id="fromBox" action="doLogin.jsp" method="post">
				<input id="inputEmail" type="text" name="c_Email" placeholder="邮箱:" /><br />
				<input id="inputPassword" type="password" name="c_Password" placeholder="密  码" /><br />
				<div class="Namegendr">
					<input id="inputName" type="text" name="c_Name" placeholder="姓名:中文" /><br />
					<input id="inputGender" type="text" name="c_Gender" placeholder="性  别：男||女" /><br />
				</div>
				<div class="txt">

				</div>
				<div class="lognBox">
					<button id="logn1" type=submit>登陆</button>
					<button id="sign1" type=reset> 注册</button>
				</div>
				<div class="signBox">
					<button id="logn2" type=submit>提交</button>
					<button id="sign2" type=reset>取消</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>

