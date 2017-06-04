<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
 <base href="<%=basePath%>">
<meta charset="gbk">
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>首页</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="js/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
	$(function(){
		$("[name=time]").click(function(){
			WdatePicker({
				highLinekWeekDay:true,
				dateFmt:'yyyy-MM-dd'
			})
		})
	})
	
	</script>
</head>

<body>

<form action="attend.do?update" class="form-horizontal" method="post">
<div style="padding:0px; margin:0px;">
 <ul class="breadcrumb" style="  margin:0px; " >
    	<li><a href="#">教务管理</a></li>
        <li>修改考勤</li>
    </ul>
</div>
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">基本信息</h5>
	<div class="row">
    	<div class="col-xs-5">
        	<div class="form-group">
            	<label class="col-xs-3 control-label">编号</label>
                <div class="col-xs-9">
                	<input type="text" name="aid" class="form-control input-sm" placeholder="" value="${attendance.aid }"/>
                </div>
            </div>
        
        </div>
       <div class="col-sm-5">
        	<div class="form-group">
            	<label class="col-sm-3 control-label">学员姓名</label>
                <div class="col-sm-9">
               		 <select name="student.id" class="form-control input-sm">
                     	<c:forEach items="${students}" var="s">
                     	<option ${attendance.student.id==s.id ? 'selected':''}  value="${s.id }">${s.name}</option>
                     	</c:forEach>
                        
                     </select>
                </div>
            </div>

        </div>
        
         <div class="col-xs-5">
            <div class="form-group">
            	<label class="col-xs-3 control-label">状态</label>
                <div class="col-xs-9">
                	<input type="text" name="state" class="form-control input-sm"  value="${attendance.state }"/>
                </div>
            </div>
        </div>
        
         <div class="col-xs-5">
            <div class="form-group">
            	<label class="col-xs-3 control-label">日期</label>
                <div class="col-xs-9">
                	<input type="text" name="time" class="form-control input-sm"  value="<f:formatDate value='${attendance.time }'/>" readonly="readonly"/>
                </div>
            </div>
        </div>
        
        
    </div>
    
    <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">描述</h5>
    	<div class="row">
    	<div class="col-xs-10">
        	<div class="form-group">
            	<label class="col-xs-3 control-label">描述</label>
                <div class="col-xs-9">
                	<textarea class="form-control" name="desc">${attendance.desc }</textarea>
                </div>
            </div>
        
        </div>

    </div>
 
 <h5 class="page-header alert-info" style="padding:10px; margin:0px; margin-bottom:5px;">备注信息</h5>
    	<div class="row">
    	<div class="col-xs-10">
        	<div class="form-group">
            	<label class="col-xs-3 control-label">备注信息</label>
                <div class="col-xs-9">
                	<textarea class="form-control" name="content">${attendance.content }</textarea>
                </div>
            </div>
        
        </div>

    </div>
 		<div class="row">
    	<div class="col-sm-3 col-sm-offset-4">
        	<input  type="submit" class="btn btn-success" value="保存"/>
            <a  href="attend.do?findAll" class="btn  btn-danger" >返回</a>
        </div>
    </div>
</form>

</body>
</html>