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
<title>用户登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
</head>
<body class="login-layout">
	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-container">
						<div class="center"><br/><br/>
							<h1>
								<i class="icon-leaf green"></i>  <span
									class="white">教务管理系统</span>
							</h1>
							<br/><br/>	<br/>
						</div>
						<div class="space-6"></div>
						<div class="position-relative">
							<div id="login-box"
								class="login-box visible widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header blue lighter bigger">
											<i class="icon-coffee green"></i> 请输入账号和密码
										</h4>
										<script type="text/javascript">
											
										</script>
										<div class="space-6"></div>
										<form action="staff.do?login" method="post" >
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input id="name"
														name="name" type="text" class="form-control"
														placeholder="请输入账号" /> <i class="icon-user"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input id="password"
														name="password" type="password" class="form-control"
														placeholder="请输入密码" /> <i class="icon-lock"></i>
												</span>
												</label>

												<div class="clearfix">
											

													<button type="submit"
														class="width-35 pull-right btn btn-sm btn-primary">
														<i class="icon-key"></i> 登陆
													</button>
												</div>

												<div class="space-4"></div>
											</fieldset>
										</form>

									</div>

								</div>

							</div>


					</div>

				</div>
			</div>

		</div>
</div>
	</div>
</body>
</html>
