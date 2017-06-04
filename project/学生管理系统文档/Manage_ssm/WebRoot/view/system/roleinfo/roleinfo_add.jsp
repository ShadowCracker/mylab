<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
<title>首页</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="js/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="js/bootstrap.min.js"></script>
</head>

<body>
<div style="padding:0px; margin:0px;">
 <ul class="breadcrumb" style="  margin:0px; " >
    	<li><a href="#">系统管理</a></li>
        <li>角色管理</li>
        <li>添加角色信息</li>
    </ul>
</div>
<br/><br/><br/>
<form action="role.do?save" method="post" class="form-horizontal">

 	<div class="form-group">
            	<label class="col-sm-3 control-label">角色名称</label>
                <div class="col-sm-2">
                	<input type="text" name="rname" class="form-control input-sm" placeholder="请输入角色名称"/>
                </div>
    </div>
    <br/><br/>
    
    <div class="form-group">
            	<label class="col-sm-3 control-label">权限</label>
                <div class="col-sm-9">
                	<c:forEach   items="${list}"  var="anth">
    					<input type="checkbox" name="quanxian" value="${anth.name}" />${anth.name}
    				</c:forEach>
                </div>
            </div>
 <br/><br/>
 	<div class="form-group">
            	<label class="col-sm-3 control-label">角色说明</label>
                <div class="col-sm-5">
                	<textarea class="form-control" name="desc"></textarea>
                </div>
    </div>
 <br/>
   	<div class="row">
    	<div class="col-sm-3 col-sm-offset-4">
        	<input  type="submit" class="btn btn-success" value="保存"/>
            <a  href="role.do?roleFind" class="btn  btn-danger" >返回</a>
        </div>
    </div>
</form>

</body>
</html>
