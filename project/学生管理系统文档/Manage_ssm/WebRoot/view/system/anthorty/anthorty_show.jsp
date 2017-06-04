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
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="js/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="js/bootstrap.min.js"></script>
</head>

<body>

<div style="padding:0px; margin:0px;">
 <ul class="breadcrumb" style="  margin:0px; " >
    	<li><a href="#">权限管理</a></li>
        <li>查询权限</li>
    </ul>
</div>
<form class="form-inline" action="anthorty.do?byname" method="post">
<div class="row alert alert-info"  style="margin:0px; padding:3px;" >

     <div class="form-group">
         <label class="" for="activename">一级权限：</label>
       		<select name="paid" class="form-control input-sm">
                	<c:forEach items="${allParent}" var="s">
                    	<option   value="${s.aid}">${s.name}</option>
                    </c:forEach>
             </select>
      </div>
    <input type="submit"   class="btn btn-danger"     value="查询"/>
    <a  class="btn btn-success"  href="view/system/anthorty/anthorty_addone.jsp">添加一级权限</a>
    <a  class="btn btn-success"  href="anthorty.do?getParent">添加二级权限</a>
</div>

<ds:table name="${allList}" pagesize="30" export="false" class="table  table-condensed table-striped">
	<ds:column title="权限编号" property="aid"></ds:column>
	<ds:column title="权限名称" property="name"></ds:column>
	<ds:column title="权限描述" property="desc"></ds:column>
	<ds:column title="url" property="url"></ds:column>
	<ds:column title="操作" href="anthorty.do?judege&id" paramId="id" paramProperty="aid">修改</ds:column>
	<ds:column title="操作" href="anthorty.do?delete&id" paramId="id" paramProperty="aid">删除</ds:column>
</ds:table>

</form>

</body>
</html>
