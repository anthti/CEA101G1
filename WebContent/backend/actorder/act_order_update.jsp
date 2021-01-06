<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.actorder.model.*"%>

<%
     ActOrderVO actOrderVO = (ActOrderVO) request.getAttribute("actOrderVO"); 
    //ActServlet.java(Concroller), �s�Jreq��ActVO���� (�]�A�������X��ActEventVO����, �]�]�A��J��ƿ��~�ɪ�empActTYpeVO����)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta charset="UTF-8" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/back/backend-add.css" type="text/css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.css">
    <title>�ק�q�� - addAct.jsp</title>
</head>

<body>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

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
                <label class="alert alert-primary" role="alert">�q�нs��: (BK_NO):</label>
                <input type="text" class="form-control" id="input-Act-Namel4" name="bkNo" size="45" 
                 placeholder="BK_NO" value="<%= (actOrderVO==null)? "" :actOrderVO.getBkNo()%>" />
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
	              <input type="hidden" name="action" value="update">
	              <input type="hidden" name="actOdno" value="<%=actOrderVO.getActOdno()%>">
                  <button type="submit" class="btn btn-primary">�e�X�ק�</button>
                  <button type="reset" class="btn btn-primary">���]</button>
                  <button type="button" class="btn btn-outline-danger"
                  onclick="location.href='<%=request.getContextPath()%>/back-end/actorder/backend-order_select_page.jsp?action=getAll'">
                                                 �^����</button>
         </div>
    
</FORM>
  <!-- �������e���� -->

  
    <script src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
	<script src="<%=request.getContextPath()%>/js/index-back.js"></script>
    <script src="https://kit.fontawesome.com/dc3c868026.js" crossorigin="anonymous"></script>
     </body>
</html>