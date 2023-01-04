<%@page import="com.itwillbs.customer.db.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/phoneCheck.jsp</title>
</head>
<body>
<h2>휴대폰 번호 중복 체크</h2>

<%

String phone = request.getParameter("phone");

CustomerDAO dao = new CustomerDAO();
int result = dao.phoneCheck(phone);

if (result == 1){
	out.print("사용가능한 번호입니다");
%>
	 <input type="button" value="사용하기" onclick="result();">
	<%
	
} else if(result == 0){
	out.print("중복된 번호입니다");
} else{
	out.print("에러 발생!!!(-1)"); 
}

%>
<!-- 4.팝업창구현  -->
<fieldset>
	<!-- <form action="" method="post">
	action속성에 값이 없으면 기본적으로 자기자신을 불러오지만 중복확인 버튼을 클릭했을때 변경되지않는다.-->	
	<form action="./CustomerPhoneCheck.cu" method="post" name="wjoin">
		ID : <input type="text" name="phone" value="<%=phone%>">
		<input type="submit" value="중복 확인">	 
	</form>
</fieldset>

<!-- 6. 선택된아이디는 중복확인창에서 회원가입 페이지로 정보전달  -->
 <script type="text/javascript">
    function result(){
    	opener.document.join.phone.value = document.wjoin.phone.value;
    	
    	opener.document.join.phone.readOnly=true;
    	
    	window.close();
    }
 
 </script>


</body>
</html>