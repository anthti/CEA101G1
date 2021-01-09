<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.act.model.*"%>

<%
	ActVO actVO = (ActVO) request.getAttribute("actVO");
%>
<html>
<head>
<meta charset="UTF-8" />
<title>�s�W���ʭq�� - addAct.jsp</title>
</head>
<body>
	<div>
		<div class="showmsg">
			<h3 class="msg">
				<c:if test="${not empty errorMsgs}">
					<font style="color: red">�Эץ��H�U���~:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color: red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>
			</h3>
		</div>
		<FORM METHOD="post"
			ACTION="<%=request.getContextPath()%>/act/ActServlet" name="form1"
			enctype="multipart/form-data">
			<div id="form">
				<li><label for="inputEmail4" class="alert alert-primary"
					role="alert">���ʽs��: (ACT_No):</label> <input type="text"
					class="form-control" id="input-Act-no" placeholder="ACT_No"
					name="actNo" size="45" size="45" required placeholder="�п�J���ʽs��"
					value="<%=(actVO == null) ? "" : actVO.getActNo()%>" /></li>
				<li><label for="inputPassword4" class="alert alert-danger">���ʶ��ؽs��:(ACT_Event_No):</label>
					<input type="text" class="form-control" id="input-Act-Event-No"
					name="actEventNo" size="45" placeholder="�п�ܬ��ʶ��ؽs��"
					value="<%=(actVO == null) ? "" : actVO.getActEventNo()%>" /></li>
				<li><label class="alert alert-primary" role="alert">���ʦW��:
						(ACT_Name):</label> <input type="text" class="form-control"
					id="input-Act-Namel4" name="actName" size="45"
					placeholder="�п�J���ʦW��"
					value="<%=(actVO == null) ? "" : actVO.getActName()%>" /></li>
				<li><label class="alert alert-danger">���ʪ��A:
						(ACT_Status):</label> <input type="text" class="form-control"
					aria-label="Amount (to the nearest dollar)" name="actStatus"
					size="45" value="<%=(actVO == null) ? "" : actVO.getActStatus()%>" />
				</li>
				<li><label class="alert alert-primary" role="alert">���ʳ��W���:</label>
					<input type="date" class="form-control" id="input-Act-Namel4"
					name="actRegTime" size="45"
					value="<%=(actVO == null) ? "" : actVO.getActRegTime()%>" /></li>
				<li><label class="alert alert-primary" role="alert">�����|����:</label>
					<input type="date" class="form-control" id="input-Act-Namel4"
					name="actDate" size="45"
					value="<%=(actVO == null) ? "" : actVO.getActDate()%>" /></li>
				<li><label class="alert alert-primary" role="alert">���ʺI����:</label>
					<input type="date" class="form-control" id="input-Act-Namel4"
					name="deadLine" size="45"
					value="<%=(actVO == null) ? "" : actVO.getDeadLine()%>" /></li>
				<li><label class="alert alert-danger">���ʮɬq: (ACT_Time):</label>
					<input type="text" class="form-control"
					aria-label="Amount (to the nearest dollar)"
					placeholder="���ʮɬq�ж�J���I�Ʀr,�p:1600" name="actTime" size="45"
					value="<%=(actVO == null) ? "" : actVO.getActTime()%>" /></li>
				<li><label class="alert alert-danger">�|���m�W:
						(Participant):</label> <input type="text" class="form-control"
					aria-label="Amount (to the nearest dollar)" placeholder="�ж�J�m�W"
					name="participant" size="45"
					value="<%=(actVO == null) ? "" : actVO.getParticipant()%>" /></li>
				<li><label class="alert alert-primary" role="alert">���ʻ���:</label>
					<input type="text" class="form-control" id="input-Act-Namel4"
					name="actPrice" size="45" placeholder="�ж�J�Ʀr"
					value="<%=(actVO == null) ? "" : actVO.getActPrice()%>" /></li>
				<li class="pic"><label class="alert alert-primary"
					style="margin-left: 200px;">���ʷӤ�:(Pic_Load):</label>
					<div id="pic-area">
						<img id="show" src="#">
					</div> <input onchange="showImg(this)" type="file" class="form-control"
					style="margin-left: 200px;"
					aria-label="Amount (to the nearest dollar)" name="ActPic" size="45"
					value="<%=(actVO == null) ? "" : actVO.getActPic()%>"></li>

				<li><label class="alert alert-primary" role="alert">���ʱԭz:</label>
					<input type="text" class="form-control" id="input-Act-Namel4"
					name="actInfo" size="100" placeholder="���ʤ��e�ԭz"
					value="<%=(actVO == null) ? "" : actVO.getActInfo()%>" /></li>
			</div>

			<div class="message" style="margin-left: 600px; margin-top: 900px;">
				<input type="hidden" name="action" value="insert">
				<button type="submit" class="btn btn-primary">�s�W</button>
				<button type="reset" class="btn btn-primary">���]</button>
				<button type="button" class="btn btn-outline-danger"
					onclick="location.href='<%=request.getContextPath()%>/backend/act/backend-act_select_page.jsp'">
					�^����</button>
			</div>
		</FORM>
	</div>
	
	<script src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
	<script src="<%=request.getContextPath()%>/js/index-back.js"></script>
	<script src="https://kit.fontawesome.com/dc3c868026.js"
		crossorigin="anonymous"></script>
	<script>
		function showImg(thisimg) {
			var file = thisimg.files[0];
			if (window.FileReader) {
				var fr = new FileReader();

				var showimg = document.getElementById('show');
				fr.onloadend = function(e) {
					showimg.src = e.target.result;
				};
				fr.readAsDataURL(file);
				showimg.style.display = 'block';
			}
		}
	</script>
</body>
</html>