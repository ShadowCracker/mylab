<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ds" uri="http://displaytag.sf.net" %>
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
<link rel="stylesheet" href="../../../css/bootstrap.min.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="../../../js/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="../../../js/bootstrap.min.js"></script>
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
        <li>数据字典</li>
    </ul>
</div>
<div class="row alert alert-info"  style="margin:0px; padding:3px;" >
<form class="form-horizontal" action="dictionory.do?findBytype" method="post">
	<div class="col-sm-1">类型:</div>
    <div class="col-sm-4">
    	<input type="text" name="type"  class="form-control input-sm"/>
    </div>
    <input type="submit"   class="btn btn-danger"     value="查询"/>
    <a  class="btn btn-success"  href="view/system/datadictionary/datadictionary_add.jsp"   >添加</a>
    
    
    <ds:table name="${dic_list}" pagesize="30" export="false" class="table  table-condensed table-striped">
	<ds:column title="编号" property="id"></ds:column>
	<ds:column title="内容" property="context"></ds:column>
	<ds:column title="类型" property="type"></ds:column>
	<ds:column title="描述" property="desc"></ds:column>
	<ds:column title="操作" href="dictionory.do?byid&id" paramId="id" paramProperty="id">修改</ds:column>
	<ds:column title="操作" href="dictionory.do?delete&id" paramId="id" paramProperty="id">删除</ds:column>
</ds:table>
    </form>
</div>


</body>
</html>
