<%@page import="com.itwillbs.member.db.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/deleteForm.jsp</title>
<link href="./css/menu.css" rel="stylesheet" type="text/css">
<link href="./css/mypageMenu.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="../inc/headerMenu.jsp"></jsp:include>
<jsp:include page="../inc/mypageMenu.jsp"></jsp:include>

<div class="cont_right">
<h2>회원탈퇴</h2>
<%String id = (String)session.getAttribute("id");%>

<form action="./MemberDeletePro.me" method="get">
	아이디 : <input type="text" name="id" value="<%=id %>" readonly><br>
	비밀번호: <input type="password" name="pass"><br>
	<input type="submit" value="탈퇴하기"><br>
	<font color="#0000FF">※ 카카오 간편가입 회원은 아이디, 비밀번호가 동일합니다.</font>
</form>
</div>

</body>
</html>