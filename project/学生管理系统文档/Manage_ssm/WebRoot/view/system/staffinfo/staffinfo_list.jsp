<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>首页</title>
		<!-- 新 Bootstrap 核心 CSS 文件 -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
		<script src="js/jquery.min.js">
</script>
		<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
		<script src="js/bootstrap.min.js">
</script>
<script type="text/javascript">
	$(function(){
		$("#sel").click(function(){
			var com=$("#con").val();
			if("1"==com){
				$("#context").attr("name","sname");
			}else if("2"==com){
				$("#context").attr("name","sex");
			}
			$("#con_from").submit();
		});
	})
</script>
	</head>
      
	<body>
		<div style="padding: 0px; margin: 0px;">
			<ul class="breadcrumb" style="margin: 0px;">
				<li>
					<a href="#">系统管理</a>
				</li>
				<li>
					员工管理
				</li>
			</ul>
		</div>
		<div class="row alert alert-info" style="margin: 0px; padding: 3px;">
			<form action="staff.do?likefind" method="post" id="con_from" class="form-horizontal">
				<label class="col-sm-1 control-label">姓名:</label>
				<div class="col-sm-3">
					<input type="text" id="context" class="form-control input-sm" name="sname" placeholder="请输入姓名"/>
				</div>
				<input type="submit" id="sel" class="btn btn-danger" value="查询"/>
				<input type="button" class="btn btn-success" value="添加"
					onClick="javascript:window.location='view/system/staffinfo/staffinfo_add.jsp'" />
			</form>
		</div>
		<div class="row" style="padding: 15px; padding-top: 0px;">
			<table class="table  table-condensed table-striped">
				<tr>
					<th>
						员工编号
					</th>
					<th>
						员工姓名
					</th>
					<th>
						员工性别
					</th>
					<th>
						员工年龄
					</th>
					<th>
						电话号码
					</th>
					<th>
						QQ
					</th>
					<th>
						入职时间
					</th>
					<th>
						操作
					</th>
				</tr>
				<c:forEach items="${staffList}" var="s">
				<tr>
					<td>
						<a href="staffinfo_show.html">${s.sid}</a>
					</td>
					<td>
						${s.name}
					</td>
					<td>
						${s.sex}
					</td>
					<td>
						${s.age}
					</td>
					<td>
						${s.phone}
					</td>
					<td>
						${s.qq}
					</td>
					<td>
					<f:formatDate value="${s.hiredate}"/>	
					</td>
					<td>
						<a href="staff.do?byid&id=${s.sid}">修改</a>
						<a href="staff.do?delete&id=${s.sid}">删除</a>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>

	</body>
</html>
