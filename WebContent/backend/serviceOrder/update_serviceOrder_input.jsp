<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.service_order.model.*"%>

<%
	ServiceOrderVO serviceOrderVO = (ServiceOrderVO) request.getAttribute("serviceOrderVO"); //ServiceOrderServlet.java (Concroller) 存入req的serviceOrderVO物件 (包括幫忙取出的serviceOrderVO, 也包括輸入資料錯誤時的serviceOrderVO物件)
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<style>
body {
	margin-left: 30px;
	margin-right: 30px;
}
#preview img{
max-width:300px;

}

</style>
<title>修改訂單</title>
</head>
<body>
	<form METHOD="post"
		ACTION="${pageContext.request.contextPath}/ServiceOrderServlet"
		name="form1">
		<div class="form-group">
			服務編號:<%=serviceOrderVO.getServ_odno()%>
		</div>
		<div class="form-group">
			<label for="serv_type_no">會員編號:</label> <input type="text"
				class="form-control" id="mb_id" name="mb_id"
				value="<%=serviceOrderVO.getMb_id()%>" required>
		</div>
		<div class="form-group">
			<label for="serv_status">訂單狀態編號:</label> <input type="text"
				class="form-control" id="od_status" name="od_status"
				value="<%=serviceOrderVO.getOd_status()%>" required>
		</div>
		<div class="form-group">
			<label for="serv_price">客房編號:</label> <input type="text"
				class="form-control" id="rm_no" name="rm_no"
				value="<%=serviceOrderVO.getRm_no()%>">
		</div>
		<div class="form-group">
			<label for="serv_info">服務編號:</label> <input type="text"
				class="form-control" id="serv_no" name="serv_no"
				value="<%=serviceOrderVO.getServ_no()%>">
		</div>
		<div class="form-group">
			<label for="serv_name">預約時間:</label> <input type="text"
				class="form-control" id="serv_time" name="serv_time"
				value="<%=serviceOrderVO.getServ_time()%>" required>
		</div>
		<div class="form-group">
			<label for="serv_dura">服務人數:</label> <input type="text"
				class="form-control" id="serv_count" name="serv_count"
				value="<%=serviceOrderVO.getServ_count()%>" required>
		</div>
		<div class="form-group">
			<label for="serv_ppl">訂單總額:</label> <input type="text"
				class="form-control" id="total_price" name="total_price"
				value="<%=serviceOrderVO.getTotal_price()%>" required>
		</div>
		<input type="hidden" name="action" value="update"> <input
			type="hidden" name="serv_odno" value="<%=serviceOrderVO.getServ_odno()%>">
		<input class="btn btn-primary" type="submit" value="送出修改">
	</form>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
		integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
		crossorigin="anonymous"></script>

	
</body>
</html>