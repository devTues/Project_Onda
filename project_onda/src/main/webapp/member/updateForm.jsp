<%@page import="com.itwillbs.member.db.MemberDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/updateForm.jsp</title>
<link href="./css/menu.css" rel="stylesheet" type="text/css">
<link href="./css/mypageMenu.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../inc/headerMenu.jsp"></jsp:include>
<jsp:include page="../inc/mypageMenu.jsp"></jsp:include>

<div class="cont_right">
<h2>정보 수정</h2>
<%MemberDTO dto=(MemberDTO)request.getAttribute("dto");%>

<form action="./MemberUpdatePro.me" method="get">
	아이디 : <input type="text" name="id" value="<%=dto.getCus_id() %>" readonly><br>
	비밀번호: <input type="text" name="pass"><br>
	이름 : <input type="text" name="name" value="<%=dto.getCus_name() %>"><br>
	휴대폰 : <input type="text" name="phone" value="<%=dto.getCus_phone() %>"><br>
	이메일 : <input type="text" name="email" value="<%=dto.getCus_email() %>"><br>
	<input type="submit" value="확인"><br>
	
	<font color="#0000FF">※ 카카오 간편가입 회원은 비밀번호가 이메일과 동일합니다.</font>
</form>
</div>
</body>
</html>