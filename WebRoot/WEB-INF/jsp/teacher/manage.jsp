<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <head>
    
    <title>管理</title>
    
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
					<a href="notice.action">通知</a>
				</li>
				<li>
					<a href="homework.action">作业</a>
				</li>
				<li class="active">
					<a href="#">管理</a>
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
							<a href="#">分割线</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<h4>班级</h4>
			<div style="text-align:right;">
			<div id="createClass" style="float:right;margin-top: -36px;margin-right:30px;"><button class="btn" type="button" data-toggle="modal" data-target="#myModal">添加学生</button> 
			<button class="btn" type="button">导入名单</button></div></div>
			<form>
			选择班级：
				<select id="classname"></select>
				<br/><br/>
			</form> 
		</div>
	</div>
</div>
<div class="span12">
			<table class="table">
				<thead>
					<tr>
						<th>
							编号
						</th>
						<th>
							班级
						</th>
						<th>
							学生姓名
						</th>
						<th>
							联系电话
						</th>
					</tr>
				</thead>
				<tbody id="workList">
					
				</tbody>
			</table>
		</div>
</div>

<form method="post" action="${pageContext.request.contextPath }/crstudent.action" class="form-horizontal" role="form" id="myForm" onsubmit="return ">
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
                        <h4>添加学生</h4>
                        <!--  标题内容  -->
                    </div>
                     <div class="modal-body">
					<div class="tabbable" id="tabs-416038" >
					<ul class="nav nav-tabs">
					<li class="active">
						<a data-toggle="tab" href="#panel-899638">手动输入</a>
					</li>
					<li>
						<a data-toggle="tab" href="#panel-220408">表格导入</a>
					</li>
				</ul>
				<div class="tab-content">
                        <!--  模态框内容，我在此处添加一个表单 -->
                        <div class="tab-pane active" id="panel-899638" style="padding-top: 20px;">
                        <form class="form-horizontal" role="form" >
                            <div class="form-group">
                                <label for="uname" class="col-sm-2 control-label">学生姓名</label>
                                <div class="col-sm-9">
                                    <input type="text" id="uname" name="name" class="form-control well" placeholder="请输入学生名"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="upwd" class="col-sm-2 control-label">联系方式</label>
                                <div class="col-sm-9">
                                    <input type="text" id="upwd" name="telephone" class="form-control well" placeholder="请输入联系方式"/>
                                    <input type="text" id="classId1" name="classId" style="display:none"/>
                                </div>
                            </div>
                        </form>
                        </div>
                        <div class="tab-pane" id="panel-220408" style="padding-top: 20px;">
						<form id="file_form" action="${pageContext.request.contextPath }/excel.action" enctype="multipart/form-data" method="post">
            				<input type="file" name="filename" id="file_input">
            				<input type="text" id="classId2" name="classId" style="display:none"/>
            				<input type="submit" value="导入数据" class="file">
    					</form>
					</div>
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
</div>
<script src=
       "${pageContext.request.contextPath}/js/jquery-1.11.3.min.js">
	</script>
    <!-- <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script> -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/npm.js"></script>
<script>
		var classid;
        $(document).ready(function(){
            $.ajax({
                contentType : "application/json;charset=utf-8",
                type : "POST",
                url : "http://localhost:8080/superstarpro/classlist.action",
                dataType : "json",
                success : function(data) {
                	var tem;
                    $.each(data, function(i, city) {
                    	if(i==0){
                    		tem=city.id;
                    	}
                        $('#classname').append(
                                $('<option>').text(city.classname).attr('value',
                                        city.id));
                    });
                    $.ajax({
		                contentType : "application/json;charset=utf-8",
		                type : "POST",
		                url : "http://localhost:8080/superstarpro/studentList.action",
		                dataType : "json",
		                data:'{id:"'+tem+'"}',
		                success : function(data) {
		                	var checkText=$("#classname").find("option:selected").text();
		                	$('#workList').html("");
		                    $.each(data, function(i, city) {
		                        $('#workList').append('<tr class="info"><td>'+i+'</td><td>'+checkText+'</td><td>'+city.name+'</td><td>'+city.telephone+'</td></tr>');
		                    });
		                }
		            });
                }
            });
            $("#classname").change(function(event){
            		classid=$(this).val();
            		$("#classId1").attr("value",classid);
            		$("#classId2").attr("value",classid);
            		$.ajax({
                contentType : "application/json;charset=utf-8",
                type : "POST",
                url : "http://localhost:8080/superstarpro/studentList.action",
                dataType : "json",
                data:'{id:"'+classid+'"}',
                success : function(data) {
                	var checkText=$("#classname").find("option:selected").text();
                	$('#workList').html("");
                    $.each(data, function(i, city) {
                        $('#workList').append('<tr class="info"><td>'+i+'</td><td>'+checkText+'</td><td>'+city.name+'</td><td>'+city.telephone+'</td></tr>');
                    });
                }
            });
            });
        });

    </script>

  </body>
</html>
