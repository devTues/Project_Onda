<%@page import="com.itwillbs.customer.db.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/insertIdCheck.jsp</title>
</head>
<body>
<h2>아이디중복체크</h2>
<script type="text/javascript">
<%

String id = request.getParameter("joinid");

CustomerDAO dao = new CustomerDAO();
int result = dao.idCheck(id);

if (result == 1){
	out.print("사용가능한 아이디입니다");
%>
	<%
	
} else if(result == 0){
	out.print("중복된 아이디입니다");
} else{
	out.print("에러 발생!!!(-1)"); 
}

%>
 </script>


</body>
</html>