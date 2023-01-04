<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login & Registration Bootstrap 4 Form Template</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.tutorialjinni.com/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://cdn.tutorialjinni.com/twitter-bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.tutorialjinni.com/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.tutorialjinni.com/jquery-validate/1.19.1/jquery.validate.js"></script>
    <link href="https://cdn.tutorialjinni.com/font-awesome/5.12.0/css/all.css" rel="stylesheet">
    <link href="./css/login.css" rel="stylesheet" type="text/css">
</head>

    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-5 mx-auto">
                    <div id="first">
                        <div class="myform form ">
                        <!-- 창닫기 -> 메인으로 이동 -->
                        <div class="close">
                            <a href="./MainPage.cu">X</a>
                        </div>
                            <div class="logo mb-3">
                                <div class="col-md-12 text-center">
                                    <h1>Login</h1>
                                </div>
                            </div>
                            <form action="./CustomerLoginPro.cu" method="post" name="login">
                                <div class="form-group">
                                    <input type="text" name="id" class="form-control" id="id" aria-describedby="emailHelp" placeholder="아이디">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="pass" id="pass" class="form-control" aria-describedby="emailHelp" placeholder="비밀번호">
                                </div>
                                
                                <div class="col-md-12 mb-3">
                                    <button type="submit" class="btn btn-block mybtn btn-primary tx-tfm">로그인</button>
                                </div>
                               

                                <div class="col-md-12 mb-3">
                                   <p class="text-center">
                                       <a href="javascript:kakaoLogin();" class="kakao btn mybtn"><i class="fa fa-google-plus">
                                           </i> 카카오 회원 로그인
                                       </a>
                                   </p>
                                </div>  
                                <div class="col-md-12 mb-3">
                                  <p class="text-center">
                                    <a href="#" id="signup">회원가입</a>
                                    |
                                    <a href="./CustomerFindIdPw.cu" target='_blank' id="findidpw">아이디 · 비밀번호 찾기</a>
                                  </p>
                                </div>
                            </form>
                            
                             
                        </div>
                    </div>
                    <div id="second">
                        <div class="myform form ">
                         <!-- 창닫기 -> 메인으로 이동 -->
	                        <div class="close">
	                            <a href="./MainPage.cu">X</a>
	                        </div>
                            <div class="logo mb-3">
                                <div class="col-md-12 text-center">
                                    <h1 >Sign up</h1>
                                </div>
                            </div>
                            <form action="./CustomerJoinPro.cu" method="post" name="registration" onsubmit="return valid()">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">아이디</label>
                                    <i aria-hidden="true" class="icon-required"></i> <!-- 파란아이콘 -->
                                    <input type="text"  name="id" class="form-control" id="firstname" placeholder="아이디">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">비밀번호</label>
                                    <i aria-hidden="true" class="icon-required"></i> <!-- 파란아이콘 -->
                                    <input type="password" name="pass1" class="form-control" id="pass1" placeholder="비밀번호">
                                    <input type="password" name="pass2" class="form-control" id="pass2" placeholder="비밀번호 확인">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">이름</label>
                                    <i aria-hidden="true" class="icon-required"></i> <!-- 파란아이콘 -->
                                    <input type="text"  name="name" class="form-control" id="name" placeholder="이름을 입력하세요">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">휴대폰 번호</label>
                                    <i aria-hidden="true" class="icon-required"></i> <!-- 파란아이콘 -->
                                    <input type="text"  name="phone" class="form-control" id="phone" placeholder="휴대폰 번호">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">이메일</label>
                                    <i aria-hidden="true" class="icon-required"></i> <!-- 파란아이콘 -->
                                    <input type="email" name="email"  class="form-control" id="email" placeholder="이메일">
                                </div>
                                <div class="form-group">
                                    <p class="text-center">이용약관 및 개인정보수집 및 이용 안내 <a href='./CustomerAgree.cu' target='_blank'>자세히 보기</a></p>
                                </div>
                                <div class="form-group">
                                	<input type="checkbox" name="ch1" value="이용약관">이용약관 동의(필수)<br>
                                	<input type="checkbox" name="ch2" value="개인정보수집">개인정보수집 및 이용 동의(필수)
                                </div>	
                                <div class="col-md-12 text-center mb-3">
                                    <button type="submit" class="btn btn-block mybtn btn-primary tx-tfm">가입하기</button>
                                </div>
                                
                                
                                <div class="col-md-12 ">
                                    <div class="form-group">
                                        <p class="text-center"><a href="#" id="signin">기존 회원 로그인</a></p>
                                    </div>
                                </div>
                        	</form>
                        	
                       	    <form action="./KakaoJoin.cu" name="kakaojoin" method="post">
							     <input type="hidden" name="id">
							     <input type="hidden" name="pass">
							     <input type="hidden" name="name">
							     <input type="hidden" name="email">
								<div class="col-md-12 text-center mb-3">    
                                   <a href="javascript:kakaoJoin();" class="kakao btn mybtn"><i class="fa fa-google-plus">
                                     </i> 카카오 간편회원가입
                                   </a>
                               </div>     
							</form>
                        	
                        </div>
                    </div>
                </div>
            </div>
        </div>   
        <script>
            $("#signup").click(function () {
                $("#first").fadeOut("fast", function () {
                    $("#second").fadeIn("fast");
                });
            });
            $("#signin").click(function () {
                $("#second").fadeOut("fast", function () {
                    $("#first").fadeIn("fast");
                });
            });
            
            $(function () {
                $("form[name='login']").validate({
                    rules: {
                        id: {
                            required: true,
                        },
                        pass: {
                            required: true,
                        }
                    },
                    messages: {
                        id: "아이디를 입력하세요",
                        pass: {
                            required: "비밀번호를 입력하세요",
                        }
                    },
                    submitHandler: function (form) {
                        form.submit();
                    }
                });
            });
            $(function () {
                $("form[name='registration']").validate({
                    rules: {
                    	id: {
                    		required: true,
                    		rangelength:[4,30]
                    	},
                    	pass1: {
                            required: true,
                            rangelength:[6,30]
                        },
                        pass2: {
            				equalTo: '#pass1'
            			},
                        name: "required",
                        phone: {
                        	required: true,
                        	digits:true
                        },
                        email: {
                            required: true,
                            email: true
                        },
                        ch1: "required",
                       	ch2: "required"
                    },
                    messages: {
                    	id: {
                            required: "아이디를 입력하세요",
                            rangelength: "아이디는 4-30자 사이 영문,숫자만 허용합니다"
                        },
                        
                        pass1: {
                            required: "비밀번호를 입력하세요",
                            rangelength: "비밀번호는 6-30자 사이 영문,숫자만 허용합니다"
                        },
                        pass2: {
                        	equalTo: "비밀번호를 재확인하세요"
                        },
                        name: "이름을 입력하세요",
                        phone: {
                        	required: "휴대폰 번호를 입력하세요",
                        	digits: "' - ' 제외 숫자만 입력하세요"
                        },
                        email: {
                        	required: "이메일을 입력하세요",
                        	email: "이메일 형식이 아닙니다"
                        },
                       	ch1: "필수",
                        ch2: "필수"
                    },
                    submitHandler: function (form) {
                        form.submit();
                    }
                });
            });
            
         // 카카오 회원가입
            window.Kakao.init('46649a5dcd99d3819c79c2f83892ddb9');
            function kakaoJoin() {
            	Kakao.Auth.login({
            		scope:'account_email',
                    success: function (response) {
                        Kakao.API.request({
                            url: '/v2/user/me',
                            success: (res) => {
//                             	alert(res.id)
//                             	alert(res.properties.nickname)
//                             	alert(res.kakao_account.email)
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
    </body>
</html>
