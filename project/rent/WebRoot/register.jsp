<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE>
<html>
<head>
<base href="<%=basePath%>">

<title>注册</title>
<style type="text/css">
body {
	font-family: Tahoma, Verdana;
	font-size: 12px
}

.STYLE1 {
	color: #FF0000
}
</style>
<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
<script>
	$(function() {
		$("#nickName").blur(function() {
			if($("#nickName").val()==""){
				return false;
			}
			//需要传递给后台的参数
			var args = {
				"user.nickName" : $("#nickName").val()
			};
			//发送post请求
			//参数一:URL
			//参数二:参数值
			//参数三:回调方法
			$.post("user!checkUserName.action", args, function(data) {
				$("#form").attr("flag",data.flag);
				$("#result").html(data.rolemessage);
			}, "json");
		});
		
		$("#form").submit(function(){
			if($("#form").attr("flag")=="false"){
				alert("用户名已被使用");
				return false;
			}
			if($("#nickName").val()==""){
				alert("用户名不能为空");
				return false;
			}
			if($("#password").val()==""){
				alert("密码不能为空");
				return false;
			}
			if($("#password").val()!=$("#checkpwd").val()){
				alert("两次密码输入不一致");
				return false;
			}
		});
	});
</script>
</head>
<body>
	<div id="title" align="center">
		<h1>用户注册</h1>
	</div>
	<div id="operation">
		<div id="link_student" align="center">
			<form action="user_register.action" method="post" id="form" flag= "false">
				<TABLE class="divTab" width="500">
					<TR>
						<TD align="right" width="35%">真实姓名：</TD>
						<TD align="left" width="65%"><INPUT NAME="user.realName"
							id="realName" TYPE="text"><!-- <label id="result"></label> -->
					</TR>
					<TR>
						<TD align="right" width="35%">用户名(昵称)：</TD>
						<TD align="left" width="65%"><INPUT NAME="user.nickName"
							id="nickName" TYPE="text"><label id="result"></label>
					</TR>
					<TR>
						<TD align="right" width="35%">密码：</TD>
						<TD align="left" width="65%"><INPUT TYPE="password" id="password"
							NAME="user.password"></TD>
					</TR>
					<TR>
						<TD align="right" width="35%">重复密码：</TD>
						<TD align="left" width="65%"><INPUT TYPE="password" id="checkpwd"
							NAME="checkpwd"></TD>
					</TR>
					<TR>
						<TD align="right" width="35%">地址：</TD>
						<TD align="left" width="65%"><INPUT TYPE="text"
							NAME="user.address"></TD>
					</TR>
					<TR>
						<TD align="right" width="35%">邮箱：</TD>
						<TD align="left" width="65%"><INPUT TYPE="text"
							NAME="user.email"></TD>
					</TR>
					<TR>
						<TD align="right" width="35%">QQ：</TD>
						<TD align="left" width="65%"><INPUT TYPE="text"
							NAME="user.qq"></TD>
					</TR>
					<TR>
						<TD align="right" width="35%">电话：</TD>
						<TD align="left" width="65%"><INPUT TYPE="text"
							NAME="user.phone"></TD>
					</TR>
					<TR>
						<TD colspan="2" align="center" style="font-size:30px;"><INPUT
							TYPE="submit" value="提　　交"> <INPUT TYPE="reset"
							value="重　　置"></TD>
					</TR>
				</TABLE>
			</form>
		</div>
	</div>
</body>
</html>

