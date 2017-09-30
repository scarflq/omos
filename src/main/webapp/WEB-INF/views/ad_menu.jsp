<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache" /> 
<base target="_self"> 
<title>后台管理系统</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- web路径：
不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
		http://localhost:3306/omos
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

<!-- 菜品修改的模态框 -->
<div class="modal fade" id="caiUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">菜品修改</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
		  
		  <div class="form-group">
		    <label class="col-sm-2 control-label">菜名</label>
		    <div class="col-sm-10">
		      <input type="text" name="cName" class="form-control" id="cName_update_input" placeholder="请输入菜名">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-2 control-label">价格</label>
		    <div class="col-sm-10">
		      <input type="text" name="price" class="form-control" id="price_update_input" placeholder="请输入菜的价格">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-2 control-label">菜名介绍</label>
		    <div class="col-sm-10">
		      <input type="text" name="introduction" class="form-control" id="intro_update_input" placeholder="请输入菜品介绍">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-2 control-label">选择分类</label>
		    <div class="col-sm-4">
		      <select class="form-control" name="csId">
		      </select>
		    </div>
		  </div>		  
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="cai_update_btn">更新</button>
      </div>
    </div>
  </div>
</div>


<!-- 菜品添加的模态框 -->
<div class="modal fade" id="caiAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">菜品添加</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="post"  enctype="multipart/form-data">
		  
		  <div class="form-group">
		    <label class="col-sm-2 control-label">菜名</label>
		    <div class="col-sm-10">
		      <input type="text" name="cName" class="form-control" id="cName_add_input" placeholder="请输入菜名">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-2 control-label">价格</label>
		    <div class="col-sm-10">
		      <input type="text" name="price" class="form-control" id="price_add_input" placeholder="请输入菜的价格">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-2 control-label">菜名介绍</label>
		    <div class="col-sm-10">
		      <input type="text" name="introduction" class="form-control" id="intro_add_input" placeholder="请输入菜品介绍">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label class="col-sm-2 control-label">选择分类</label>
		    <div class="col-sm-4">
		      <select class="form-control" name="csId" id="sort_add_select">
		      </select>
		    </div>
		  </div>	 		  
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="cai_save_btn">保存</button>
      </div>
    </div>
  </div>
</div>



