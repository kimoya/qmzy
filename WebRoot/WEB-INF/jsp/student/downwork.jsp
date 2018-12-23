<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>查看作业</title>
    
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
				<li>
					<a href="mycourse.action">首页</a>
				</li>
				<li class="active">
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
	<div class="row" style="padding:10px;margin-top:34px">
	<c:forEach items="${homeworks}" var="course" >
	 <div class="col-sm-6 col-md-4">
						<div class="caption">
							<h3>
								<c:out value="${course.worktitle}"></c:out>
							</h3>
							<p>
								<c:out value="${course.courseName}"></c:out><br/>
								<c:out value="${course.classname }"></c:out><br/>
								<c:out value="${course.teachernName}"></c:out><br/>
							</p>
							<p>
								<a class="btn btn-primary" href="${pageContext.request.contextPath }/download.action?id=${course.id}">查看</a>
							</p>
						</div>
    </div>
    </c:forEach ></div>
	</div>
   <script src=
       "${pageContext.request.contextPath}/js/jquery-1.11.3.min.js">
	</script>
    <!-- <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script> -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/npm.js"></script>
  </body>
</html>
