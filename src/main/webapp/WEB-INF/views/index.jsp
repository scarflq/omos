<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
   <head>
   	<meta charset="utf-8" />
      <title>菜馆子</title>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <!-- 引入 Bootstrap -->
      <link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
      <link href="static/css/index.css" rel="stylesheet"/>
	  
      <!-- 包括所有已编译的插件 -->
   <!--   <script src="static/js/jquery-3.2.1.min.js"></script>-->  
       <script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>  
   	  <script src="static/js/index.js"></script> 
   	 <script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script> --%>
	
	
	
	
	
	
	
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>菜馆子</title>
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
<script
	src="${APP_PATH }/static/js/index.js"></script>
   </head>
   <body>
   
     	  	
   
   	<div style="background-image:url(static/pic/timg.jpg) ;background-repeat:no-repeat; background-size:100% 100%;-moz-background-size:100% 100%;">
   		
   		<img  src="static/pic/150483199886500.png" />
   		
       	  	
   
   <div class="text-right">
<%--     <span>用户名：</span> ${sessionScope.User} --%>

   </div>
 		
	
	



	
   		<div class="text-right">
   		   	<c:if test="${sessionScope.User != null}">
   		   		    <span>用户名：</span> ${sessionScope.username}
   		   		        <button id="login_out" class="btn btn-danger btn-sm">注销</button>
   		   	</c:if>
   		    <c:if test="${sessionScope.User == null}">
    		<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#loginmodal" id="den">
  				登录
			</button>
			<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#registermodal" id="zhu">
  				注册
			</button>
   			</c:if>
   	    </div>
   	    


			
   	    
   	     <!-- 登录注册模态框 -->
   <div class="modal fade" id="registermodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title text-center" id="myModalLabel">注册</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" id="zhuce">
		  <div class="form-group">
		    <label class="col-sm-2 control-label">用户名</label>
		    <div class="col-sm-10">
		      <input type="text" name="uName" class="form-control" id="re_name" placeholder="用户名">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">密码</label>
		    <div class="col-sm-10">
		      <input type="text" name="pwd" class="form-control" id="re_pwd" placeholder="密码输入">
		      <span class="help-block"></span>
		    </div>
		  </div>
		   <div class="form-group">
		    <label class="col-sm-2 control-label">手机号</label>
		    <div class="col-sm-10">
		      <input type="text" name="tel" class="form-control" id="re_tel" placeholder="手机号输入">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">收货地址</label>
		    <div class="col-sm-10">
		      <input type="text" name="add" class="form-control" id="re_ad" placeholder="收货地址输入">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  
	</form>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" >关闭</button>
        <button type="button" class="btn btn-primary" id="register_btn">注册</button>
      </div>
    </div>
  </div>
</div>
</div>



<div class="modal fade" id="loginmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title text-center" id="myModalLabel">登录</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal"id="denlu">
		  <div class="form-group">
		    <label class="col-sm-2 control-label">用户名</label>
		    <div class="col-sm-10">
		      <input type="text" name="uName" class="form-control" id="uName" placeholder="用户名">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">密码</label>
		    <div class="col-sm-10">
		      <input type="password" name="pwd" class="form-control" id="pwd" placeholder="密码输入">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  
	</form>
      <div class="modal-footer">
      	<button type="button" class="btn btn-default" data-dismiss="modal" >关闭</button>
        <button type="button" class="btn btn-default"  id="login_btn">登录</button>
        
      </div>
    </div>
  </div>
</div>   	    
</div> 		
   	    

   	    
   	  	
      
     
      
      	<div class="container" id="summary-container">
    		<div class="row">
    		<div class="col-md-4 text-left">
    			<a href="index.jsp" class="btn btn-info btn-lg">
          			<span class="glyphicon glyphicon-home"></span> 首页
        		</a>
        		<c:if test="${sessionScope.User != null}">
        		<a href="toord" class="btn btn-info btn-lg text-center">
          			<span class="glyphicon glyphicon-comment"></span> 历史订单
        		</a>
                    </c:if>

                    <c:if test="${sessionScope.User == null}">
        		<button id="denglu2" class="btn btn-info btn-lg text-center">
          			<span class="glyphicon glyphicon-comment"></span> 历史订单
        		</button>
                    </c:if>

