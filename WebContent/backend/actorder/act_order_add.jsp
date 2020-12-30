<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.actorder.model.*"%>

<%
    ActOrderVO actOrderVO = (ActOrderVO) request.getAttribute("actOrderVO"); 
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta charset="UTF-8" />

    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/back/backend-add.css" type="text/css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

    <title>�s�W���ʭq�� - addAct.jsp</title>
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

       <div class="logo">
			<img src="<%=request.getContextPath()%>/img/logo.png">
		</div>
		<div class="form-title">
			<img src="<%=request.getContextPath()%>/img/loading.png">
			<h2>���ʬd��</h2>
		</div>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/actorder/ActOrderServlet" name="form1">
     <div id="form">
             <li>
                <label for="inputEmail4" class="alert alert-primary" role="alert">���ʭq��s��: (ACT_ODNo):</label>
                <input type="text" class="form-control" id="input-Act-no" placeholder="ACT_ODNo" name="actOdno" 
                size="45" required placeholder="�п�J���ʭq��s��" value="<%= (actOrderVO==null)? "" : actOrderVO.getActOdno()%>" />
            </li>
            <li>
                <label for="inputPassword4" class="alert alert-danger">���ʽs�� (ACT_No):</label>
                <input type="text" class="form-control" id="input-Act-Event-No"  name="actNo" size="45"
                 placeholder="ACT_No" value="<%= (actOrderVO==null)? "" :actOrderVO.getActNo()%>" /> 
            </li>
            <li>
                <label class="alert alert-primary" role="alert">�|���s��: (MB_ID):</label>
                <input type="text" class="form-control" id="input-Act-Namel4" name="mbId" size="45" 
                 placeholder="MB_ID" value="<%= (actOrderVO==null)? "" :actOrderVO.getMbId()%>" />
            </li>
            <li>
                <label class="alert alert-danger">�q����: (OD_Time):</label>
                <input type="date" class="form-control" aria-label="Amount (to the nearest dollar)" 
                name="odTime" size="45" value="<%= (actOrderVO==null)? "" :actOrderVO.getOdTime()%>" />
            </li>
            <li>
                <label class="alert alert-primary" role="alert">���ʪ��A:</label>
                <input type="text" class="form-control" id="input-Act-Namel4" name="odStatus" size="45"
                 placeholder="ACT_Status" value="<%= (actOrderVO==null)? "" :actOrderVO.getOdStatus()%>" />
            </li>
            <li>
                <label class="alert alert-primary" role="alert">�ѥ[�H��:</label>
                <input type="text" class="form-control" id="input-Act-Namel4" name="ppl" size="45"
                 placeholder="Participant" value="<%= (actOrderVO==null)? "" :actOrderVO.getPpl()%>" />
            </li>
            <li>
                <label class="alert alert-primary" role="alert">�q���`����:</label>
                <input type="text" class="form-control" id="input-Act-Namel4" name="totalPrice" size="45"
                 placeholder="Total_Price" value="<%= (actOrderVO==null)? "" :actOrderVO.getTotalPrice()%>" />
                </div>
            </li>
      </div> 
        
	    <div class="message" style="margin-top:320px;">
	              <input type="hidden" name="action" value="insert">
                  <button type="submit" class="btn btn-primary">�s�W</button>
                  <button type="reset" class="btn btn-primary">���]</button>
                  <button type="button" class="btn btn-outline-danger"
                  onclick="location.href='<%=request.getContextPath()%>/back-end/actorder/backend-order_select_page.jsp?action=getAll'">
                                                 �^����</button>
         </div>
    
</FORM>>
        <!-- �������e���� -->
  
    <script src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
	<script src="<%=request.getContextPath()%>/js/index-back.js"></script>
    <script src="https://kit.fontawesome.com/dc3c868026.js" crossorigin="anonymous"></script>
     </body>
</html>