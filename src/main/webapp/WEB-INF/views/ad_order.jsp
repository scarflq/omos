<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理系统</title>
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
<!-- 查看详情的模态框 -->
<div class="modal fade" id="xqModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">订单详情</h4>
      </div>
      <div class="modal-body">
				<table class="table table-hover" id="xq_table">
					<thead>
						<tr>
							<th>商品名</th>
							<th>数量</th>
							<th>单价</th>
							<th>评价</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
      </div>
    </div>
  </div>
</div>

	<!-- 搭建显示页面 -->
	<div class="container"> 
		    <nav class="navbar navbar-inverse">
  			<div class="container-fluid">
    			<div class="navbar-header">
      				<a class="navbar-brand" href="#" onclick="to_page(1)">后台管理系统</a>
    			</div>
    			<div class="collapse navbar-collapse">
      				<ul class="nav navbar-nav">
        				<li><a href="toad" onclick="">菜品管理</a></li>
       					<li><a href="toad2">用户管理</a></li>
        				<li class="active"><a href="#">订单管理</a></li>
        				<li><a href="toindex">返回前台</a></li>
      				</ul>
    			</div>
  			</div>
		</nav>	
		<!-- 按钮 -->
<!-- 		<div class="row"> -->
<!-- 			<div class="col-md-4 col-md-offset-10"> -->
<!-- 				<a href="toord" class="btn btn-info btn-lg active" role="button">返回</a> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="order_table">
					<thead>
						<tr>
							<th>#</th>
							<th>状 态</th>
							<th>用户编号</th>
							<th>订餐时间</th>
							<th>收货时间</th>
							<th>总 金 额</th>
							<th>查看详情</th>
							<th>操 作</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			</div>
		</div>

		<!-- 显示分页信息 -->
		<div class="row">
			<!--分页文字信息  -->
			<div class="col-md-6" id="page_info_area"></div>
			<!-- 分页条信息 -->
			<div class="col-md-6" id="page_nav_area">
				
			</div>
		</div>
		
	</div>
	<script type="text/javascript">
	
		var totalRecord,currentPage;
		//1、页面加载完成以后，直接去发送ajax请求,要到分页数据
		$(function(){
			//去首页
			to_page(1);
		});
		
		function to_page(pn){
			$.ajax({
				url:"${APP_PATH}/adord",
				data:"pn="+pn,
				type:"GET",
				success:function(result){
					console.log(result);
					//1、解析并显示订单数据
					build_order_table(result);
					//2、解析并显示分页信息
					build_page_info(result);
					//3、解析显示分页条数据
					build_page_nav(result);
				}
			});
		}
		
		function build_order_table(result){
			//清空table表格
			$("#order_table tbody").empty();
			var ord = result.extend.page.list;
			$.each(ord,function(index,item){
				var std;
				if(item.status==1) {std="未接单";}
				else if(item.status==2) {std="已接单";}
				else if(item.status==3) {std="已送出";}
				else if(item.status==0) {std="已取消";}
				else {std="已送达";}
				var oIdTd = $("<td></td>").append(item.oId);
				var statusTd = $("<td></td>").append(std);
				var uIdTd = $("<td></td>").append(item.uId);
				var orderTimeTd = $("<td></td>").append(item.orderTime);
				var getTimeTd = $("<td></td>").append(item.getTime);
				var totalTd = $("<td></td>").append(item.total);
				var xqBtn = $("<button></button>").addClass("btn btn-success btn-sm xq_btn")
				.append($("<span></span>").addClass("glyphicon glyphicon-plus")).append("查看详情");
				xqBtn.attr("xq-id",item.oId);
				var xxTd = $("<td></td>").append(xqBtn);
				var getBtn = $("<button></button>").addClass("btn btn-primary btn-sm get_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-ok")).append("接单");
				getBtn.attr("get-id",item.oId);
				var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-remove")).append("拒收");
				delBtn.attr("del-id",item.oId);
				var songBtn =  $("<button></button>").addClass("btn btn-warning btn-sm songhuo_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-flag")).append("送货");
				songBtn.attr("song-id",item.oId);
				var btnTd;
				if(item.status==1){btnTd = $("<td></td>").append(getBtn).append(" ").append(delBtn);}
				else if(item.status==2){btnTd = $("<td></td>").append(songBtn);}
				else {btnTd = $("<td></td>");}
				$("<tr></tr>").append(oIdTd)
					.append(statusTd)
					.append(uIdTd)
					.append(orderTimeTd)
					.append(getTimeTd)
					.append(totalTd)
					.append(xxTd)
					.append(btnTd)
					.appendTo("#order_table tbody");
			});
		}
		//解析显示分页信息
		function build_page_info(result){
			$("#page_info_area").empty();
			$("#page_info_area").append("当前"+result.extend.page.pageNum+"页,总"+
					result.extend.page.pages+"页,总"+
					result.extend.page.total+"条记录");
			totalRecord = result.extend.page.total;
			currentPage = result.extend.page.pageNum;
		}
		//解析显示分页条，点击分页要能去下一页....
		function build_page_nav(result){
			//page_nav_area
			$("#page_nav_area").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			
			//构建元素
			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
			var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
			if(result.extend.page.hasPreviousPage == false){
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			}else{
				//为元素添加点击翻页的事件
				firstPageLi.click(function(){
					to_page(1);
				});
				prePageLi.click(function(){
					to_page(result.extend.page.pageNum -1);
				});
			}
			
			
			
			var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
			var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
			if(result.extend.page.hasNextPage == false){
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			}else{
				nextPageLi.click(function(){
					to_page(result.extend.page.pageNum +1);
				});
				lastPageLi.click(function(){
					to_page(result.extend.page.pages);
				});
			}
			
			
			
			ul.append(firstPageLi).append(prePageLi);
			$.each(result.extend.page.navigatepageNums,function(index,item){
				
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if(result.extend.page.pageNum == item){
					numLi.addClass("active");
				}
				numLi.click(function(){
					to_page(item);
				});
				ul.append(numLi);
			});
			//添加下一页和末页 的提示
			ul.append(nextPageLi).append(lastPageLi);
			
			//把ul加入到nav
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");
		}
		
		
		$(document).on("click",".get_btn",function(){
			var oId = $(this).attr("get-id");
 			if(confirm("确认接收【"+oId+"】号订单吗？")){
				$.ajax({
					url:"${APP_PATH}/adord/jieshou/"+oId,
					type:"put",
					success:function(result){
						to_page(currentPage);
					}
				});
			} 
		});
		$(document).on("click",".delete_btn",function(){
			var oId = $(this).attr("del-id");
 			if(confirm("确认拒收【"+oId+"】号订单吗？")){
				$.ajax({
					url:"${APP_PATH}/adord/jushou/"+oId,
					type:"put",
					success:function(result){
						to_page(currentPage);
					}
				});
			} 
		});
		$(document).on("click",".songhuo_btn",function(){
			var oId = $(this).attr("song-id");
 			if(confirm("【"+oId+"】号订单确认送货吗？")){
				$.ajax({
					url:"${APP_PATH}/adord/songhuo/"+oId,
					type:"put",
					success:function(result){
						to_page(currentPage);
					}
				});
			} 
		});
		$(document).on("click",".xq_btn",function(){
			var o=$(this).attr("xq-id");
			$.ajax({
				url:"${APP_PATH}/adord/xiangqing/"+o,
				type:"get",
				success:function(result){
//  					console.log(result);
   					$("#xq_table tbody").empty();
					var oi = result.extend.OI;
					$.each(oi,function(index,item){
						var cIdTd = $("<td></td>").append(item.menuu.cName);
						var numTd = $("<td></td>").append(item.num);
						var priceTd = $("<td></td>").append(item.price);
						var commentTd = $("<td></td>").append(item.comment);
						$("<tr></tr>").append(cIdTd)
							.append(numTd)
							.append(priceTd)
							.append(commentTd)
							.appendTo("#xq_table tbody"); 
 					});  
				}
			});
  			$("#xqModal").modal({backdrop:"static"});  
		});


	</script>
</body>
</html>