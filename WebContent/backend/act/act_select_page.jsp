<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>CEA101G1-ACT</title>
<title>Diamond Resort ��x�޲z</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/back/backend-add.css" type="text/css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/back/backend-select_page.css" type="text/css" /> 

</head>
<body bgcolor='white'>

     <div class="logo">
			<img src="<%=request.getContextPath()%>/img/logo.png"  style="margin-left: 450px;">
		</div>
		<div class="form-title">
			<img src="<%=request.getContextPath()%>/img/loading.png">
			<h2 style="margin-left: 80px;">���ʬd��</h2>
	</div>

	<ul id="search-table">
		<nav class="navbar-top navbar-light" style="margin-left: 180px;">
			<form class="form-inline">
				<button class="btn btn-outline-dark" type="button" 
				onclick="location.href='<%=request.getContextPath()%>/backend/act/backend-act_listAll.jsp?action=getAll'">
				  �d�ߥ�������
				</button>
				<button class="btn btn-outline-dark" type="button" 
				onclick="location.href='<%=request.getContextPath()%>/backend/act/backend-act_add.jsp'">
				  �s�W����
				</button>
				<button class="btn btn-outline-dark" type="button" 
				onclick="location.href='<%=request.getContextPath()%>/backend/actpic/backend-act_pic_add.jsp'">
				  �s�W�Ӥ�
				</button>
			</form>
		</nav>

<ul>
  
   <jsp:useBean id="ActSvc" scope="page" class="com.act.model.ActService" />
  <li id="font">
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/act/ActServlet">
				<div class="input-group mb-3">
					<h5>���ʽs��:</h5>
					<input type="hidden" name="action" class="form-control"
						value="getOne_For_Display"> <input type="text"
						name="actOdno" class="form-control" placeholder="���ʽs��"
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
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/act/ActServlet">
				<div class="input-group mb-3">
					<h5>���ʦW��:</h5>
					<select size="1" class="custom-select" id="inputGroupSelect02" name="actNo">
                      <c:forEach var="actVO" items="${ActSvc.all}" > 
                         <option value="${actVO.actNo}">${actVO.actName}
                      </c:forEach>   
                    </select> 
                    <input type="hidden" name="action" value="getOne_For_Display">
					<button class="btn btn-outline-secondary" type="submit"
						id="button-addon2">�e�X</button>
				</div>
			</FORM>
		</li>
		<li id="font">
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/act/ActServlet">
				<div class="input-group mb-3">
					<h5>���ʽs��:</h5>
					<select size="1" name="actNo" class="custom-select" id="inputGroupSelect02">
                       <c:forEach var="actVO" items="${ActSvc.all}" > 
                           <option value="${actVO.actNo}">${actVO.actEventNo}
                       </c:forEach>   
                    </select> 
                    <input type="hidden" name="action" value="getOne_For_Display">
					<button class="btn btn-outline-secondary" type="submit"
						id="button-addon2">�e�X</button>
				</div>
			</FORM>
		</li>
  
</ul>

<!-- �������e���� -->

</body>

</html>