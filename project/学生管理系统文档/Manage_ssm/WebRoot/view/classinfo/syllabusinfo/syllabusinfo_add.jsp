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
    	<li><a href="#">班级管理</a></li>
        <li>课程表</li>
        <li>添加课程表</li>
    </ul>
</div>

<form action="schedule.do?save" method="post" class="form-horizontal">

    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">基本信息</h5>
	<div class="row">
    	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">编号</label>
                <div class="col-sm-9">
                	<input type="text" name="id" readonly="readonly" class="form-control input-sm" placeholder="请输入编号"/>
                </div>
            </div>
        
        </div>
       <%--  <div class="col-sm-5">
            <div class="form-group">
                           <label class="col-sm-3 control-label">课程表名称</label>
               		
                                <select class="col-sm-3 " id="name" name="name"   data-width="100%">
                                      <c:forEach items="${subject_list }" var="subj">
                                      	 <option >${subj.name }</option>
                                      </c:forEach>
                                </select>
                           
                	<!-- <input type="text" name="name" class="form-control input-sm" placeholder="请输入课程表名称"/> -->
                </div>
            </div>
        </div> --%>
	<div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">课程表名称</label>
                <div class="col-sm-9">
               		 <select  id="name" name="name" class="form-control input-sm">
               		 	<c:forEach items="${subject_list}" var="subj">
	                     	<option >${subj.name }</option>
               		 	</c:forEach>
                     </select>
                </div>
            </div>

        </div>
    </div>
    
    <div class="row">
    	<div class="col-sm-8">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">星期一</label>
                <div class="col-sm-9">
               			<input type="text" name="yi" class="form-control input-sm" placeholder="请输入星期一"/>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
    	<div class="col-sm-8">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">星期二</label>
                <div class="col-sm-9">
               			<input type="text" name="er" class="form-control input-sm" placeholder="请输入星期二"/>
                </div>
            </div>
        </div>
    </div>
        <div class="row">
    	<div class="col-sm-8">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">星期三</label>
                <div class="col-sm-9">
               			<input type="text" name="san" class="form-control input-sm" placeholder="请输入星期三"/>
                </div>
            </div>
        </div>
    </div>       
    <div class="row">
    	<div class="col-sm-8">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">星期四</label>
                <div class="col-sm-9">
               			<input type="text" name="si" class="form-control input-sm" placeholder="请输入星期四"/>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
    	<div class="col-sm-8">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">星期五</label>
                <div class="col-sm-9">
               			<input type="text" name="wu" class="form-control input-sm" placeholder="请输入星期五"/>
                </div>
            </div>
        </div>
    </div>    
    <div class="row">
    	<div class="col-sm-8">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">星期六</label>
                <div class="col-sm-9">
               			<input type="text" name="liu" class="form-control input-sm" placeholder="请输入星期六"/>
                </div>
            </div>
        </div>
    </div>    
     <div class="row">
    	<div class="col-sm-8">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">星期天</label>
                <div class="col-sm-9">
               			<input type="text" name="qi" class="form-control input-sm" placeholder="请输入星期天"/>
                </div>
            </div>
        </div>
    </div>    
    
    <div class="row">
    	<div class="col-sm-8">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">有效性</label>
                <div class="col-sm-9">
               			
						  <input type="radio" name="isuserd" id="optionsRadios1" value="有效">
						 		有效
						  <input type="radio" name="isuserd" id="optionsRadios2" value="无效">
						 		无效
						
                </div>
            </div>
        </div>
    	
    </div>
    
    
    
   	<div class="row">
    	<div class="col-sm-3 col-sm-offset-4">
        	<input  type="submit" class="btn btn-success" value="保存"/>

              <a class="btn btn-warning" href="schedule.do?findAll">返回上一级</a>
        </div>
    </div>
</form>

</body>
</html>
