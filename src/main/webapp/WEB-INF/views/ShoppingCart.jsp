<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
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
    position:absolute;">	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12 col-md-offset-1">
				<h1>购物车</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-10">
				<a href="toindex" class="btn btn-info btn-lg active"
					role="button">返回</a>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<table class="table table-hover" id="shopping_table">
					<thead>
						<tr>
							<th>#</th>
							<th>菜名</th>
							<th>介绍</th>
							<th>价格</th>
							<th>数量</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-4 col-md-offset-5">
				<button id="btn" class="btn btn-primary btn-lg active">提交</button>
			</div>
		</div>
	</div>
		<script type="text/javascript">
			var cid="${cid}";
 			$(function() {
				$.ajax({
					url : "${APP_PATH}/shopping",
					data : "cid=" +cid,
					type : "GET",
					success : function(result) {
						console.log(result);
 	   					$("#shopping_table tbody").empty();
 						var c = result.extend.cai;
// {"code":100,"msg":"成功!","extend":{"cai":{"cId":1,"cName":"菜1","price":15,"introduction":"第一个菜","pic":"菜一图","csId":1,"status":1,"good":3}}}
						$.each(c,function(index,item){
							var cIdTd = $("<td></td>").append(item.cId);
							var nameTd = $("<td></td>").append(item.cName);
							var inTd = $("<td></td>").append(item.introduction);
							var priceTd = $("<td></td>").append(item.price);
							var numTd=$("<td></td>").append("<input type=\"text\" size=\"1\" id=\""+item.cId+"\" value=\"1\">");
// 							numTd.attr("num_id",item.cId);
							$("<tr></tr>").append(cIdTd)
								.append(nameTd)
								.append(inTd)
								.append(priceTd)
								.append(numTd)
								.appendTo("#shopping_table tbody"); 
	 					});     
					}
				});
			}); 
			$(document).on("click",".btn",function(){
// 				alert(cid);
// 				var a=$("#1").val();
// 				alert(a);
// 				alert($("#2").val());
// 				alert($("#3").val());
// 				alert($("#4").val());
 				var message="";
				var total=0;
				$.ajax({
					url : "${APP_PATH}/shopping",
					data : "cid=" +cid,
					type : "GET",
					success : function(result) {
						console.log(result);
 						var c = result.extend.cai;
//  						alert(c.length);
 						$.each(c,function(i,item){
 	 						icid=item.cId;
 	 						iprice=item.price;
							message += icid+","+$("#"+icid).val()+","+iprice+".";
 						})
//  						alert(total);
//  						alert(message);
 						if(confirm("确认下单吗？")){
 	 						window.location.href="xiadan?msg="+message;
 						}

					}
				});


			})

		</script>
</body>
</html>