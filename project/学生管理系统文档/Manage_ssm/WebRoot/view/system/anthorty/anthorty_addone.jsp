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

<form action="anthorty.do?saveone" method="post" class="form-horizontal">

    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">基本信息</h5>
	<div class="row">
    	
        <div class="col-xs-5">
            <div class="form-group">
            	<label class="col-xs-3 control-label">权限名称</label>
                <div class="col-xs-9">
                	<input type="text" name="name"  class="form-control input-sm" placeholder="请输入权限名称"/>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
    	<div class="col-xs-5">
            <div class="form-group">
            	<label class="col-xs-3 control-label">权限描述</label>
                <div class="col-xs-9">
                	<textarea class="form-control" name="desc" ></textarea>
                </div>
            </div>
        </div>
    </div>
      
    	

 	<div class="row">
    	<div class="col-xs-3 col-xs-offset-3">
        	<input  type="submit" class="btn btn-success" value="保存"/>
        	<a  class="btn btn-success"  href="anthorty.do?all">返回</a>
        </div>
    </div>

</form>

</body>
</html>
