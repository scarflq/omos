<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>历史订单</title>
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
    position:absolute;">
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
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>历史订单</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-10">
				<a href="toindex" class="btn btn-info btn-lg active" role="button">返回</a>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="order_table">
					<thead>
						<tr>
						<th>#</th>
						<th>订餐时间</th>
						<th>总 金 额</th>
						<th>状      态</th>
						<th>查看详情</th>
						<th>操      作</th>
						</tr>
					</thead>
					<tbody id="tbody">
					
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
				url:"${APP_PATH}/ord",
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
				var orderTimeTd = $("<td></td>").append(item.orderTime);
				var totalTd = $("<td></td>").append(item.total);
				var statusTd = $("<td></td>").append(std);
				var xqBtn = $("<button></button>").addClass("btn btn-success btn-sm xq_btn")
				.append($("<span></span>").addClass("glyphicon glyphicon-plus")).append("查看详情");
				xqBtn.attr("xq-id",item.oId);
				var xxTd = $("<td></td>").append(xqBtn);
				var geBtn = $("<button></button>").addClass("btn btn-primary btn-sm ge_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-ok")).append("确认送达");
				geBtn.attr("ge-id",item.oId);
				var deBtn =  $("<button></button>").addClass("btn btn-danger btn-sm de_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("取消订单");
				deBtn.attr("de-id",item.oId);
				var btnTd;
				if(item.status==1){btnTd = $("<td></td>").append(deBtn);}
				else if(item.status==3){btnTd = $("<td></td>").append(geBtn);}
				else {btnTd = $("<td></td>");}

				//var delBtn = 
				//append方法执行完成以后还是返回原来的元素
				$("<tr></tr>").append(oIdTd)
					.append(orderTimeTd)
					.append(totalTd)
					.append(statusTd)
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
		$(document).on("click",".ge_btn",function(){
			var oId = $(this).attr("ge-id");
 			if(confirm("确认【"+oId+"】号订单已送达吗？")){
				$.ajax({
					url:"${APP_PATH}/adord/songda/"+oId,
					type:"put",
					success:function(result){
						to_page(currentPage);
					}
				});
			} 
		});
		$(document).on("click",".de_btn",function(){
			var oId = $(this).attr("de-id");
 			if(confirm("确认取消【"+oId+"】号订单吗？")){
				$.ajax({
					url:"${APP_PATH}/adord/quxiao/"+oId,
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

						var plBtn = $("<a class=\"btn btn-primary btn-sm pl_btn\" href=\"topl?id="+item.oiId+"\"></a>")
						.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("评论");
						
						plBtn.attr("pl-id",item.oiId);
						if (item.comment!=null){
							plTd = $("<td></td>").append(item.comment);
						}
						else{
							plTd = $("<td></td>").append(plBtn);
						}
						$("<tr></tr>").append(cIdTd)
							.append(numTd)
							.append(priceTd)
							.append(plTd)
							.appendTo("#xq_table tbody"); 
 					});  
				}
			});
  			$("#xqModal").modal({backdrop:"static"});  
		});
		
		</script>
</body>
</html>