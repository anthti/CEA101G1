<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.act.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
	ActService actSvc = new ActService();
	List<ActVO> list = actSvc.getAll();
	pageContext.setAttribute("list", list);
%>


<html>
<head>
<title>�Ҧ����ʸ�� - listAllAct.jsp</title>

      <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css" />
      <link rel="stylesheet" href="<%=request.getContextPath()%>/css/back/backend.css" type="text/css" />
      <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.css">
      <link rel="stylesheet" href="<%=request.getContextPath()%>/css/back/backend-search.css" type="text/css" />

</head>
<body bgcolor='white'>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	
	
	
	<div class="logo">
			<img src="<%=request.getContextPath()%>/img/logo.png" style="width:30%;">
		</div>
		<div class="form-title" style="margin-left:100px;">
			<img src="<%=request.getContextPath()%>/img/loading.png">
			<h2>���ʬd��</h2>
		</div>
		
		  <div class="btn1" style="margin-right:80px;">
				     <button type="button" class="btn btn-outline-danger" 
                      onclick="location.href='<%=request.getContextPath()%>/back-end/act/backend-act_select_page.jsp?action=getAll'">
                                                          �^����</button>
					<a class="btn btn-secondary dropdown-toggle" href="#" role="button"
						id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> �q�檬�A </a>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<a class="dropdown-item" href="#">���W��</a> <a class="dropdown-item"
							href="#">�w����</a> <a class="dropdown-item" href="#">�w����</a>
					</div>
					<a class="btn btn-secondary dropdown-toggle" href="#" role="button"
						id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true">
						���ʶ��� </a>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						<a class="dropdown-item" href="#">�F�y��</a> <a class="dropdown-item"
							href="#">�g�b</a> <a class="dropdown-item" href="#">�O�|</a> <a
							class="dropdown-item" href="#">�Į�</a> <a class="dropdown-item"
							href="#">�B��</a> <a class="dropdown-item" href="#">���H</a> <a
							class="dropdown-item" href="#">BBQ</a> <a class="dropdown-item"
							href="#">�`��</a> <a class="dropdown-item" href="#">���y</a>
					</div>
			</div>
			<br>

	<div class="table-content" id="content">
		<table class="table table-hover" id="table">
			<thead class="title">
				<tr class="table-primary">
					<th>���ʽs��</th>
					<th>���ʶ��ؽs��</th>
					<th>���ʦW��</th>
					<th>���ʪ��A</th>
					<th>���ʳ��W���</th>
					<th>���W�I����</th>
					<th>�����|����</th>
					<th>���ʮɬq</th>
					<th>�ѥ[��</th>
					<th>���ʻ���</th>
					<th>�ק�</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:forEach var="actVO" items="${list}">
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
								<FORM METHOD="post"
									ACTION="<%=request.getContextPath()%>/act/ActServlet"
									style="margin-bottom: 0px;">
									 <button type="submit" class="btn btn-outline-dark"> �ק�</button> 
									<input type="hidden"
										name="actNo" value="${actVO.actNo}"> <input
										type="hidden" name="action" value="getOne_For_Update">
								</FORM>
							</td>
						</tr>
					</c:forEach>
				</tr>
			</tbody>
		</table>
	</div>

</body>
</html>