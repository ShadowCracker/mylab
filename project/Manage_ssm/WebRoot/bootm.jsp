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
<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="js/jquery-1.9.0.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="js/exporting.js"></script>
<script src="js/highcharts.js"></script>
<script type="text/javascript">
	$(function() {
				 var chart;
				$('#int').highcharts({
					chart : {
						type : 'column'
					},
					title : {
						text : ''
					},
					xAxis : {
						categories : ['完全没兴趣', '意向低', '意向中','意向强','意向非常强']
					},
					yAxis : {
						title : {
							text : '人数'
						}
					},
					series : [{
						name : '意向状态',
						data : [0, 1, 3,1,0]
					}]
				})
				})
</script>
</head>

<body>

<div style="padding:0px; margin:0px;">
 <ul class="breadcrumb" style=" padding:0px; padding-left:20px;" >
  <li ><a href="#">首页</a></li>
  <li>工作台</li>
</ul>
</div>

<div class="row " style="padding:1px; margin:0px;"  >
	<div class="col-sm-8">
        <div class="panel panel-default" >
          <div class="panel-heading" style=" padding:3px;height:30px;"  >
            <span class="glyphicon glyphicon-refresh"></span>学员意向状态
          </div>
              <div class="panel-body" id="int">
               
              </div>
        </div>
    </div>
 	<div class="col-sm-4">
            <div class="panel panel-default">
          <div class="panel-heading"  style=" padding:3px;height:30px;"  >
            <span class="glyphicon glyphicon-refresh"></span>关键试图
          </div>
   <table class="table table-bordered">
	<tr>
    	<th>欠费信息</th>
        <th>数量</th>
    </tr>
    
    	<tr>
    	<td>未交费</td>
        <td>2</th>
    </tr><tr>
    	<td>欠费</td>
        <td>1</th>
    </tr><tr>
    	<td>已缴费</td>
        <td>2</th>
    </tr>
	</table>  
        </div>
    </div>

	
 	
       
</div>



</body>
</html>
