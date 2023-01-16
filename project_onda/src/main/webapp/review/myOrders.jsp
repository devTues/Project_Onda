<%@page import="com.itwillbs.review.db.PaymentDTO"%>
<%@page import="com.itwillbs.review.db.PaymentDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.itwillbs.review.db.ReviewDAO"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myOrder_test.jsp</title>
</head>
<body>
<%

List<PaymentDTO> getpaymentList = (List<PaymentDTO>)request.getAttribute("getpaymentList");
int startPage = (Integer) request.getAttribute("startPage");
int pageBlock = (Integer) request.getAttribute("pageBlock");
int currentPage = (Integer) request.getAttribute("currentPage");
int endPage = (Integer) request.getAttribute("endPage");
int pageCount = (Integer) request.getAttribute("pageCount");
%>

<select size="5" class="form-control" id="table" name="table">
	<optgroup label="일반" >
	<%
	for(int i=0;i<getpaymentList.size();i++){
		PaymentDTO dto=getpaymentList.get(i);
	%>
	<option><%=dto.getMenu_name() %></option>
	<%
	}
	%>
	</optgroup>
</select>

<%-- <input type="text" name="menu_name" value="<%=menu_name %>" readonly> --%>
<%-- <input type="button" value="리뷰쓰기" onclick="location.href='./ReviewWriteForm.rv?menu=<%=menu_name%>'"> --%>
<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
					    	
					    	<%
							// 10페이지 이전 
							if(startPage > pageBlock){
								%>
					     	 <li class="page-item"><a class="page-link" href="./reservationList.re?pageNum=<%=startPage-pageBlock%>">Prev</a></li>
					     	 <%	
							}
					    	%>
					    	
					    	<%
					    	for(int i=startPage;i<=endPage;i++){
								%>
								<li class="page-item"><a class="page-link" href="./reservationList.re?pageNum=<%=i%>"><%=i %></a></li>
								<%
							}
					    	%>
					    	
					      <%
					       if(endPage < pageCount){
							%>
					       <li class="page-item"><a class="page-link" href="./reservationList.re?pageNum=<%=startPage+pageBlock%>">Next</a></li>
					      <%
							}
							%>
					 	</ul>
					</nav>
</body>
</html>