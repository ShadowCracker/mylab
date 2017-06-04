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
        <li>权限变更</li>
    </ul>
<form action="anthorty.do?update" class="form-horizontal" method="post">
	<input type="hidden" name="id" value="${byidList.aid }" />
	
  <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">菜单信息</h5> 
  <table class="table">
  	<tr>
    	<th>一级菜单</th>
        <th>二级菜单</th>
        
    </tr>
    <tr>
    	<td>
        	<label class="checkbox-inline">${byidList.name } </label>
        </td>
    	<td>
    		<c:forEach   items="${list}"  var="ca">
    			<label class="checkbox-inline">
    			<input type="checkbox" name="quanxian" value="${ca.id }"  
    				<c:if test="${ca.flag }">checked="checked" </c:if>
    			/>${ca.name}
             </label>
    		</c:forEach>
        	 
       
    </tr>    
  
  </table>   
       	<div class="row">
    	<div class="col-sm-5 col-sm-offset-4">
          	<input type="submit" class="btn btn-success" value="保存"/>
            <a  href="anthorty.do?all" class="btn btn-warning">返回</a>
          
        </div>
    </div>
    
</form>        
</div>
</body>
</html>
