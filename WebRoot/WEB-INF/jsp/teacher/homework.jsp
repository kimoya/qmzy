<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
  <title>作业 </title>
    <!-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-theme.css"> -->
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	
	<style>
		#bor{border-radius:5px}
	</style>
  </head>
  
  <body>
  <div class="container-fluid" >
  <div class="row-fluid" style="margin-top:10px">
    <div class="span12">
			<ul class="nav nav-pills">
				<li>
					<a href="login.action">首页</a>
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
					<a href="notice.action">通知</a>
				</li>
				<li class="active">
					<a href="#">作业</a>
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
		<button class="btn btn-primary" style="float:right;margin-right:30px;" data-target="#myModal" data-toggle="modal">新建作业</button>
			<div class="row" style="padding:10px;margin-top:34px">
			<c:forEach items="${homeworks}" var="course" >
    <div class="col-sm-6 col-md-2">
						<div class="caption" id="bor"><center>
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
							</p></center>
						</div>
    </div>
    </c:forEach>

    
   
</div>
	</div>
	</div>
	<form method="post" action="${pageContext.request.contextPath }/crhomework.action" class="form-horizontal" role="form" id="myForm" onsubmit="return " enctype="multipart/form-data">
        <div class="modal fade" id="myModal"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <!--  定义模态框，过渡效果为淡入，id为myModal,tabindex=-1可以禁用使用tab切换，aria-labelledby用于引用模态框的标题，aria-hidden=true保持模态框在触发前窗口不可见  -->
            <div class="modal-dialog">
                <!--  显示模态框对话框模型（若不写下一个div则没有颜色）  -->
                <div class="modal-content">
                    <!--  显示模态框白色背景，所有内容都写在这个div里面  -->
					
                    <div class="btn-info modal-header">
                        <!--  模态框标题  -->
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <!--  关闭按钮  -->
                        <h4>添加作业</h4>
                        <!--  标题内容  -->
                    </div>
                     <div class="modal-body">
					<div class="tabbable" id="tabs-416038" >
					
				<div class="modal-body">
                        <!--  模态框内容，我在此处添加一个表单 -->
                        <form class="form-horizontal" role="form" >
                            <div class="form-group">
                                <label for="uname" class="col-sm-2 control-label">课程名称</label>
                                <div class="col-sm-9">
                                    <select id="course1"></select>
                                    <input type="text" id="course2" name="course" style="display:none"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="upwd" class="col-sm-2 control-label">作业名字</label>
                                <div class="col-sm-9">
                                    <input type="text" id="upwd" name="workname" class="form-control well" placeholder="请输入教师名字"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="uname" class="col-sm-2 control-label">选择班级：</label>
                                <div class="col-sm-9">
                                    <select id="classname"></select>
                                    <input type="text" id="classId2" name="classId" style="display:none"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="uname" class="col-sm-2 control-label">上传文件</label>
                                <div class="col-sm-9">
                                    <input type="file" id="uname" name="filename" class="file"/>
                                </div>
                            </div>
							
                        </form>
                    </div>
                    </div>

                    <div class="modal-footer">
                        <!--  模态框底部样式，一般是提交或者确定按钮 -->
                        <button type="submit" class="btn btn-info">确定</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    </div>

                </div><!-- /.modal-content -->
            </div>
        </div> <!-- /.modal -->
    </form>
	<script src=
       "${pageContext.request.contextPath}/js/jquery-1.11.3.min.js">
	</script>
    <!-- <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script> -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/npm.js"></script>
  </body>
  <script>
		var classid;
		var courseid;
        $(document).ready(function(){
            $.ajax({
                contentType : "application/json;charset=utf-8",
                type : "POST",
                url : "http://localhost:8080/superstarpro/classlist.action",
                dataType : "json",
                success : function(data) {
                    $.each(data, function(i, city) {
                        $('#classname').append(
                                $('<option>').text(city.classname).attr('value',
                                        city.id));
                    });
                }
            });
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
             $('#course1').click(function(event){
            		couresid=$(this).val();
            		$("#course1").attr("value",couresid);
            		$("#course2").attr("value",couresid);
            });
            $("#classname").click(function(event){
            		classid=$(this).val();
            		$("#classId2").attr("value",classid);
            });
        });

    </script>
</html>
