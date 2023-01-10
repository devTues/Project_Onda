<%@page import="com.itwillbs.res.db.ReservationDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservation/list.jsp</title>
<link href="./css/list.css" rel="stylesheet">
</head>
<body>
	<div id="wrapper">
	<h1>예약내역</h1>
	<%
	List<ReservationDTO> reservationList 
			= (List<ReservationDTO>)request.getAttribute("reservationList");
// 	//startPage pageBlock currentPage endPage pageCount
// 	int startPage = (Integer) request.getAttribute("startPage");
// 	int pageBlock = (Integer) request.getAttribute("pageBlock");
// 	int currentPage = (Integer) request.getAttribute("currentPage");
// 	int endPage = (Integer) request.getAttribute("endPage");
// 	int pageCount = (Integer) request.getAttribute("pageCount");
	%>
	<!-- <a href="./MemberMain.me">메인페이지</a><br> -->
	<a href="./reservationForm.re">예약하기</a>
	<br>
	<table>
		<tr class="tr">
			<td class="td">예약번호</td>
			<td class="td">이름</td>
			<td class="td">테이블</td>
			<td class="td">인원</td>
			<td class="td">전화번호</td>
			<td class="td">매장이용날짜</td>
			<td class="td">예약시간</td>
			<td class="td">신청일자</td>
			<td colspan="2">예약 수정/삭제</td>
		</tr>
		<%
		for (int i = 0; i < reservationList.size(); i++) {
			ReservationDTO dto = reservationList.get(i);
		%>
		<tr>
			<td><%=dto.getRes_num()%></td>
			<td><%=dto.getRes_name()%></td>
			<td><%=dto.getTb_num()%></td>
			<td><%=dto.getRes_mem()%></td>
			<td><%=dto.getRes_phone()%></td>
			<td><%=dto.getRes_use_date()%></td>
			<td><%=dto.getRes_time()%></td>
			<td><%=dto.getRes_date()%></td>
			<td><input type="button" value="예약수정" 
         onclick="location.href='./reservationUpdateForm.re?res_num=<%=dto.getRes_num()%>'"></td>
         <td><input type="button" value="예약삭제" 
         onclick="location.href='./reservationDelete.re?res_num=<%=dto.getRes_num()%>'"></td>
		</tr>
		<%
		}
		%>
	</table>
	</div>
	
</body>
</html>