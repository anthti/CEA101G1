<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.act.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
   ActVO actVO = (ActVO) request.getAttribute("actVO"); //ActServlet.java(Concroller), �s�Jreq��ActVO����
%>

<html>
<head>

      <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css" />
      <link rel="stylesheet" href="<%=request.getContextPath()%>/css/back/backend.css" type="text/css" />
      <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.css">
      <link rel="stylesheet" href="<%=request.getContextPath()%>/css/back/backend-search.css" type="text/css" />
      <link rel="stylesheet" href="<%=request.getContextPath()%>/css/back/backend-add.css" type="text/css" />

<title>���ʸ�� - actOrder_listOne.jsp</title>

</head>

       <div class="logo">
			<img src="<%=request.getContextPath()%>/img/logo.png" style="margin-left:450px;">
		</div>
		<div class="form-title">
			<img src="<%=request.getContextPath()%>/img/loading.png">
			<h2 style="margin-left:80px;">���ʬd��</h2>
		</div>
		<br>

		<nav class="navbar-top navbar-light" style="margin-left:120px;">
			<form class="form-inline">
				<button class="btn btn-outline-success" type="button" 
				onclick="location.href='<%=request.getContextPath()%>/backend/act/backend-act_select_page.jsp'">
				  �^���ʬd��
				</button>
			</form>
		</nav>
		<br>
<body bgcolor='white'>

<div class="table-content" id="content">
    <table class="table table-hover" id="table">
       <thead class="title">
              <tr class="table-primary">
                <th>���ʽs��</th>
		        <th>���ʶ��ؽs��</th>
		        <th>���ʦW��</th>
		        <th>���ʪ��A</th>
		        <th>���ʳ��W���</th>
		        <th>�����|����</th>
		        <th>���ʺI����</th>
		        <th>���ʮɬq</th>
		        <th>�ѥ[�H��</th>
		        <th>���ʻ���</th>
		        <th>���ʷӤ�</th>
				<th>���ʸ�T</th>
		        <th>�ק�</th>
              </tr>
        </thead>
        <tbody>
              <tr>
                  <td>${actVO.actNo}</td>
	              <td>${actVO.actEventNo}</td>
	              <td>${actVO.actName}</td>
	              <td>
	                  <c:choose>
							<c:when test="${actVO.actStatus == 0}">�i�椤</c:when>
						    <c:when test="${actVO.actStatus == 1}">�w����</c:when>
							<c:otherwise>�w����</c:otherwise>
					  </c:choose>
				  </td>
	              <td>${actVO.actRegTime}</td>
	              <td>${actVO.actDate}</td>
	              <td>${actVO.deadLine}</td>
	              <td>${actVO.actTime}</td>
	              <td>${actVO.participant}</td>
	              <td>${actVO.actPrice}</td>
				  <td>
					  <img src="<%=request.getContextPath()%>/ActPicReaderServlet?actEventNo=${actVO.actEventNo}&action=getOnePic">
				  </td>
				  <td>${actVO.actInfo}</td>
                   
                    <td>
                    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/act/ActServlet" style="margin-bottom: 0px;">
                    <button type="submit" class="btn btn-outline-dark" value="�ק�"> �ק�</button>
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