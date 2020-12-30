<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.actevent.model.*"%>

<%
     ActEventVO actEventVO = (ActEventVO) request.getAttribute("actEventVO"); 
    //ActEventServlet.java(Concroller), 存入req的ActEvenVO物件 (包括幫忙取出的ActEventVO物件, 也包括輸入資料錯誤時的empActTYpeVO物件)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>活動種類修改 - update_act_type_input.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>活動種類修改 - update_act_type_input.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/actevent/act_event_select_page.jsp"><img src="img/logo.png" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料修改:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="ActEventServlet" name="form1">
<table>
	
	<tr>
		<td>新增活動項目編號:</td>
		<td><input type="TEXT" name="actEventNo" size="45"	placeholder="請輸入新活動項目編號"
		value="<%=actEventVO.getActEventNo()%>" /></td>
	</tr>
	<tr>
		<td>活動種類編號:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="actTypeNo" size="45"	placeholder="請輸入活動種類編號"
		value="<%=actEventVO.getActTypeNo()%>" /></td>
	</tr>
	<tr>
		<td>活動項目名稱:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="actEventName" size="45"	placeholder="請輸入活動項目名稱"
		value="<%=actEventVO.getActEventName()%>" /></td>
	</tr>
	<tr>
		<td>活動敘述:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="actInfo" size="45"	placeholder="請輸入活動敘述"
		value="<%=actEventVO.getActInfo()%>" /></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="empno" value="<%=actEventVO.getActEventNo()%>">
<input type="submit" value="送出修改"></FORM>
</body>
</html>