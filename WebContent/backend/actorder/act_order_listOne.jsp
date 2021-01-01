<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.actorder.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
   ActOrderVO actOrderVO = (ActOrderVO) request.getAttribute("actOrderVO"); //ActServlet.java(Concroller), �s�Jreq��ActVO����
%>

<html>
<head>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/back/backend.css" type="text/css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/back/backend-search.css" type="text/css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/back/backend-add.css" type="text/css" /> 

<title>���ʭq���� - actOrder_listOne.jsp</title>

</head>
<div class="logo">
			<img src="<%=request.getContextPath()%>/img/logo.png" style="margin-left:450px;">
		</div>
		<div class="form-title">
			<img src="<%=request.getContextPath()%>/img/loading.png">
			<h2 style="margin-left:80px;">�q��d��</h2>
		</div>
		
		<nav class="navbar-top navbar-light" >
			<form class="form-inline">
				<button class="btn btn-outline-success" type="button" 
				onclick="location.href='<%=request.getContextPath()%>/backend/actorder/backend-order_select_page.jsp'">
				  �^�q��d��
				</button>
			</form>
		</nav>
		<br>
		

<div class="table-content" id="content">
    <table class="table table-hover" id="table">
       <thead class="title">
              <tr class="table-primary">
                <th>���ʭq��s��:</th>
                <th>���ʽs��:</th>
                <th>�|���s��:</th>
                <th>�q�檬�A:</th>
                <th>�q����:</th>
                <th>�ѥ[�H��:</th>
                <th>�q���`����:</th>
                <th>�ק�</th>
              </tr>
        </thead>
        <tbody>
              <tr>
                   <td>${actOrderVO.actOdno}</td>
	               <td>${actOrderVO.actNo}</td>
	               <td>${actOrderVO.mbId}</td>
	               <td> <c:choose>
						<c:when test="${actOrderVO.odStatus == 0}">�i�椤</c:when>
						<c:when test="${actOrderVO.odStatus == 1}">�w����</c:when>
					    <c:otherwise>�w����</c:otherwise>
				   </c:choose>
				   </td>
	               <td>${actOrderVO.odTime}</td>
	               <td>${actOrderVO.ppl}</td>
	               <td>${actOrderVO.totalPrice}</td>
                   
                    <td>
                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/actorder/ActOrderServlet" style="margin-bottom: 0px;">
                    <button type="submit" class="btn btn-outline-dark" value="�ק�"> �ק�</button>
                    <input type="hidden" name="actOdno"  value="${actOrderVO.actOdno}">
			        <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
                   </td>
              </tr>
         </tbody>
     </table>
</div>

    <script src="<%=request.getContextPath()%>/js/backend_js/jquery-3.5.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/backend_js/jquery-ui.js"></script>
	<script src="<%=request.getContextPath()%>/js/backend_js/index-back.js"></script>
	<script src="<%=request.getContextPath()%>/js/backend_js/bootstrap.bundle.js"></script>
	<script src="<%=request.getContextPath()%>/js/backend_js/bootstrap.bundle.min.js"></script>
</body>

</html>