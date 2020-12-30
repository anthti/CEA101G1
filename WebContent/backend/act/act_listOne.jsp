<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.act.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
   ActVO actVO = (ActVO) request.getAttribute("actVO"); //ActServlet.java(Concroller), 存入req的ActVO物件
%>

<html>
<head>

      <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css" />
      <link rel="stylesheet" href="<%=request.getContextPath()%>/css/back/backend.css" type="text/css" />
      <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.css">
      <link rel="stylesheet" href="<%=request.getContextPath()%>/css/back/backend-search.css" type="text/css" />

<title>活動資料 - actOrder_listOne.jsp</title>

</head>

       <div class="logo">
			<img src="<%=request.getContextPath()%>/img/logo.png">
		</div>
		<div class="form-title">
			<img src="<%=request.getContextPath()%>/img/loading.png">
			<h2>活動查詢</h2>
		</div>
		<br>

		<nav class="navbar-top navbar-light" style="margin-left:120px;">
			<form class="form-inline">
				<button class="btn btn-outline-success" type="button" 
				onclick="location.href='<%=request.getContextPath()%>/back-end/act/backend-act_select_page.jsp'">
				  回活動查詢
				</button>
			</form>
		</nav>
		<br>
<body bgcolor='white'>

<div class="table-content" id="content">
    <table class="table table-hover" id="table">
       <thead class="title">
              <tr class="table-primary">
                <th>活動編號</th>
		        <th>活動項目編號</th>
		        <th>活動名稱</th>
		        <th>活動狀態</th>
		        <th>活動報名日期</th>
		        <th>活動舉辦日期</th>
		        <th>活動截止日期</th>
		        <th>活動時段</th>
		        <th>參加人數</th>
		        <th>活動價格</th>
		        <th>修改</th>
              </tr>
        </thead>
        <tbody>
              <tr>
                  <td>${actVO.actNo}</td>
	              <td>${actVO.actEventNo}</td>
	              <td>${actVO.actName}</td>
	              <td>
	                  <c:choose>
							<c:when test="${actVO.actStatus == 0}">進行中</c:when>
						    <c:when test="${actVO.actStatus == 1}">已完成</c:when>
							<c:otherwise>已取消</c:otherwise>
					  </c:choose>
				  </td>
	              <td>${actVO.actRegTime}</td>
	              <td>${actVO.actDate}</td>
	              <td>${actVO.deadLine}</td>
	              <td>${actVO.actTime}</td>
	              <td>${actVO.participant}</td>
	              <td>${actVO.actPrice}</td>
                   
                    <td>
                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/act/ActServlet" style="margin-bottom: 0px;">
                    <button type="submit" class="btn btn-outline-dark" value="修改"> 修改</button>
                    <input type="hidden" name="actNo"  value="${actVO.actNo}">
			        <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
                   </td>
              </tr>
         </tbody>
     </table>
</div>


 <script src="<%=request.getContextPath()%>/js/back/jquery-3.5.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/back/jquery-ui.js"></script>
	<script src="<%=request.getContextPath()%>/js/back/index-back.js"></script>
	<script src="<%=request.getContextPath()%>/js/back/bootstrap.bundle.js"></script>
	<script src="<%=request.getContextPath()%>/js/back/bootstrap.bundle.min.js"></script>
</body>

</html>