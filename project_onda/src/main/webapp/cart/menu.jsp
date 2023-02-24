<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart/menu.jsp</title>
</head>
<body>
<h1>메뉴페이지(상품선택)</h1>
<%
request.setCharacterEncoding("utf-8");

String cus_id=(String)session.getAttribute("id");

if(cus_id == null) {
	response.sendRedirect("./CustomerLoginForm.cu");
}
%>

<%= cus_id %>님 접속! <br>
<form action="./CartAddPro.ca" method="post">

메뉴번호: <input type="text" name="menu_num">
		<select name="menu_name">
		 	<option>아메리카노</option>
		 	<option>카페라떼</option>
		 	<option>페퍼민트</option>
		 	<option>딸기라떼</option>
		 	<option>그린티</option>
		</select>
수량: <input type=text name="crt_count">
	<input type="submit" value="장바구니담기"><br>
</form>
<a href="./CartList.ca">장바구니 리스트</a><br>
</body>
</html>