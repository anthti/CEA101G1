<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/img/loading.png" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/front/style-for-all.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/front/booking.css" />
<title>戴蒙訂房系統</title>
</head>
<style>
	.bk-msg {
		margin: 0 auto;
		display:flex;
		flex-direction: column;
		justify-content:space-evenly;
		width: 300px;
		margin-top: -200px;
		text-align: center;
		padding: 20px 10px;
		backdrop-filter:blur(5px);
		opacity:0;
	} 
	.bk-msg i {
		font-size:5em;
		margin-bottom:20px;
		color: #81b214;
	}
	.bk-msg h2,
	.bk-msg h3 {
		margin: 10px;
		letter-spacing:2px;
		color:222831;
		font-weight:400;
	}
	.main-wrapper {
		position: absolute;
		left:0px;
		top:0px;
		height:100vh;
		width:100vw;
		display: flex;
		flex-direction: column;
		justify-content: center;
		
	}
	.main-wrapper .bk-msg a {
		text-align: center;
		width: 280px;
		height:50px;
		font-size:20px;
		align-self:center;
		padding: 5px 0px;
		margin: 10px 0px;
		display:flex;
		flex-direction:column;
		justify-content:center;
		letter-spacing: 2px;
		border-radius: 5px;
		border: 1px solid black;
		text-decoration:none;
		color:black;
	}
	.main-wrapper a:hover {
		color:black;
		background-color:white;
		box-shadow:0px 1px 1px solid grey;
		transform:scale(1.01);
	}
	.main-wrapper{
		min-width:100%;
	}
</style>
<body>
	<!-- preloader -->
	<div id="preloder">
		<img id="preloaderpic"
			src="${pageContext.request.contextPath}/img/loading.png" />
		<div class="loader"></div>
	</div>
	<!-- preloader -->
	<!-- header start -->
	<header class="booking-header">
		<div class="logo">
			<img src="<%=request.getContextPath()%>/img/logo.png" alt="" />
		</div>
	</header>
	<!-- header end -->
	<div class="banner-pic">
		<img src="<%=request.getContextPath()%>/img/booking-bg.jpeg" alt="" />
	</div>
	<!-- 主頁面 -->
	<div class="main-wrapper">

		<div class="bk-msg">
			<i class="far fa-check-circle"></i>
			<h2>付款預訂完成</h2>
			<h3>開始規劃您的假期</h3>
			<a href="<%=request.getContextPath()%>/frontend/roomrsv/pickup.jsp">預約接送</a>
			<a href="<%=request.getContextPath()%>/frontend/members/memberBooking.jsp">假期管理</a>
			<a href="<%=request.getContextPath()%>/frontend/index.jsp">返回首頁</a>
		</div>
		
	</div>

	<script src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script src="<%=request.getContextPath()%>/js/front/main.js"></script>
	<script>
		$(document).ready(function(){
			$(".banner-pic").animate({height: "100vh"}, 2000, function(){
				$(".bk-msg").animate({opacity: "1", marginTop: "40px"},1000, function(){
					$(".bk-msg").animate({marginTop:"30px"}, 200)
				});
			});
		})
	</script>
</body>
</html>