<!--     			<a href="#" class="btn btn-info btn-lg text-center"> -->
<!--           			<span class="glyphicon glyphicon-comment"></span> 评价 -->
<!--         		</a> -->
    		</div>
    		</div>
    		<div class="row">
    		
    		<div class="col-md-8 text-right" id="sou">
    			<div class="input-group " >
    			<input type="text" class="form-control" id="search_text" aria-describedby="search">
    			<span class="input-group-btn ">
				<button class="btn btn-primary btn-info btn-search" id="search_button" ><span class="glyphicon glyphicon-search">搜索</span></button>
    			</span>
    			</div>
    		</div>
    		</div>
    		<br>
    	<div class="row">
		    <div class="col-md-4">
		    	<button class="btn btn-success" id="sort1_search">早餐</button>
		    	<button class="btn btn-success" id="sort2_search">午餐</button>
		    	<button class="btn btn-success" id="sort3_search">晚餐</button>
		    </div>

		    <div class="col-md-4 col-md-offset-4">
		     <a href="toad"><span class="glyphicon glyphicon-shopping-cart"></span></a>
		         <c:if test="${sessionScope.User != null}">
				<button class="btn btn-danger" id="ti_cai">提交订单</button>
                    </c:if>

                    <c:if test="${sessionScope.User == null}">
        		<button id="denglu3" class="btn btn-danger">提交订单
        		</button>
                    </c:if>
		    

			</div>
			
			
			
			
		</div>
		<br>
    	<div>
    		<table class="table table-hover" id="cai_table">
   <thead>
						<tr>
							<th>序号</th>
							<th>菜名</th>
