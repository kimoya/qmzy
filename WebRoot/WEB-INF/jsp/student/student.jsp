<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>学生窗口</title>
    
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-theme.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">

  </head>
  
  <body>
  <div class="container-fluid" style="padding-top: 20px;">
	<div class="row-fluid" >
		<div class="span12">
			<ul class="nav nav-pills">
				<li class="active">
					<a href="#">首页</a>
				</li>
				<li>
					<a href="downwork.action">通知</a>
				</li>
				<li>
					<a href="upwork.action">作业</a>
				</li>
				<li class="dropdown pull-right">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">下拉</a>
					<ul class="dropdown-menu">
						<li>
							<a href="#">操作</a>
						</li>
						<li>
							<a href="#">设置栏目</a>
						</li>
						<li>
							<a href="#">更多设置</a>
						</li>
						<li class="divider">
						</li>
						<li>
							<a href="logout.action">退出登录</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	<div class="row-fluid" style="padding-top: 20px;">
		<div class="span12">
		<!--  欢迎回来！${user.name}<!-- 想要显示登录的用户名！ -->
			<div class="tabbable" id="tabs-416038">
				<ul class="nav nav-tabs">
					<li class="active">
						<a data-toggle="tab" href="#panel-899638">我学的课</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-899638" style="padding-top: 20px;">
						<c:forEach items="${courses}" var="course" >
									<div style="width:250px;float:left; margin-left: 64px;" >
										<img src="${pageContext.request.contextPath}/images/kc.png" class="img-rounded"><br/>
										<center><c:out value="${course.course}"></c:out><br/>
										<p class="teachername"><c:out value="${course.teacher}"></c:out></p></center>
									</div>
								</c:forEach>
					</div>
				</div>
				</div>
				</div>
				</div>
				</div>
     <br>
     <script src=
       "${pageContext.request.contextPath}/js/jquery-1.11.3.min.js">
	</script>
    <!-- <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script> -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/npm.js"></script>
  </body>
</html>
