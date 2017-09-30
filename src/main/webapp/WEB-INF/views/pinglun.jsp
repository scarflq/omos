<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>评论</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- web路径：
不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
		http://localhost:3306/crud
 -->
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
    	<div style="background-image:url(static/pic/timg.jpg); width:100%;
    height:100%;
    background-size:100% 100%;
    position:absolute;"><br><br>
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12 col-md-offset-2">
				<h1>评价</h1>
			</div>
		</div>

<br><br><br>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal" id="pinglun" action="jxpl" method="get">
					<div class="form-group">
						<label class="col-md-5 control-label">订单菜名：</label>
						<div class="col-md-4">
							<p class="form-control-static" id="caiName"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-5 control-label">订单菜号：</label>
						<div class="col-md-4">
							<p class="form-control-static" id="caiId"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-5 control-label">菜品价格：</label>
						<div class="col-md-4">
							<p class="form-control-static" id="caiPrice"></p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-5 control-label">菜品介绍：</label>
						<div class="col-md-4">
							<p class="form-control-static" id="caiIntroduction"></p>
						</div>
						<div hidden>
							<p class="form-control-static" id="caiIntroduction"></p>
						</div>
					</div>
					<br><br>
					<div class="form-group">
						<label class="col-md-3 control-label">添加评价：</label>
						<div class="col-md-6">
						<textarea class="form-control" rows="3" id="pl_text"></textarea>
						</div>
					</div>
					<br><br>
					<div class="col-md-4 col-md-offset-4">
						<input type="checkbox" id="check" value=""><label>勾选我为这道菜点赞 </label>
					</div>
					<br><br>
					<div class="col-md-4 col-md-offset-4">
   					    <button type="button" class="btn btn-info active" id="btn_tj">提交</button>
						&nbsp;&nbsp;&nbsp;<a href="toord" class="btn btn-default active" role="button">返回</a>
					</div>
						
				</form>
			</div>
		</div>
	</div>
	    </div>
	<script type="text/javascript">
		$(function() {
			var id = ${id};
			pl(id);
		});
		function pl(id) {
			$.ajax({
				url : "${APP_PATH}/pl",
				data : "id=" + id,
				type : "GET",
				success : function(result) {
					//console.log(result);
					var cai = result.extend.oi;
					$("#caiName").text(cai.menuu.cName);
					$("#caiPrice").text(cai.menuu.price);
					$("#caiIntroduction").text(cai.menuu.introduction);
					$("#caiId").text(cai.cId);
				}
			});
		}
		
		
		$('#btn_tj').click(function(){
			if($("#pl_text").val()==null){
				alert("评论内容不可为空！！！");
			}
			else{
	 			if(confirm("确认提交吗？")){
// 	 	 			alert($("#pl_text").val());
	 				window.location.href="jxpl?pl="+$("#pl_text").val()+"&good="+$("input[type='checkbox']").is(':checked')+"&oiId="+${id}+"&cId="+$("#caiId").text();
	 	 			}
			}
		});
	</script>
</body>
</html>