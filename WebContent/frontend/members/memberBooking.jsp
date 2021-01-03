<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.members.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.stream.Collectors"%>
<%@ page import="com.bookingorder.model.*"%>
<%@ page import="com.bookingdetail.model.*"%>
<%@ page import="java.time.format.TextStyle"%>
<%@ page import="java.time.LocalDate"%>

<%
	BookingOrderService bkodSvc = new BookingOrderService();
MembersVO member = (MembersVO) session.getAttribute("member");
List<BookingOrderVO> bkodList = bkodSvc.getAllByMbId(member.getMb_id());
Collections.sort(bkodList, new Comparator<BookingOrderVO>() {
	public int compare(BookingOrderVO o1, BookingOrderVO o2) {
		LocalDate startDate1 = o1.getDateIn();
		LocalDate startDate2 = o2.getDateIn();
		return startDate1.compareTo(startDate2);
	}
});

List<BookingOrderVO> onGoing = new LinkedList<>();
List<BookingOrderVO> history = new LinkedList<>();
onGoing = bkodList.stream().filter(e -> e.getBk_status().equals(BKSTATUS.PAID)).collect(Collectors.toList());
history = bkodList.stream().filter(e -> !e.getBk_status().equals(BKSTATUS.PAID)).collect(Collectors.toList());
pageContext.setAttribute("onGoing", onGoing);
pageContext.setAttribute("history", history);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/frontend/files/commonCSS.file"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/slick-theme.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/slick.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/front/memberInfo.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/front/memberBooking.css" />

<title>Diamond Resort 會員個人資料</title>
</head>
<body>
	<%@ include file="/frontend/files/header.file"%>
	<div class="main-wrapper">
		<div class="select-div">
			<div class="side-nav">
				<ul>
					<li><a
						href="<%=request.getContextPath()%>/frontend/members/memberInfo.jsp"><i
							class="far fa-user"></i> 個人資訊</a></li>
					<li><a
						href="<%=request.getContextPath()%>/frontend/members/memberBooking.jsp"><i
							class="far fa-calendar-check"></i> 假期管理</a></li>
					<li><a href="#"><i class="fas fa-clipboard-list"></i> 訂單管理</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="info-div">
			<div class="info-content">
				<div class="tabset">
					<!-- Tab 1 -->
					<input type="radio" name="tabset" id="tab1"
						aria-controls="onGoingBooking" checked /> <label for="tab1">我的假期</label>
					<!-- Tab 2 -->
					<input type="radio" name="tabset" id="tab2"
						aria-controls="bookingHistory" /> <label for="tab2">假期紀錄</label>
					<jsp:useBean id="bkdetailSvc" scope="page"
						class="com.bookingdetail.model.BookingDetailService" />
					<jsp:useBean id="rmtypeSvc" scope="page"
						class="com.roomtype.model.RoomTypeService" />
					<jsp:useBean id="rmpicSvc" scope="page"
						class="com.roompic.model.RoomPicService" />
					<div class="tab-panels">
						<section id="onGoingBooking" class="tab-panel">
							<c:forEach var="booking" items="${onGoing}">

								<div class="booking-order">
									<div class="date-information">
										<div class="booking-date">
											<span>${booking.dateIn.getDayOfMonth()}</span> <span>${booking.dateIn.getMonth().getDisplayName(TextStyle.SHORT, Locale.ENGLISH)}</span>
											<span>${booking.dateIn.getYear()}</span>
										</div>
										<img class="booking-date-arrow-down" src="<%=request.getContextPath()%>/img/icon/fast-forward.png">
										<div class="booking-date">
											<span>${booking.dateOut.getDayOfMonth()}</span> <span>${booking.dateOut.getMonth().getDisplayName(TextStyle.SHORT, Locale.ENGLISH)}</span>
											<span>${booking.dateOut.getYear()}</span>
										</div>
									</div>
									<div class="rooms">
										<c:forEach var="detail"
											items="${bkdetailSvc.getAllByBkNo(booking.bk_no)}">
											<div class="room">
												<div class="room-pics">
													<img
														src="data:image;base64,${rmpicSvc.getOneRandomPic(detail.rm_type)}">
												</div>
												<div class="booking-details">
													<p>
														<i class="fa fa-calendar"></i> ${booking.dateIn} ~
														${booking.dateOut}
														(${booking.dateOut.compareTo(booking.dateIn)} Night)
													</p>
													<p>
														<i class="fas fa-home"></i>${rmtypeSvc.getOne(detail.rm_type).type_name}</p>
													<p>
														<i class="far fa-user"></i>${detail.rm_guest} Guest
													</p>
												</div>
											</div>
										</c:forEach>
									</div>
									<div class="buttons">
										<button class="check-order-detail">
											<i class="fas fa-clipboard-list"></i></i>訂單詳情
										</button>
										<button class="cancel-order">
											<i class="far fa-bell-slash"></i>取消訂單
										</button>
									</div>
								</div>

							</c:forEach>
						</section>

						<section id="bookingHistory" class="tab-panel">
							<c:forEach var="booking" items="${history}">
								<div class="booking-order">
									<h3>入住日期：${booking.dateIn} 退房日期：${booking.dateOut}</h3>
									<div class="booking-details">
										<c:forEach var="detail"
											items="${bkdetailSvc.getAllByBkNo(booking.bk_no)}">
											<div>
												<p>${rmtypeSvc.getOne(detail.rm_type).type_name}</p>
												<p>${detail.rm_guest}位成人</p>
											</div>
										</c:forEach>
									</div>
									<h4>訂單總額 ${booking.total_price}</h4>
								</div>
							</c:forEach>
						</section>
					</div>
					<%@ include file="/frontend/files/commonJS.file"%>
					<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
					<script src="<%=request.getContextPath()%>/js/slick.min.js"></script>
</body>
</html>
