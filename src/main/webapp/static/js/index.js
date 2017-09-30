$(document).ready(function(){
//	pageContext.setAttribute("APP_PATH", request.getContextPath());
	$("#login_btn").click(function(){	
		$.ajax({
			url:"/omos/login",
			type:"POST",
			data:$("#loginmodal form").serialize(),
			success:function(result){
				 if(result.extend.re==1){
					 alert("欢迎！")
					 $("#loginmodal").modal('hide');
					 window.location.reload();
				 }
				 else if(result.extend.re==2){
					 alert("密码错误，请重新输入！")
				 }
				 else if(result.extend.re==3){
					 alert("没有该用户，请输入正确的用户名或进行注册！")
				 }
				 else if(result.extend.re==4){
					 alert("用户无效，请重新注册！")
				 }
		}
	});
	})
	
	$("#register_btn").click(function(){
		$.ajax({
			url:"/omos/save",
			type:"POST",
			data:$("#registermodal form").serialize(),
			success:function(result){
				 if(result.extend.va_msg==1){
				 alert("添加成功！");
					$("#registermodal").modal("hide");
				 }
				 else if(result.extend.va_msg==2){
					 alert("用户名重复，请重新输入！")
				 }
		}
	});
	})
	
	$("#zhu").click(function(){
		$('#zhuce')[0].reset(); 
	})
	
	$("#den").click(function(){
		$('#denlu')[0].reset(); 
	})
	
	$("#login_out").click(function(){
		$.ajax({
			url:"/omos/clear",
			type:"POST",
				success:function(result){
					 if(result.extend.aaa==1){
						 alert("登出成功");
						 window.location.reload();
						 }
						 else {
							 alert("请重试")
						 }
				}
		})
		
	})
	
	
		
		
})


