<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>登录页面</title>
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js">
	</script>
	<script>
	function check(){
		var usercode = $("#usercode").val();
    	var password = $("#password").val();
    	if(usercode=="" || password==""){
    	$("#message").text("账号或密码不能为空！");
        return false;
    }  
    return true;
	}
	</script>
  </head>
  <body style="background:url(${pageContext.request.contextPath}/images/bg.jpg)">
		<div style="padding-top: 100px;">
			<h1><center>用户登录</center></h1>
			<div style="padding-bottom: 40px;padding-left: 400px;" >
				<font color="red">
					<span id="message">${msg}</span>
				</font>
				<form action="${pageContext.request.contextPath }/login.action" 
			                       method="post" onsubmit="return check()">
			                       <br />
					<p>杭州电子科技大学信息工程学院</p>
          账&nbsp;号：<input id="usercode" type="text" name="usercode" />
          <br /><br />
          密&nbsp;码：<input id="password" type="password" name="password" />
          <br /><br />
          <input type="submit" value="登录" />
				</form>
			</div>
		</div>
 	</body>
</html>
