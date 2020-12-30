<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>CEA101G1-ACT</title>
<title>Diamond Resort ��x�޲z</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
    <title>Diamond Resort ��x�޲z</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/back/backend-add.css" type="text/css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/back/backend-select_page.css" type="text/css" /> 
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
	

	<ul id="search-table">
		<nav class="navbar-top navbar-light" style="width:400px;">
			<form class="form-inline">
				<button class="btn btn-outline-success" type="button" 
				onclick="location.href='<%=request.getContextPath()%>/backend/actorder/backend-order_listAll.jsp?action=getAll'">
				  �d�ߥ����q��
				</button>
				<button class="btn btn-outline-success" type="button" 
				onclick="location.href='<%=request.getContextPath()%>/backend/actorder/backend-order_add.jsp'">
				  �s�W�q��
				</button>
				<button class="btn btn-outline-success" type="button" 
				onclick="location.href='<%=request.getContextPath()%>/backend/actpic/backend-act_pic_add.jsp'">
				  �s�W�Ӥ�
				</button>
			</form>
		</nav>
		
		<jsp:useBean id="ActOrderSvc" scope="page"
			class="com.actorder.model.ActOrderService" />
		<li id="font">
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/actorder/ActOrderServlet">
				<div class="input-group mb-3">
					<h5>�q��s��:</h5>
					<input type="hidden" name="action" class="form-control"
						value="getOne_For_Display"> <input type="text"
						name="actOdno" class="form-control" placeholder="�q��s��"
						aria-label="���ʭq��s��" aria-describedby="button-addon2">
					<div class="input-group-append">
						<input type="hidden" name="action">
						<button class="btn btn-outline-secondary" type="submit"
							id="button-addon2">�e�X</button>
					</div>
				</div>
			</FORM>
		</li>
		<li id="font">
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/actorder/ActOrderServlet">
				<div class="input-group mb-3">
					<h5>�|���s��:</h5>
					<select class="custom-select" id="inputGroupSelect02"
						name="actOdno">
						<c:forEach var="actOrderVO" items="${ActOrderSvc.all}">
							<option value="${actOrderVO.actOdno}">${actOrderVO.mbId}
						</c:forEach>
					</select> <input type="hidden" name="action" value="getOne_For_Display">
					<button class="btn btn-outline-secondary" type="submit"
						id="button-addon2">�e�X</button>
				</div>
			</FORM>
		</li>
		<li id="font">
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/actorder/ActOrderServlet">
				<div class="input-group mb-3">
					<h5>���ʽs��:</h5>
					<select class="custom-select" id="inputGroupSelect02"
						name="actOdno">
						<c:forEach var="actOrderVO" items="${ActOrderSvc.all}">
							<option value="${actOrderVO.actOdno}">${actOrderVO.actNo}
						</c:forEach>
					</select> <input type="hidden" name="action" value="getOne_For_Display">
					<button class="btn btn-outline-secondary" type="submit"
						id="button-addon2">�e�X</button>
				</div>
			</FORM>
		</li>

	</ul>

	<!-- �������e���� -->
	</div>

</body>

</html>