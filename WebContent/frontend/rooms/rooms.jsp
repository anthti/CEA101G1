<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.roomtype.model.*"%>
<%@ page import="java.util.List" %>
<%@ page import="com.roomrsv.model.*"%>
<jsp:useBean id="rmtypeSvc" scope="page" class="com.roomtype.model.RoomTypeService" />
<%
RoomRsvService rsvService = new RoomRsvService();
List<RoomRsvVO> rsvList = rsvService.getAll();
pageContext.setAttribute("rsvList", rsvList);
String stay = request.getParameter("stay");
if (stay == null) stay = "1";
String guest = request.getParameter("guest");
if (guest == null) guest = "2";
List<RoomTypeVO> rmtypeList = rmtypeSvc.getAll();
pageContext.setAttribute("rmtypeList", rmtypeList);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/frontend/files/commonCSS.file" %>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/front/rooms.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/front/available.css" />
</head>
<%@ include file="/frontend/files/loginCSS.file" %>
<style>
.et-hero-tabs {
	background-image: url(<%=request.getContextPath()%>/img/background_beach.jpg);
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}
</style>
<body>
<div style="display:hidden" id="tab-top"></div>
<%@ include file="/frontend/files/login.file" %>
<%@ include file="/frontend/files/loginbox.file" %>
<%@ include file="/frontend/files/header.file" %>
	<!-- Hero -->
	<section class="et-hero-tabs">
		<h1>DAIMOND RESORT</h1>
		<h3>Enjoy the stuning view in our resort</h3>
		<div class="et-hero-tabs-container">
			<a class="et-hero-tab" href="#tab-top">GO TOP</a> 
			<c:forEach var="rmtype" items="${rmtypeList}">
			<a class="et-hero-tab" href="#tab${rmtype.rm_type}">${rmtype.type_eng_name}</a> 
			</c:forEach>
			<span class="et-hero-tab-slider"></span>
		</div>
	</section>
	<jsp:useBean id="rmpicSvc" scope="page" class="com.roompic.model.RoomPicService"/>
	<!-- Main -->
	<main class="et-main">
			<c:forEach var="rmtype" items="${rmtypeList}">
			<section class="et-slide" id="tab${rmtype.rm_type}">
			<div class="room-info">
				<h1>${rmtype.type_name}</h1>
				<h3>${rmtype.type_eng_name}</h3>
				<h6>查看詳情</h6>
				<div class="check-detail-arrow">
					<img class="dropdown"
						src="${pageContext.request.contextPath}/img/icon/drop-down-arrow.svg"
						alt="" />
				</div>
				<div class="room-detail-info">
					<h4>${rmtype.rm_info_title}</h4>
					<br />
					<p>
						${rmtype.rm_info}
					</p>
					<h6>每晚價格</h6>
					<b>\$${rmtype.rm_price}</b>
				</div>
			</div>
			<div class="et-background">
				<ul class="cb-slideshow">
					<c:forEach var="rmtypepics" items="${rmpicSvc.getAllByRoomType(rmtype.rm_type)}" begin="0" end="3">
					<li><span><img src="${pageContext.request.contextPath}/RoomPicServlet?rmpicno=${rmtypepics.rm_pic_no}&action=getOneRmPic" /></span></li>
					</c:forEach>
				</ul>
			</div>
		</section>
			</c:forEach>
		
	</main>
	<div class="booking-now">
		<div id="check-date">
			<a href="#available"><button >查看剩餘空房</button></a>
		</div>
		<div>
			<div id="available"><img class="booking-icon"
				src="<%=request.getContextPath()%>/img/icon/reserve-en-black-pc.svg" /></div>
		</div>
	</div>
	<div class="calendar-available">
		<h2 class="aval-title">空房狀況</h2>
		<div class="close-calendar">
			<img src="<%=request.getContextPath()%>/img/icon/close_icon.svg">
		</div>
        <div class="condition">
            <h3>
                此為
                <select name="guest" id="guest">
                    <option value="2" selected>2位成人</option>
                    <option value="3">3位成人</option>
                    <option value="4">4位成人</option>
                    <option value="5">5位成人</option>
                    <option value="6">6位成人</option>
                </select>
                ，入住
                <select name="stay" id="stay">
                    <option value="1">1晚</option>
                    <option value="2" selected>2晚</option>
                    <option value="3">3晚</option>
                    <option value="4">4晚</option>
                    <option value="5">5晚</option>
                    <option value="6">6晚</option>
                    <option value="7">7晚</option>
                </select>
                每人每晚的價格
                <select name="rmType" id="rmType">
                	<option value="all">全部房型</option>
                   <c:forEach var="rmtypevo" items="${rmtypeSvc.getAll()}">
                   		<option value="${rmtypevo.rm_type}">${rmtypevo.type_name}</option>
                   </c:forEach>
                </select>
            </h3>
            <p>Listed price is rate for first night only and is not indicative of average daily rates.</p>
        </div>
       
        <div class="view">
            <div id="display"></div>
             <div class="calendar-backward arrow">
            <i class="fas fa-chevron-left"></i>
        </div>
        <div class="calendar-forward arrow">
            <i class="fas fa-chevron-right"></i>
        </div>
        </div>
        <div class="logo">
            <img src="<%=request.getContextPath()%>/img/logo.png" alt="" />
        </div>
	</div>
	<%@ include file="/frontend/files/commonJS.file" %>
	<script src="${pageContext.request.contextPath}/js/front/rooms.js"></script>
	<script>
		$("#check-date a button").click(function(){
			$("div.calendar-available").addClass("show-calendar");
		})
		
		$(".close-calendar").click(function(){
			$("div.calendar-available").removeClass("show-calendar");
		})
		$(document).ready(function () {
            let display = document.getElementById("display");
            let weeks = ["ㄧ", "二", "三", "四", "五", "六", "日"];
            let today = new Date();
            let thisYear = today.getFullYear();
            let thisMonth = today.getMonth();
            let todayDate = today.getDate();
            let todayStr = thisYear + "-" + (thisMonth+1) + "-" + todayDate
            console.log(todayStr);
            let current = 0;
            var loaded = [0, 1]
            getCalendars(12); //拿一年份的月曆！
            fetchAvalibility(current);
            fetchAvalibility(current+1);
            
            function createCalendar(year, month) {
                let feb = leapYear(year);
                let monthOfDay = [31, feb, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
                let wrapper = document.createElement("div"); //包住個別日曆
                wrapper.classList.add("calendar-wrapper");
                let title = document.createElement("div"); //產生日曆標頭
                title.classList.add("title");
                title.innerHTML = "<b>" + (month + 1) + "月</b><p>" + "," + year + "年</p>";
                let table = document.createElement("table"); //產生日曆表格
                table.classList.add("calendar");
                let firstTr = document.createElement("tr"); //產生標頭列
                firstTr.classList.add("week-title");

                table.append(firstTr);
                wrapper.append(title);
                wrapper.append(table);
                //建立抬頭
                for (let i = 0; i < 7; i++) {
                    let th = document.createElement("th");
                    th.innerText = weeks[i];
                    firstTr.append(th);
                }
                //找出該月第一天是禮拜幾
                let firstDayOfWeek = new Date(year, month, 1).getDay();
                if (firstDayOfWeek == 0) firstDayOfWeek = 7;
                //確認月曆行數
                let rows = (monthOfDay[month] + firstDayOfWeek - 1) / 7;
                //產生月曆行數
                for (let i = 0; i < rows; i++) {
                    let tr = document.createElement("tr");
                    for (let j = 1; j <= 7; j++) {
                        let td = document.createElement("td");
                        let a = document.createElement("a");
                        let img = document.createElement("img");
                        img.setAttribute("src", "<%=request.getContextPath()%>/css/ajax-loader.gif");
                        img.setAttribute("style", "display:none; width:100%")
                        td.classList.add("calendar-td");
                        a.classList.add("calendar-box");
                        let id =
                            year.toString() + "-"
                            + (month + 1).toString().padStart(2, "0") + "-"
                            + (i * 7 + j - firstDayOfWeek + 1).toString().padStart(2, "0");
                        if (i === 0 && j >= firstDayOfWeek) {
                            a.setAttribute("data-year", year);
                            a.setAttribute("data-month", month + 1);
                            a.setAttribute("data-date", j + i * 7 - firstDayOfWeek + 1);
                            a.setAttribute("id", id);
                        } else if (i * 7 + j - firstDayOfWeek + 1 <= monthOfDay[month]) {
                            a.setAttribute("data-year", year);
                            a.setAttribute("data-month", month + 1);
                            a.setAttribute("data-date", j + i * 7 - firstDayOfWeek + 1);
                            a.setAttribute("id", id);
                        }
                        a.append(img);
                        td.append(a);
                        tr.append(td);
                    }
                    table.append(tr);
                }
                return wrapper;
            }

            function leapYear(year) {
                let feb = (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 ? 29 : 28;
                return feb;
            }
            //填充日期資訊
            function fillUpDates(year, month, thisMonthDate) {
                let feb = leapYear(year);
                let monthOfDay = [31, feb, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
                for (let i = thisMonthDate; i <= monthOfDay[month]; i++) {
                    let celldate = document.createElement("div");
                    let cellprice = document.createElement("div");
                    cellprice.classList.add("calendar-price");
                    celldate.classList.add("calendar-date");
                    let id = year.toString() + "-" + (month + 1).toString().padStart(2, "0") + "-" + i.toString().padStart(2, "0");
                    let hrefstr =
                        "<%=request.getContextPath()%>/booking/Available?action=booking" 
                        + "&date=" + id
                        + "&stay=0";
                    let box = document.getElementById(id);
                    box.setAttribute("href", hrefstr);
                    box.classList.add("calendar-default");
                    celldate.innerText = i;
                    box.append(celldate);
                    box.append(cellprice);
                }
            }
            
            function getCalendars(number) {
                for (i = 0; i < number; i++) {
                    let thisMonthDate = 1;
                    let year = thisYear + Math.floor(thisMonth / 12);
                    let month = thisMonth % 12;
                    let calendar = createCalendar(year, month);
                    display.append(calendar);
                    if (i == 0){
                        thisMonthDate = todayDate;
                    } 
                    fillUpDates(year, month, thisMonthDate);
                    thisMonth++;
                }
                thisMonth = today.getMonth();
                let todaybox = document.getElementById(
                           thisYear.toString() + "-" 
                        + (thisMonth + 1).toString().padStart(2, "0") + "-"
                        + today.getDate().toString().padStart(2, "0")
                );
                todaybox.classList.add("calendar-today");

                let position = 0;
                let forward = $(".calendar-forward");
                let backward = $(".calendar-backward");
                let calendars = $(".calendar-wrapper");
                calendars.eq(0).css("opacity", "1");
                calendars.eq(1).css("opacity", "1");
                backward.fadeOut();
                //導覽
                forward.click(function () {
                    current += 1;
                    let calendarWidth = parseInt($(".calendar-wrapper").css("width").split("px")[0]);
                    calendars.css("opacity", "0");
                    if (0 < number - current) {
                        backward.fadeIn(0);
                        $("#display").css("transform", "translateX(-" + (position += calendarWidth) + "px)");
                    }
                    if (1 === number - current) {
                        forward.fadeOut(0);
                    }
                    calendars.eq(current).css("opacity", "1");
                    calendars.eq(current + 1).css("opacity", "1");
                    if (loaded.indexOf(current+1) < 0){
                    	fetchAvalibility(current + 1);
                        loaded.push(current+1);
                    }
                });
                backward.click(function () {
                    current -= 1;
                    let calendarWidth = parseInt($(".calendar-wrapper").css("width").split("px")[0]);
                    calendars.css("opacity", "0");
                    if (number - current > 0) {
                        forward.fadeIn(0);
                        $("#display").css("transform", "translateX(-" + (position -= calendarWidth) + "px)");
                    }
                    if (number - current === 12) {
                        backward.fadeOut(0);
                    }
                    calendars.eq(current).css("opacity", "1");
                    calendars.eq(current + 1).css("opacity", "1");
                    if (loaded.indexOf(current) < 0){
                    	fetchAvalibility(current);
                        loaded.push(current+1);
                    }
                });
                $(window).resize(function () {
                    let CalendarWidth = parseInt($(".calendar-wrapper").css("width").split("px")[0]);
                    let reposition = CalendarWidth * current;
                    position = reposition;
                    $("#display").css("transform", "translateX(-" + reposition + "px)");
                });
            }
            var rm_price = {
            		<c:forEach var="rmtypevo" items="${rmtypeSvc.getAll()}">
            			${rmtypevo.rm_type}:${rmtypevo.rm_price},
            		</c:forEach>
            }
            function fetchAvalibility(currentCal){
                let allDays = $(".calendar-wrapper").eq(currentCal).find(".calendar-default");
                let stayDays = $("#stay").val();
                let roomType = $("#rmType").val();
                let guests = $("#guest").val();
                for (let i = 0 ; i < allDays.length; i++){
                	let currentDate = allDays.eq(i);
                    $.ajax({
                         url: "<%=request.getContextPath()%>/booking/Available",
                         data:{
                             date: currentDate.attr("id"),
                             stay: stayDays,
                             rmtype: roomType,
                             guest: guests,
                             action:"roomCheck"
                         },
                         type: 'POST',
                         beforeSend: function() {
                        	 currentDate.children("img").show();
                          },
                         success: function(str){
                            var data = JSON.parse(str)
        					if(data.isFull == "true"){
        						currentDate.addClass("calendar-isFull");
        						/* currentDate.attr("href",""); */
        					} else {
        						for (let i = 1; i < 10; i++){
        							if (data[i] != null){
        								currentDate.children(".calendar-price").text("$" + rm_price[i] + "-")
        								break;
        							}
        						}
        						currentDate.addClass("calendar-isEmpty");
        						let length = currentDate.attr("href").length;
        						let href = currentDate.attr("href").split("stay")[0] 
        									+ "stay=" + $("#stay").val() 
        									+ "&guest=" + $("#guest").val();
        						
        						
        						
        						currentDate.attr("href", href);
        					}
                            currentDate.children("img").hide();
                         }
                    })
                } 
            }
            
            $("#stay").val("<%=stay%>");
            $("#guest").val("<%=guest%>");
            $("#stay").change(function(){
            	loaded = [current, current+1];
            	fetchAvalibility(current)
            	fetchAvalibility(current+1)
            	 $(".calendar-price").text("");
            	 $(".calendar-default").removeClass("calendar-isFull calendar-isEmpty");
            })
            
            $("#guest").change(function(){
            	loaded = [current, current+1];
            	fetchAvalibility(current)
            	fetchAvalibility(current+1)
            	 $(".calendar-price").text("");
            	 $(".calendar-default").removeClass("calendar-isFull calendar-isEmpty");
            })
            
            $("#rmType").change(function(){
            	loaded = [current, current+1];
            	fetchAvalibility(current)
            	fetchAvalibility(current+1)
            	 $(".calendar-price").text("");
            	 $(".calendar-default").removeClass("calendar-isFull calendar-isEmpty");
            })
        });
	</script>
</body>
</html>
