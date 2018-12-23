<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
   <title>通知</title>
    
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-theme.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
  </head>
  
  <body>
  <div class="row-fluid" style="margin-top:10px">
  		<div class="span12">
			<ul class="nav nav-pills">
				<li class="active">
					<a href="toteacher.action">首页</a>
				</li>
				<li>
					<a href="#">活动</a>
				</li>
				<li>
					<a href="#">统计</a>
				</li>
				<li>
					<a href="#">资料</a>
				</li>
				<li>
					<a href="#">通知</a>
				</li>
				<li>
					<a href="homework.action">作业</a>
				</li>
				<li>
					<a href="manage.action">管理</a>
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
							<a href="#">退出登录</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="form-group">
    		<label for="name" style="    margin: 5px;">选择课程</label>
			<select id="course1" class="form-control" style="width: 150px;    margin-top: 3px;"></select>
		</div>
		<div class="span12">
			<table class="table">
				<thead>
					<tr>
						<th>
							编号
						</th>
						<th>
							作业标题
						</th>
						<th>
							学生姓名
						</th>
						<th>
							文件名
						</th>
					</tr>
				</thead>
				<tbody id="workList">
					
				</tbody>
			</table>
		</div>
	</div>
  <script src=
       "${pageContext.request.contextPath}/js/jquery-1.11.3.min.js">
	</script>
    <!-- <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script> -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/npm.js"></script>
  </body>
  <script>
  $(document).ready(function(){
  			$.ajax({
                contentType : "application/json;charset=utf-8",
                type : "POST",
                url : "http://localhost:8080/superstarpro/courseList.action",
                dataType : "json",
                success : function(data) {
                    $.each(data, function(i, city) {
                        $('#course1').append(
                                $('<option>').text(city.course).attr('value',
                                        city.id));
                    });
                }
            });
            $.ajax({
                contentType : "application/json;charset=utf-8",
                type : "POST",
                url : "http://localhost:8080/superstarpro/stuWrokList.action",
                dataType : "json",
                data:'{id:"'+1+'"}',
                success : function(data) {
                	$("#workList").html("");
                    $.each(data, function(i, city) {
                        $('#workList').append('<tr class="info"><td>'+i+'</td><td>'+city.worktitle+'</td><td>'+city.studentname+'</td><td><a href="http://localhost:8080/superstarpro/dowloadStuWork.action?file='+city.workname+'">'+city.workname+'</a></td></tr>');
                    });
                }
            });
            $('#course1').click(function(event){
            		var couresid=$(this).val();
            		if(couresid==""||couresid===""){
            		return;
            		}
            		$.ajax({
                contentType : "application/json;charset=utf-8",
                type : "POST",
                url : "http://localhost:8080/superstarpro/stuWrokList.action",
                dataType : "json",
                data:'{id:"'+couresid+'"}',
                success : function(data) {
                	$("#workList").html("");
                    $.each(data, function(i, city) {
                        $('#workList').append('<tr class="info"><td>'+i+'</td><td>'+city.worktitle+'</td><td>'+city.studentname+'</td><td><a href="http://localhost:8080/superstarpro/dowloadStuWork.action?file='+city.workname+'">'+city.workname+'</a></td></tr>');
                    });
                }
            });
            });
            });
  </script>
</html>
