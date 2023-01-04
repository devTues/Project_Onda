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
<%

String id = request.getParameter("id");

CustomerDAO dao = new CustomerDAO();
int result = dao.idCheck(id);

if (result == 1){
	out.print("사용가능한 아이디입니다");
%>
	 <input type="button" value="사용하기" onclick="result();">
	<%
	
} else if(result == 0){
	out.print("중복된 아이디입니다");
} else{
	out.print("에러 발생!!!(-1)"); 
}

%>
<!-- 4.팝업창구현  -->
<fieldset>
	<!-- <form action="" method="post">
	action속성에 값이 없으면 기본적으로 자기자신을 불러오지만 중복확인 버튼을 클릭했을때 변경되지않는다.-->	
	<form action="./CustomerIdCheck.cu" method="post" name="wjoin">
		ID : <input type="text" name="id" value="<%=id%>">
		<input type="submit" value="중복 확인">	 
	</form>
</fieldset>

<!-- 6. 선택된아이디는 중복확인창에서 회원가입 페이지로 정보전달  -->
 <script type="text/javascript">
    function result(){
    	opener.document.join.id.value = document.wjoin.userid.value;
    	
    	opener.document.join.id.readOnly=true;
    	
    	window.close();
    }
 
 </script>


</body>
</html>