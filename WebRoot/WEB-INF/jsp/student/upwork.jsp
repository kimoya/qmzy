<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>上传作业</title>
    
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
				<li>
					<a href="downwork.action">通知</a>
				</li>
				<li class="active">
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
	<button class="btn btn-primary" style="float:right;margin-right:30px;" data-target="#myModal" data-toggle="modal">上传作业</button>
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
							课程名
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
	<form method="post" action="${pageContext.request.contextPath }/uphomework.action" class="form-horizontal" role="form" id="myForm" onsubmit="return " enctype="multipart/form-data">
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
                        <h4>上传作业</h4>
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
                                    <select id="workname"></select>
                                    <input type="text" id="workId" name="workId" style="display:none"/>
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
  $(document).ready(function(){
		  var courseid;
		  var workid;
  			$.ajax({
                contentType : "application/json;charset=utf-8",
                type : "POST",
                url : "http://localhost:8080/superstarpro/WrokList.action",
                dataType : "json",
                success : function(data) {
                	$("#workList").html("");
                    $.each(data, function(i, city) {
                        $('#workList').append('<tr class="info"><td>'+i+'</td><td>'+city.worktitle+'</td><td>'+city.coursename+'</td><td><a href="http://localhost:8080/superstarpro/dowloadStuWork.action?file='+city.workname+'">'+city.workname+'</a></td></tr>');
                    });
                }
            });
            
            $.ajax({
                contentType : "application/json;charset=utf-8",
                type : "POST",
                url : "http://localhost:8080/superstarpro/stuCourseList.action",
                dataType : "json",
                success : function(data) {
                	var tem=0;
                    $.each(data, function(i, city) {
                    	if(i==0){
	                    	courseid=city.id;
	                    	tem=city.id;
	                    	$("#course2").attr("value",city.id);
	                    	
	                    }
                        $('#course1').append(
                                $('<option>').text(city.course).attr('value',
                                        city.id));
                    });
                     $.ajax({
                contentType : "application/json;charset=utf-8",
                type : "POST",
                url : "http://localhost:8080/superstarpro/courseWrok.action",
                dataType : "json",
                data:'{id:"'+tem+'"}',
                success : function(data) {
                	$("#workname").html("");
                    $.each(data, function(i, city) {
                    	if(i==0){
                    		$("#workId").attr("value",city.id);
                    	}
                       $('#workname').append(
                                $('<option>').text(city.worktitle).attr('value',
                                        city.id));
                    });
                    }
            });
                }
            });
           
            $("#workname").click(function(){
            	workid=$(this).val();
            		if(workid==""||workid===""){
            		return;
            		}
            		$("#workId").attr("value",workid);
            })
            $("#course1").click(function(){
            	var couresid=$(this).val();
            		if(couresid==""||couresid===""){
            		return;
            		}
            		$("#course2").attr("value",couresid);
            		$.ajax({
                contentType : "application/json;charset=utf-8",
                type : "POST",
                url : "http://localhost:8080/superstarpro/courseWrok.action",
                dataType : "json",
                data:'{id:"'+couresid+'"}',
                success : function(data) {
                	$("#workname").html("");
                    $.each(data, function(i, city) {
                    if(i==0){
                    	workid=city.id;
                    	$("#workId").attr("value",workid);
                    }
                       $('#workname').append(
                                $('<option>').text(city.worktitle).attr('value',
                                        city.id));
                    });
                }
            });
            });
            });
  </script>
</html>