<!-- 							<th>详细图片</th> -->
							<th>点赞数</th>
							<th>介绍</th>
							<th>分类</th>
							<th>价格</th>
							<th>加入购物车</th>
						</tr>
	</thead>
   <tbody>
    
   </tbody>
 </table>
    	</div>
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
	$(function(){
		//去首页
		to_page(1);
	});
	
	function to_page(pn){
		$.ajax({
			url:"${APP_PATH}/xian",
			data:"pn="+pn,
			type:"GET",
			success:function(result){
				//console.log(result);
				//1、解析并显示菜品信息
				build_cai_table(result);
				//2、解析并显示分页信息
				build_page_info(result);
				//3、解析显示分页条数据
				build_page_nav(result);
			}
		});
	}
	
	function build_cai_table(result){
		//清空table表格
		$("#cai_table tbody").empty();
		var cai = result.extend.pageInfo.list;
		$.each(cai,function(index,item){
			var checkBoxTd = $("<input type='checkbox' class='check_item'/>");
			var caiIdTd = $("<td></td>").append(item.cId);
			var caiNameTd = $("<p></p>").append(item.cName);
			var priceTd = $("<td></td>").append(item.price);
			var goodTd = $("<td></td>").append(item.good);
			var introductionTd = $("<td></td>").append(item.introduction);
			var picTd = $("<p></p>").append('<img src="${APP_PATH }'+item.pic+'" alt="未上传图片" height="100px" width="100px"/>');
			var picsaveTd = $("<button></button>").addClass("btn btn-primary btn-sm save_btn")
			.append($("<span></span>").addClass("glyphicon glyphicon-open")).append("上传图片");
			picsaveTd.attr("pic-id",item.cId);
			var sortTd = $("<td></td>").append(item.cs.sort);
			var npTD = $("<td></td>").append('<img src="${APP_PATH }'+item.pic+'" alt="未上传图片" height="100px" width="100px"/>').append("<br>").append(item.cName);
			var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
							.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
			editBtn.attr("edit-id",item.cId);
			var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
							.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
			delBtn.attr("del-id",item.cId);
			var btnTd = $("<td></td>").append(picsaveTd).append(" ").append(editBtn).append(" ").append(delBtn);		
			$("<tr><div></div></tr>").append(caiIdTd)
			.append(picTd)
			.append(caiNameTd)
			.append(goodTd)
			.append(introductionTd)
			.append(sortTd)
			.append(priceTd)
			.append(checkBoxTd)		
			.appendTo("#cai_table tbody");
		});	
	}
	//解析显示分页信息
	function build_page_info(result){
		$("#page_info_area").empty();
		$("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总"+
				result.extend.pageInfo.pages+"页,总"+
				result.extend.pageInfo.total+"条记录");
		totalRecord = result.extend.pageInfo.total;
		currentPage = result.extend.pageInfo.pageNum;
	}
	//解析显示分页条，点击分页要能去下一页....
	function build_page_nav(result){
		//page_nav_area
		$("#page_nav_area").empty();
		var ul = $("<ul></ul>").addClass("pagination");
		
		//构建元素
		var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
		var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
		if(result.extend.pageInfo.hasPreviousPage == false){
			firstPageLi.addClass("disabled");
			prePageLi.addClass("disabled");
		}else{
			//为元素添加点击翻页的事件
			firstPageLi.click(function(){
				to_page(1);
			});
			prePageLi.click(function(){
				to_page(result.extend.pageInfo.pageNum -1);
			});
		}
		
		
		
		var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
		var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
		if(result.extend.pageInfo.hasNextPage == false){
			nextPageLi.addClass("disabled");
			lastPageLi.addClass("disabled");
		}else{
			nextPageLi.click(function(){
				to_page(result.extend.pageInfo.pageNum +1);
			});
			lastPageLi.click(function(){
				to_page(result.extend.pageInfo.pages);
			});
		}
		
		
		
		//添加首页和前一页 的提示
		ul.append(firstPageLi).append(prePageLi);
		//1,2，3遍历给ul中添加页码提示
		$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
			
			var numLi = $("<li></li>").append($("<a></a>").append(item));
			if(result.extend.pageInfo.pageNum == item){
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
    
	$("#sort1_search").click(function(){
		$.ajax({
			url:"${APP_PATH}/sort1_sel",
			data:"pn="+1,
			type:"GET",
			success:function(result){
				//console.log(result);
				//1、解析并显示菜品信息
				build_cai_table(result);
				//2、解析并显示分页信息
				build_page_info(result);
				//3、解析显示分页条数据
				build_page_nav(result);
			}
		});	
	});
	
	$("#sort2_search").click(function(){
		$.ajax({
			url:"${APP_PATH}/sort2_sel",
			data:"pn="+1,
			type:"GET",
			success:function(result){
				//console.log(result);
				//1、解析并显示菜品信息
				build_cai_table(result);
				//2、解析并显示分页信息
				build_page_info(result);
				//3、解析显示分页条数据
				build_page_nav(result);
			}
		});	
	});
	
	$("#sort3_search").click(function(){
		$.ajax({
			url:"${APP_PATH}/sort3_sel",
			data:"pn="+1,
			type:"GET",
			success:function(result){
				//console.log(result);
				//1、解析并显示菜品信息
				build_cai_table(result);
				//2、解析并显示分页信息
				build_page_info(result);
				//3、解析显示分页条数据
				build_page_nav(result);
			}
		});	
	});
	$("#denglu2").click(function(){
		alert("请先登录！！");
	});
	$("#denglu3").click(function(){
		alert("请先登录！！");
	});
	
	
	$("#search_button").click(function(){
		var cName = $("#search_text").val();
			$.ajax({
				url:"${APP_PATH}/search/"+cName,
				data:"pn="+1,
				type:"GET",
				success:function(result){
					//alert(result.msg);
					//1、解析并显示菜品信息
					build_cai_table(result);
					//2、解析并显示分页信息
					build_page_info(result);
					//3、解析显示分页条数据
					build_page_nav(result);
				}
			});
	});
    
	
	$("#ti_cai").click(function(){
		var cNames = "";
		var del_idstr = "";
		$.each($(".check_item:checked"),function(){
			cNames += $(this).parents("tr").find("p:eq(1)").text()+",";
			del_idstr += $(this).parents("tr").find("td:eq(0)").text()+",";
		});
		cNames = cNames.substring(0, cNames.length-1);
		del_idstr = del_idstr.substring(0, del_idstr.length-1);
		if(cNames!=""){
			if(confirm("确认购买【"+cNames+"】这些菜吗？")){
				window.location.href="toshopping?cid="+del_idstr;
			}
		}
		else{alert("未选择任何商品！！！");}
	});
	
	$("#diao").click(function(){
// 		$("userModal").modal({backdrop: "static"})
	});
    </script>
   </body>
</html>
