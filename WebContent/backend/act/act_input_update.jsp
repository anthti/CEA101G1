<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.act.model.*"%>

<%
     ActVO actVO = (ActVO) request.getAttribute("actVO"); 
    //ActServlet.java(Concroller), �s�Jreq��ActVO���� (�]�A�������X��ActEventVO����, �]�]�A��J��ƿ��~�ɪ�empActTYpeVO����)
%>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/back/backend-act_add.css" type="text/css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <title>�קﬡ�� - addAct.jsp</title>
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

        <div class="logo">
			<img src="<%=request.getContextPath()%>/img/logo.png">
		</div>
		<div class="form-title">
			<img src="<%=request.getContextPath()%>/img/loading.png">
			<h2>���ʬd��</h2>
		</div>


<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/act/ActServlet" name="form1">
<div id="form">
             <li>
                <label for="inputEmail4" class="alert alert-primary" role="alert">���ʽs��: (ACT_ODNo):</label>
                <input type="text" class="form-control" id="input-Act-no" placeholder="ACT_ODNo" name="actNo" size="45"
                size="45" required placeholder="�п�J���ʽs��" value="<%= (actVO==null)? "" : actVO.getActNo()%>" />
            </li>
            <li>
                <label for="inputPassword4" class="alert alert-danger">���ʶ��ؽs��:(ACT_Event_No):</label>
                <input type="text" class="form-control" id="input-Act-Event-No"  name="actEventNo" size="45"
                 placeholder="�п�ܬ��ʶ��ؽs��" value="<%= (actVO==null)? "" :actVO.getActEventNo()%>"  />
            </li>
            <li>
                <label class="alert alert-primary" role="alert">���ʦW��: (ACT_Name):</label>
                <input type="text" class="form-control" id="input-Act-Namel4" name="actName" size="45" 
                 placeholder="�п�J���ʦW��" value="<%= (actVO==null)? "" :actVO.getActName()%>"/>
            </li>
            <li>
                <label class="alert alert-danger">���ʪ��A: (ACT_Status):</label>
                <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)" 
                name="actStatus" size="45" value="<%= (actVO==null)? "" :actVO.getActStatus()%>" />
            </li>
            <li>
                <label class="alert alert-primary" role="alert">���ʳ��W���:</label>
                <input type="date" class="form-control" id="input-Act-Namel4" name="actRegTime" size="45"
                 value="<%= (actVO==null)? "" :actVO.getActRegTime()%>" />
            </li>
            <li>
                <label class="alert alert-primary" role="alert">���ʺI����:</label>
                <input type="date" class="form-control" id="input-Act-Namel4" name="deadLine" size="45"
                 value="<%= (actVO==null)? "" :actVO.getDeadLine()%>" />
            </li>
             <li>
                <label class="alert alert-primary" role="alert">�����|����:</label>
                <input type="date" class="form-control" id="input-Act-Namel4" name="actDate" size="45"
                 value="<%= (actVO==null)? "" :actVO.getActDate()%>" />
            </li>
            <li>
                <label class="alert alert-danger">���ʮɬq: (ACT_Time):</label>
                <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)" placeholder="���ʮɬq�ж�J���I�Ʀr,�p:1600"
                name="actTime" size="45" value="<%= (actVO==null)? "" :actVO.getActTime()%>" />
            </li>
            <li>
                <label class="alert alert-danger">�|���m�W: (ACT_Status):</label>
                <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)" placeholder="�ж�J�m�W"
                name="participant" size="45" value="<%= (actVO==null)? "" :actVO.getParticipant()%>" />
            </li>
            <li>
                <label class="alert alert-primary" role="alert">���ʻ���:</label>
                <input type="text" class="form-control" id="input-Act-Namel4" name="actPrice" size="45"
                 placeholder="�ж�J�Ʀr" value="<%= (actVO==null)? "" :actVO.getActPrice()%>" />
            </li>
      </div> 
        
	    <div class="message" style="margin-left:600px; margin-top:500px;">
	              <input type="hidden" name="action" value="update">
                  <input type="hidden" name="ActNo" value="<%=actVO.getActNo()%>">
                  <button type="submit" class="btn btn-primary">�e�X�ק�</button>
                  <button type="reset" class="btn btn-primary">���]</button>
                  <button type="button" class="btn btn-outline-danger"
                  onclick="location.href='<%=request.getContextPath()%>/back-end/act/backend-act_select_page.jsp'">
                                                 �^����</button>
         </div>
    
</FORM>>
<!-- �������e���� -->
	
	<script src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
	<script src="<%=request.getContextPath()%>/js/back/index-back.js"></script>
    
     </body>
</html>