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
    	<li><a href="#">招生管理</a></li>
         <li>试听记录</li>
        <li>添加记录</li>
    </ul>
</div>

<form action="audition.do?save" class="form-horizontal" method="post">

    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">基本信息</h5>
	<div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label" >编号</label>
                <div class="col-sm-9">
                	<input type="text" name="" readonly="readonly" class="form-control input-sm" placeholder="请输入编号"/>
                </div>
            </div>
        
        </div>
        <div class="col-sm-5">
            <div class="form-group">
            	<label class="col-sm-3 control-label">试听课程</label>
               <!--  <div class="col-sm-9">
                	<input type="text" name="audition_course" class="form-control input-sm" placeholder="请输入试听课程"/>
                </div> -->
                 <div class="col-sm-9">
                	<select name="audition_course" class="form-control input-sm">
    					<c:forEach items="${sche}" var="d">
    						<option value="${d.name}">${d.name}</option>
    					</c:forEach>
    			</select>
            </div>
        </div>

    </div>
    	<div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">试听学员</label>
                <div class="col-sm-9">
                	<select name="student.id" class="form-control input-sm">
    				<c:forEach items="${studentList}" var="s">
    					<option value="${s.id}">${s.name}</option>
    				</c:forEach>
    			</select>
                </div>
            </div>
        </div>
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">试听时间</label>
                <div class="col-sm-9">
               		 <input type="date" name="audition_time" class="form-control input-sm" placeholder="请输入试听时间"/>
                </div>
            </div>
        
        </div>

    </div>
       	<div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">试听地点</label>
                <div class="col-sm-9">
               		 <input type="text" name="audition_address" class="form-control input-sm" placeholder="请输入试听地点"/>
                </div>
            </div>
        
        </div>

    </div>
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">描述</h5>
    	<div class="row">
    	<div class="col-sm-10">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">描述</label>
                <div class="col-sm-9">
                	<textarea class="form-control" name="audition_desc"></textarea>
                </div>
            </div>
        
        </div>

    </div>
 
   	<div class="row">
    	<div class="col-sm-3 col-sm-offset-4">
        	<input  type="submit" class="btn btn-success" value="保存"/>

              <a class="btn btn-warning" href="audition.do?auditionAll">返回</a>
        </div>
    </div>
</form>

</body>
</html>
