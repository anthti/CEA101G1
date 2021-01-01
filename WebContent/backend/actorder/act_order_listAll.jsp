<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.actorder.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    ActOrderService actOrderSvc = new ActOrderService();
    List<ActOrderVO> list = actOrderSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<html>
<head>
<title>�Ҧ����ʭq�� - act_order_listAll.jsp</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/back/backend.css" type="text/css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/back/backend-search.css" type="text/css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/back/backend-add.css" type="text/css" />
</head>
<body bgcolor='white'>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
       <div class="logo" >
			<img src="<%=request.getContextPath()%>/img/logo.png" style="margin-left:450px;">
		</div>
		<div class="form-title">
			<img src="<%=request.getContextPath()%>/img/loading.png">
			<h2 style="margin-left:80px;">�q��d��</h2>
		</div>

	
			<div class="dropdown">
				<div class="btn1">
				     <button type="button" class="btn btn-outline-danger" 
                      onclick="location.href='<%=request.getContextPath()%>/backend/actorder/backend-order_select_page.jsp?action=getAll'">
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
			</div>
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
              <c:forEach var="actOrderVO" items="${list}">
              
                   <td>${actOrderVO.actOdno}</td>
	               <td>${actOrderVO.actNo}</td>
	               <td>${actOrderVO.mbId}</td>
	               <td>
	               <c:choose>
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
              </c:forEach>
         </tbody>
     </table>
     <nav id="pagination-1" aria-label="Page navigation example" >
		<ul class="pagination" style="magrin-left:150px;">
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
			</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</nav>
     
</div>


</body>
</html>