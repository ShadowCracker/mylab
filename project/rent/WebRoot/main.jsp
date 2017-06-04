<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<base href="<%=basePath%>">

<title>My JSP 'main.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<script src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); }>
</script>
<meta name="keywords" content="Wines Responsive web template, Bootstrap Web Templates, Flat Web Templates, AndroidCompatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
</script>

</head>

<body>

<div class="banner-1">
	  <div class="container">
  <!--header start here-->
	 <div class="header">
			
				<div class="logo">
					<h1><a href="#">租赁</a></h1>
				</div>
					<nav class="navbar navbar-default">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<!--/.navbar-header-->
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li><a href="user_findProducts.action"><font size="5" style="font-weight:bold">首页</font></a></li>
								<li><a href="rent_findAll.action"><font size="5" style="font-weight:bold">出租</font></a></li>
								<li><a href="#"><font size="5" style="font-weight:bold">求租</font></a></li>
								<li><a href="#"><font size="5" style="font-weight:bold">订单</font></a></li>
								<li><a href="#"><font size="5" style="font-weight:bold">留言</font></a></li>
								<li><a href="#"><font size="5" style="font-weight:bold">个人信息</font></a></li>
							</ul>
						</div>
						<!--/.navbar-collapse-->
					</nav>
				<div >
					您好，${loginUser.nickName }
				</div>
				<div >
					<a href="#">&nbsp;【退出】</a>
				</div>
					<div class="clearfix"> </div>

				<!-- search-scripts -->
					<script src="js/classie.js"></script>
					<script src="js/uisearch.js"></script>
					<script>
						new UISearch( document.getElementById( 'sb-search' ) );
					</script>
				<!-- //search-scripts -->

			
		</div>
<!--header end here-->

</div>
</div>
<!--banner end here-->
<div class="admission w3ls">
	   <div class="container">
	   	 <div class="faculty_top">
	   <c:forEach items="${pageBean.list }" var="mypro">
	   	  <div class="col-md-4 faculty_grid animated wow fadeInUp animated animated" data-wow-duration="1200ms" data-wow-delay="500ms">
	   	  	<figure class="team_member">
	   	  		<img src="/upload/${mypro.photoPath }" class="img-responsive wp-post-image" alt="">
	   	  		<div></div>
	   	  		<figcaption><h3 class="person-title"><a href="singlepage.html">${mypro.name }</a></h3>
	   	  			<span class="person-deg">租金${mypro.rentFree }</span>
	   	  			<span class="person-deg">押金${mypro.deposit }</span>
	   	  			<p><a href="mailto:info@example.com">查看更多</a></p>
	   	  	   </figcaption>
	   	  	 </figure>
	   	  </div>
	   </c:forEach>  
	   	  <div class="clearfix"> </div>
	   	 </div>
	  </div>
	</div>

	<div id="lj" style="margin-bottom:100px;margin-left:450px">
		<font size="5" style="font-weight:bold">首页	上一页	1	2	3	4	5	下一页	尾页</font>
	</div>

<!--footer-->
<div class="footer">
		<div class="container">
			<div class="copy-right">
				<p>? 2016 Wines. All rights reserved | Design by <a href="#">W3layouts</a></p>
			</div>
		</div>
	</div>
<!--footer-->


	<%-- <a href="addrent.jsp">出租商品</a><br/>
	<a href="rent_findAll.action">查看出租商品</a><br/>
	 <c:forEach items="${pageBean.list }" var="mypro">
		<div class="col-md-2 product-men">
			<div class="men-pro-item simpleCart_shelfItem">
				<div class="men-thumb-item">
					<img src="/upload/${mypro.photoPath }" alt="" > 
					<div class="men-cart-pro">
						<div class="inner-men-cart-pro">
							<a href="#" class="link-product-add-cart">QuickView</a>
						</div>
					</div>	
				</div>
				<div class="item-info-product ">
					<h4>
						<a href="single.html">${mypro.name }</a>
					</h4>
					<div class="info-product-price">
						<span class="item_price">租金${mypro.rentFree }</span><br/>
						<span class="item_price">押金${mypro.deposit }</span><br/>
					</div>
				</div>
			</div>
		</div>
	</c:forEach> 
 --%>
</body>
</html> 