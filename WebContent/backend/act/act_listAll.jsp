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
			<p class="roomtotal">
				��e�����`��<b><%=list.size()%></b>
			</p>
		</div>
		<div class="table-content" id="content">
			<table class="table table-hover" id="table">
				<thead class="title">
					<tr class="table-primary">
						<th>���ʽs��</th>
						<th>�������O</th>
						<th>���ʦW��</th>
						<th>���ʪ��A</th>
						<th>���ʶ}�l�ɶ�</th>
						<th>�קﬡ��</th>
					</tr>
				</thead>
				<tbody>
					<jsp:useBean id="eventSvc" scope="page"
						class="com.actevent.model.ActEventService" />
					<c:forEach var="actVO" items="${list}">
						<tr>
							<td>${actVO.actNo}</td>
							<td>${eventSvc.getOneActEvent(actVO.actEventNo).actEventName}</td>
							<td>${actVO.actName}</td>
							<td><c:choose>
									<c:when test="${actVO.actStatus == 0}">���}�l</c:when>
									<c:when test="${actVO.actStatus == 1}">�i�椤</c:when>
								</c:choose></td>
							<td>${actVO.actTime}</td>
							<td><input class="update btn btn-primary" type="button"
								value="�ק�"> <input type="hidden" name="rm_no"
								value="${rmvo.rm_no}"> <input type="hidden"
								name="action" value=""></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<form class="update-display update-form" method="post"
			action="${pageContext.request.contextPath}/act.do">
			<div class="close-icon">
				<i class="fas fa-times icon"></i>
			</div>
			<h3>
				���ʽs���G<b id="update-actno"></b>
			</h3>
			<label for="update-actevent">��������</label> <select id="update-actevent" name="update-actevent" required>
				<c:forEach var="event" items="${eventSvc.getAll()}">
					<option value="${event.actEventNo}">${event.actEventName}</option>
				</c:forEach>
			</select> <label for="update-actname">���ʦW��</label> <input type="text"
				name="update-actname" id="update-actname"  maxlength="20"
				min="1" autocomplete="off" required />
				 <label for="update-actstatus">���ʪ��A</label> 
				<select name="update-actstatus" id="update-actstatus"
				class="rm-select" required>
					<option value="0">�w����</option>
					<option value="1">�i�椤</option>
					<option value="2">�w����</option>
			</select><label for="update-acttime">���ʶ}�l�ɶ�</label> <input type="text"
				name="update-acttime" id="update-acttime" class="rm-input" max="9"
				min="1" autocomplete="off" required /> <label for="update-actprice">���ʻ���</label>
			<input type="number" name="update-actprice" id="update-actprice"
				class="rm-input" max="9" min="1" autocomplete="off" required />
				 <label for="update-mbname">���ʤ��e����</label> 
				 <textarea id="update-mbname" name="update-mbname"> </textarea>
				 <label for="update-mbname">���ʹϤ�</label>
			<input type="text" name="update-mbname" id="update-mbname"
				class="rm-input" max="9" min="1" autocomplete="off" required /> <input
				name="action" value="update_room" style="display: none"> <input
				id="update-act" name="update-act-no" type="text"
				style="display: none">
			<button class="update-data" type="submit" style="width: 100%">��s���</button>
		</form>
	</div>
	<script>
		$(".update").click(function() { //�}�ҭק����
			$(".update-display").addClass("display-show")
			let tr = $(this).parents("tr");
			let children = tr.children();
			$("#update-rmno").text(children.eq(0).text());
			$("#update-room").val(children.eq(0).text());
			$("#update-rmtype").text(children.eq(1).text());
			let status;
			console.log(children.eq(2).text())
			switch (children.eq(2).text().trim()) {
			case "�w����":
				status = '0';
				break;
			case "�i�椤":
				status = '1';
				break;
			case "�w����":
				status = '2';
				break;
			}
			$("#update-rmstatus").val(status).change();
		})

		$(".icon").click(function() { //�����ק����
			let display = $(this).parents(".display-show");
			display.removeClass("display-show");
			$("#showroom").attr("src", "");
		})

		let roomTypeFilter = $("#room-type-select");
		let roomStatusFilter = $("#room-status-select");
		let currentTotal = parseInt($(".showmsg p b").text());
		let allTr = $("tr");

		roomTypeFilter.change(filter);
		roomStatusFilter.change(filter);

		$("#room_number").keyup(function() {
			let rmno = $("#room_number").val();
			let count = 0;
			for (let i = 1; i < allTr.length; i++) {
				if (allTr.eq(i).children().eq(0).text().indexOf(rmno) < 0) {
					allTr.eq(i).hide();
					count++;
				} else {
					allTr.eq(i).show();
				}
			}
			$(".showmsg p b").text(currentTotal - count);
		})
	</script>
</body>
</html>