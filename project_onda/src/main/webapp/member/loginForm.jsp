<%@page import="java.math.BigInteger"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.security.SecureRandom"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/loginForm.jsp</title>
<link href="./css/menu.css" rel="stylesheet" type="text/css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
Kakao.init('46649a5dcd99d3819c79c2f83892ddb9');

function kakaoLogin() {
	Kakao.Auth.login({
		scope:'account_email',
        success: function (response) {
            Kakao.API.request({
                url: '/v2/user/me',
                success: (res) => {
                    kakaologin.id.value=res.id;
                    kakaologin.pass.value=res.id;
					kakaologin.submit()
                },
				
                fail: function (error) {
                    console.log(error);
                },
            })
        },
        fail: function (error) {
            console.log(error);
        },
    })
}
</script>
</head>
<body>

<jsp:include page="../inc/headerMenu.jsp"></jsp:include>
<h1>로그인</h1>
<form action="./MemberLoginPro.me" method="post">
	아이디 : <input type="text" name="id"><br>
	비밀번호: <input type="text" name="pass"><br>
	<input type="submit" value="로그인">
</form><br>

<form name="kakaologin" action="./MemberLoginPro.me" method="post">
     <input type="hidden" name="id">
     <input type="hidden" name="pass">
     <a href="javascript:kakaoLogin();"><img src="https://developers.kakao.com/tool/resource/static/img/button/login/full/ko/kakao_login_medium_narrow.png"></a>
     
</form>

</body>
</html>