<div class="modal fade" id="picSaveModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">上传图片</h4>
      </div>
      <div class="modal-body">
        <form id="imgForm" > 
 		<div class="modal-body">
  　　		<input type="file" id="imgFile" name="imgFile"/> 
   			<a>${picNa}</a>
  		</div>
  		<div class="modal-footer">
  　　		<button type="button" class="btn btn-default" data-dismiss="modal" id="imgClose">关闭</button>
  		    <button type="button" class="btn btn-primary" onclick="postImg();" id="pic_update_btn">上传</button>
      </div>
      </form>
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
        				<li class="active"><a href="#" onclick="to_page(1)">菜品管理</a></li>
       					<li><a href="toad2">用户管理</a></li>
        				<li><a href="toad3">订单管理</a></li>
        				<li><a href="toindex">返回前台</a></li>
      				</ul>
    			</div>
  			</div>
		</nav>		
		<br>
		<div class="row">
			<div class="col-md-8">
				<div class="input-group">
        			<span class="glyphicon glyphicon-search input-group-addon" aria-hidden="true"></span>
        			<input type="text" class="form-control" id="search_text" aria-describedby="search">
        			<span class="input-group-btn">
        				<button class="btn btn-default" type="button" id="search_button">搜索</button>
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
				<button class="btn btn-primary" id="cai_add_modal_btn">添加菜品</button>
				<button class="btn btn-danger" id="cai_delete_all_btn">删除菜品</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="cai_table">
					<thead>
						<tr>
							<th>
								<input type="checkbox" id="check_all"/>
							</th>
							<th>序号</th>
						    <th>菜名</th>
						    <th>价格</th>
						    <th>介绍</th>
						    <th>详细图片</th>
						    <th>分类</th>
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
				url:"${APP_PATH}/cai",
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
				var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
				var caiIdTd = $("<td></td>").append(item.cId);
				var caiNameTd = $("<td></td>").append(item.cName);
				var priceTd = $("<td></td>").append(item.price);
				var introductionTd = $("<td></td>").append(item.introduction);
				var picTd = $("<td></td>").append('<img src="${APP_PATH }'+item.pic+'" alt="未上传图片" height="50px" width="50px"/>');
				var picsaveTd = $("<button></button>").addClass("btn btn-primary btn-sm save_btn")
				.append($("<span></span>").addClass("glyphicon glyphicon-open")).append("上传图片");
				picsaveTd.attr("pic-id",item.cId);
				var sortTd = $("<td></td>").append(item.cs.sort);
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
				editBtn.attr("edit-id",item.cId);
				var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
								.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
				delBtn.attr("del-id",item.cId);
				var btnTd = $("<td></td>").append(picsaveTd).append(" ").append(editBtn).append(" ").append(delBtn);			
				$("<tr></tr>").append(checkBoxTd)
					.append(caiIdTd)
					.append(caiNameTd)
					.append(priceTd)
					.append(introductionTd)
					.append(picTd)
					.append(sortTd)
					.append(btnTd)
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
		
		
		
		
		//清空表单样式及内容
		function reset_form(ele){
			$(ele)[0].reset();
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
		
		//点击新增按钮弹出模态框。
		$("#cai_add_modal_btn").click(function(){
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#caiAddModal form");
			getSorts("#caiAddModal select");
			//弹出模态框
			$("#caiAddModal").modal({
				backdrop:"static"
			});
		});
		
		
		
		//校验表单数据
		function validate_add_form(){
			var cName = $("#cName_add_input").val();
			var regName= /^[\u4e00-\u9fa5]+$/;
			if(!regName.test(cName)){
				show_validate_msg("#cName_add_input", "error", "菜名只能为中文");
				return false;
			}else{
				show_validate_msg("#cName_add_input", "success", "");
			};		
			
			var price = $("#price_add_input").val();
			var regPrice= /^[0-9]+$/;
			if(!regPrice.test(price)){
				show_validate_msg("#price_add_input", "error", "价格只能为数字");
				return false;
			}else{
				show_validate_msg("#price_add_input", "success", "");
			};
			
			var introduction = $("#intro_add_input").val();
			var regIntro= /^[\u4e00-\u9fa5]+$/;
			if(!regIntro.test(introduction)){
				show_validate_msg("#intro_add_input", "error", "介绍只能为中文");
				return false;
			}else{
				show_validate_msg("#intro_add_input", "success", "");
			};			
			return true;
		}
		
		//显示校验结果的提示信息
		function show_validate_msg(ele,status,msg){
			//清除当前元素的校验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if("success"==status){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			}else if("error" == status){
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		
	
		$("#cai_save_btn").click(function(){
			if(!validate_add_form()){
				return false;
			};
			$.ajax({
				url:"${APP_PATH}/cai",
				type:"POST",
				data:$("#caiAddModal form").serialize(),
				success:function(result){
					//alert(result.msg);
					if(result.code == 100){
						$("#caiAddModal").modal('hide');
						to_page(totalRecord);
					}else{
						//显示失败信息
						//console.log(result);
						//有哪个字段的错误信息就显示哪个字段的；
						if(undefined != result.extend.errorFields.cName){
							show_validate_msg("#caiName_add_input", "error", result.extend.errorFields.cName);
						}
						if(undefined != result.extend.errorFields.price){
							show_validate_msg("#price_add_input", "error", result.extend.errorFields.price);
						}
						if(undefined != result.extend.errorFields.introduction){
							show_validate_msg("#intro_add_input", "error", result.extend.errorFields.introduction);
						}	
					}
				}
			});
		});
		
		$(document).on("click",".edit_btn",function(){
			getSorts("#caiUpdateModal select");
			getMe($(this).attr("edit-id"));
			$("#cai_update_btn").attr("edit-id",$(this).attr("edit-id"));
			$("#caiUpdateModal").modal({
				backdrop:"static"
			});
		});
		
		
		function getSorts(ele){
			//清空之前下拉列表的值
			$(ele).empty();
			$.ajax({
				url:"${APP_PATH}/sorts",
				type:"GET",
				success:function(result){
					$.each(result.extend.sorts,function(){
						var optionEle = $("<option></option>").append(this.sort).attr("value",this.csId);
						optionEle.appendTo(ele);
					});
				}
			});
			
		}
		
		function getMe(id){
			$.ajax({
				url:"${APP_PATH}/me/"+id,
				type:"GET",
				success:function(result){
					//console.log(result);
					var menuData = result.extend.menu;
					$("#cName_update_input").val(menuData.cName);
					$("#price_update_input").val(menuData.price);
					$("#intro_update_input").val(menuData.introduction);
					$("#caiUpdateModal select").val([menuData.csId]);
				}
			});
		}
		
		
		$(document).on("click",".save_btn",function(){
			getPic($(this).attr("pic-id"));
			$("#pic_update_btn").attr("pic-id",$(this).attr("pic-id"));
			$("#picSaveModal").modal({
				backdrop:"static"
			});
		});
		
		function getPic(id){
			$.ajax({
				url:"${APP_PATH}/me/"+id,
				type:"GET",
				success:function(result){
					var menuData = result.extend.menu;
					var picNa=menuData.cName;
				}
			});
		}
		
		
		
		
		
		
		//点击更新，更新菜品信息
		$("#cai_update_btn").click(function(){
			var cName = $("#cName_update_input").val();
			var regName= /^[\u4e00-\u9fa5]+$/;
			if(!regName.test(cName)){
				show_validate_msg("#cName_update_input", "error", "菜名只能为中文");
				return false;
			}else{
				show_validate_msg("#cName_update_input", "success", "");
			};		
			
			var price = $("#price_update_input").val();
			var regPrice= /^[0-9]+$/;
			if(!regPrice.test(price)){
				show_validate_msg("#price_update_input", "error", "价格只能为数字");
				return false;
			}else{
				show_validate_msg("#price_update_input", "success", "");
			};
			
			var introduction = $("#intro_update_input").val();
			var regIntro= /^[\u4e00-\u9fa5]+$/;
			if(!regIntro.test(introduction)){
				show_validate_msg("#intro_update_input", "error", "介绍只能为中文");
				return false;
			}else{
				show_validate_msg("#intro_update_input", "success", "");
			};	
			$.ajax({
				url:"${APP_PATH}/me/"+$(this).attr("edit-id"),
				type:"PUT",
				data:$("#caiUpdateModal form").serialize(),
				success:function(result){
					//alert(result.msg);
					//1、关闭对话框
					$("#caiUpdateModal").modal("hide");
					//2、回到本页面
					to_page(currentPage);
				}
			});
		});
		
		//单个删除
		$(document).on("click",".delete_btn",function(){
			//1、弹出是否确认删除对话框
			var cName = $(this).parents("tr").find("td:eq(2)").text();
			var cId = $(this).attr("del-id");
			if(confirm("确认删除【"+cName+"】吗？")){
				//确认，发送ajax请求删除即可
				$.ajax({
					url:"${APP_PATH}/cai/"+cId,
					type:"DELETE",
					success:function(result){
						alert(result.msg);
						//回到本页
						to_page(currentPage);
					}
				});
			}
		});
		
		//完成全选/全不选功能
		$("#check_all").click(function(){
			//attr获取checked是undefined;
			//我们这些dom原生的属性；attr获取自定义属性的值；
			//prop修改和读取dom原生属性的值
			$(".check_item").prop("checked",$(this).prop("checked"));
		});
		
		//check_item
		$(document).on("click",".check_item",function(){
			//判断当前选择中的元素是否5个
			var flag = $(".check_item:checked").length==$(".check_item").length;
			$("#check_all").prop("checked",flag);
		});
		
		//点击全部删除，就批量删除
		$("#cai_delete_all_btn").click(function(){
			//
			var cNames = "";
			var del_idstr = "";
			$.each($(".check_item:checked"),function(){
				cNames += $(this).parents("tr").find("td:eq(2)").text()+",";
				del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
			});
			cNames = cNames.substring(0, cNames.length-1);
			del_idstr = del_idstr.substring(0, del_idstr.length-1);
			
			if(cNames!=""){
				if(confirm("确认删除【"+cNames+"】吗？")){
					$.ajax({
						url:"${APP_PATH}/cai/"+del_idstr,
						type:"DELETE",
						success:function(result){
							alert(result.msg);
							//回到当前页面
							to_page(currentPage);
						}
					});
				}
			}
			else{alert("未选择任何商品！！！");}

			
			
		});
	</script>
</body>
</html>