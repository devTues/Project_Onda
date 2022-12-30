<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/insertForm.jsp</title>
<link href="./css/menu.css" rel="stylesheet" type="text/css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
function winopen(){
	if(document.join.id.value =="" || document.join.id.value.length < 0){
		alert("아이디를 먼저 입력해주세요")
		document.join.id.focus();
	}else{
		window.open("./MemberInsertIdCheck.me?userid="+document.join.id.value,"","width=500, height=300");
	}
}

window.Kakao.init('46649a5dcd99d3819c79c2f83892ddb9');
function kakaoInsert() {
	Kakao.Auth.login({
		scope:'account_email',
        success: function (response) {
            Kakao.API.request({
                url: '/v2/user/me',
                success: (res) => {
//                 	alert(res.id)
//                 	alert(res.properties.nickname)
//                 	alert(res.kakao_account.email)
					alert('회원가입 성공! 메인페이지에서 로그인해주세요')
                    kakaojoin.id.value=res.id;
                	kakaojoin.pass.value=res.kakao_account.email;
                	kakaojoin.name.value=res.properties.nickname;
                	kakaojoin.email.value=res.kakao_account.email;
					kakaojoin.submit()
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
<h1>회원가입</h1>
<fieldset>
<legend>카카오 회원가입</legend>
<form name="kakaojoin" action="./KakaoInsert.me" method="post">
     <input type="hidden" name="id">
     <input type="hidden" name="pass">
     <input type="hidden" name="name">
     <input type="hidden" name="email">
</form>
카카오 간편 회원가입
<a href="javascript:kakaoInsert();"><img src="./img/kakao_join.png"></a>
</fieldset>
<fieldset>
<legend>인적사항 입력</legend>
<form action="./MemberInsertPro.me" method="post" name="join" onsubmit="return check()">
	* 아이디 :  <input type="text" name="id" placeholder="영문+숫자 20자 이하">
			  <input type="button" value="중복확인" class="dup" onclick="winopen()"><br>
	* 비밀번호 : <input type="password" name="pass" placeholder="영영문+숫자 20자 이하"><br> 
	* 비밀번호 확인 : <input type="password" name="pass2" placeholder="비밀번호 재확인"><br> 
	* 이름 : <input type="text" name="name" placeholder="이름을(를) 입력하세요"> <br>
	* 이메일 : <input type="email" name="email"><br>
	* 휴대폰 번호 : <input type="text" name="phone" placeholder="ex) 01012345678"><br>

</form>
</fieldset>
<input type="reset" value="Cancel"><input type="submit" value="Submit"><br>



</body>
</html> 