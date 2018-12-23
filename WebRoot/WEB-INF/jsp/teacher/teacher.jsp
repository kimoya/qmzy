<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>教师窗口</title>
    
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-theme.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<style>
		#im{
			padding-top:10px;
		}
	</style>
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
						<a data-toggle="tab" href="#panel-899638">我教的课</a>
					</li>
					<li>
						<a data-toggle="tab" href="#panel-220408">我学的课</a>
					</li>
				</ul>
				<div id="createClass" style="float:right;margin-top: -36px;"><button class="btn btn-primary" data-toggle="modal" data-target="#myModal">创建课程</button></div>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-899638">
						<div id="im">
								<input type="text" id="teacherName" name="teacherName"/>
								<button class="btn btn-primary" id="searchTeacher">查询课程</button><br/>
									<div style="width:750px;margin-top: 20px;" id="classes">
								<c:forEach items="${courses}" var="course" >
									<div style="width:250px;float:left; margin-left: 64px;" >
										<img src="${pageContext.request.contextPath}/images/kc.png" class="img-rounded"><br/>
										<center><c:out value="${course.course}"></c:out><br/>
										<p class="teachername"><c:out value="${course.teacher}"></c:out></p></center>
									</div>
								</c:forEach>
								<center><!-- style="margin: 47px;" -->
							<ul class="pagination" >
								<c:if test="${nowPage != 1}">
							    <li><a href="${pageContext.request.contextPath }/page.action?page=${nowPage-1}">&laquo;</a></li>
							    </c:if>
							    <c:if test="${nowPage == 1}">
							    <li><a href="#">&laquo;</a></li>
							    </c:if>
							    <c:forEach items="${count}" var="c" >
							    <li><a href="${pageContext.request.contextPath }/page.action?page=${c}"><c:out value="${c}"></c:out></a></li>
							    </c:forEach>
							    
							    <li><a href="#">&raquo;</a></li>

							    
							</ul></center>
								</div>
							</div>
							
					</div>
					<div class="tab-pane" id="panel-220408">
						<p>
							你目前没有学习的课程
						</p>
					</div>
				</div>
				
			</div>
			
		</div>
		
	</div>
	
</div>

<form method="post" action="${pageContext.request.contextPath }/create.action" class="form-horizontal" role="form" id="myForm" onsubmit="return ">
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
                        <h4>新建课程</h4>
                        <!--  标题内容  -->
                    </div>

                    <div class="modal-body">
                        <!--  模态框内容，我在此处添加一个表单 -->
                        <form class="form-horizontal" role="form" >
                            <div class="form-group">
                                <label for="uname" class="col-sm-2 control-label">课程名称</label>
                                <div class="col-sm-9">
                                    <input type="text" id="uname" name="course" class="form-control well" placeholder="请输入课程名"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="upwd" class="col-sm-2 control-label">教师</label>
                                <div class="col-sm-9">
                                    <input type="text" id="upwd" name="teacher" class="form-control well" placeholder="请输入教师名字"/>
                                </div>
                            </div>
                        </form>
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
  		$("#createClass").click();
  		$("#searchTeacher").click(function(){
  			var teachername=$("#teacherName").val();
  			$.ajax({
                contentType : "application/json;charset=utf-8",
                type : "POST",
                url : "http://localhost:8080/superstarpro/searchClassByName.action",
                dataType : "json",
                data:'{teachernamechar:"'+teachername+'"}',
                success : function(data) {
                	$("#classes").html("");
                    $.each(data, function(i, city) {
                        $('#classes').append(
                                '<div style="width:250px;float:left; margin-left: 64px;" ><img src="${pageContext.request.contextPath}/images/kc.png" class="img-rounded"><br/><center>'+city.course+'<br/><p class="teachername">'+city.teacher+'</p></center></div>');
                    });
                }
            });
  		});
});
	function createClasses(){
		var form_data = $("#form_data").serialize();
        alert(form_data);
	}
 </script>
</html>
