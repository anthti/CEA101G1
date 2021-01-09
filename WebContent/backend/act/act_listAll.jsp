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

<%-- 		<div class="btn1" style="margin-right: 80px;">
			<button type="button" class="btn btn-outline-danger"
				onclick="location.href='<%=request.getContextPath()%>/backend/act/backend-act_select_page.jsp?action=getAll'">
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
		</div> --%>

		<div class="table-content" id="content">
			<table class="table table-hover" id="table">
				<thead class="title">
					<tr class="table-primary">
						<th>���ʽs��</th>
						<th>�������O</th>
						<th>���ʦW��</th>
						<th>���ʪ��A</th>
						<th>���ʴ���</th>
						<th>���ʮɬq</th>
						<th>�d�ݸԱ�</th>
					</tr>
				</thead>
				<tbody>
						<jsp:useBean id="eventSvc" scope="page" class="com.actevent.model.ActEventService"/>
						<c:forEach var="actVO" items="${list}">
							<tr>
								<td>${actVO.actNo}</td>
								<td>${eventSvc.getOneActEvent(actVO.actEventNo).actEventName}</td>
								<td>${actVO.actName}</td>
								<td><c:choose>
										<c:when test="${actVO.actStatus == 0}">�i�椤</c:when>
										<c:when test="${actVO.actStatus == 1}">�w����</c:when>
										<c:otherwise>�w����</c:otherwise>
									</c:choose></td>
								<td>${actVO.actRegTime} <br> ${actVO.deadLine}</td>
								<td>${actVO.actTime}</td>
								<td>
									<input class="update btn btn-primary" type="button"
									value="�ק�"> <input type="hidden" name="rm_no"
									value="${rmvo.rm_no}"> <input type="hidden" name="action"
									value="">
								</td>
							</tr>
						</c:forEach>
				</tbody>
			</table>
		</div>
		<form class="update-display update-form" method="post"
		action="${pageContext.request.contextPath}/Act.do">
			<div class="close-icon">
				<i class="fas fa-times icon"></i>
			</div>
			<h3>
				�ȩнs���G<b id="update-rmno"></b>
			</h3>
			<h3>
				�ȩ������G<b id="update-rmtype"></b>
			</h3>
			<label for="update-rmstatus"><p>�ȩЪ��A</p> <select
				name="update-rmstatus" id="update-rmstatus" class="rm-select"
				required>
					<option value="0">���m��</option>
					<option value="1">�w�J��</option>
					<option value="2">��פ�</option>
					<option value="3">�w�o��</option>
			</select></label> <input name="action" value="update_room" style="display: none">
			<input id="update-room" name="update-rm-no" type="text"
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
			case "���m��":
				status = '0';
				break;
			case "�w�J��":
				status = '1';
				break;
			case "��פ�":
				status = '2';
				break;
			default:
				status = '3';
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

		function filter() {
			let selected_val = roomTypeFilter.val();
			let selected_val2 = roomStatusFilter.val();
			if (selected_val2 === "all" && selected_val === "all") {
				allTr.show();
				$(".showmsg p b").text(currentTotal);
				return;
			}
			allTr.show();
			let count = 0;

			for (let i = 1; i < allTr.length; i++) {
				if (selected_val === "all") {
					if (!allTr.eq(i).children().hasClass(selected_val2)) {
						allTr.eq(i).hide();
						count++;
					}
					continue;
				}
				if (selected_val2 === "all") {
					if (!allTr.eq(i).children().hasClass(selected_val)) {
						allTr.eq(i).hide();
						count++;
					}
					continue;
				}
				if (!allTr.eq(i).children().hasClass(selected_val2)
						|| !allTr.eq(i).children().hasClass(selected_val)) {
					allTr.eq(i).hide();
					count++;
				}
				/* if(!allTr.eq(i).children().hasClass(selected_val2) || !allTr.eq(i).children().hasClass(selected_val)){
					allTr.eq(i).hide();
					count++;
				} */
			}
			$(".showmsg p b").text(currentTotal - count);
		}
	</script>
</body>
</html>