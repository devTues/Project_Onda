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
        <link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
        <link href="https://cdn.tutorialjinni.com/font-awesome/5.12.0/css/all.css" rel="stylesheet">
        <link href="../css/login.css" rel="stylesheet" type="text/css">
        <link href="../css/menu.css" rel="stylesheet" type="text/css">
        
<!-- 		<script src="../js/login.js"></script> -->
    </head>
    <jsp:include page="../inc/headerMenu.jsp"></jsp:include>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-5 mx-auto">
                    <div id="first">
                        <div class="myform form ">
                            <div class="logo mb-3">
                                <div class="col-md-12 text-center">
                                    <h1>Login</h1>
                                </div>
                            </div>
                            <form action="" method="post" name="login">
                                <div class="form-group">
                                    <input type="text" name="id"  class="form-control" id="id" aria-describedby="emailHelp" placeholder="아이디">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password" id="password"  class="form-control" aria-describedby="emailHelp" placeholder="비밀번호">
                                </div>
                                
                                <div class="col-md-12 mb-3">
                                    <button type="submit" class="btn btn-block mybtn btn-primary tx-tfm">로그인</button>
                                </div>
                               

                                <div class="col-md-12 mb-3">
                                   <p class="text-center">
                                       <a href="javascript:kakaoLogin();" class="google btn mybtn"><i class="fa fa-google-plus">
                                           </i> 카카오 회원 로그인
                                       </a>
                                   </p>
                                </div>  
                                <div class="col-md-12 mb-3">
                                  <p class="text-center">
                                    <a href="#" id="signup">회원가입</a>
                                    |
                                    <a href="#" id="findidpw">아이디 · 비밀번호 찾기</a>
                                  </p>
                                </div>
<!--                                 <div class="col-md-12"> -->
<!--                                     <div class="login-or"> -->
<!--                                         <span class="span-or">or</span> -->
<!--                                     </div> -->
<!--                                 </div> -->
                            </form>
                            
                             
                        </div>
                    </div>
                    <div id="second">
                        <div class="myform form ">
                            <div class="logo mb-3">
                                <div class="col-md-12 text-center">
                                    <h1 >Signup</h1>
                                </div>
                            </div>
                            <form action="#" method="post" name="registration">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">아이디</label>
                                    <i aria-hidden="true" class="icon-required"></i> <!-- 파란아이콘 -->
                                    <input type="text"  name="id" class="form-control" id="firstname" aria-describedby="emailHelp" placeholder="아이디">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">비밀번호</label>
                                    <i aria-hidden="true" class="icon-required"></i> <!-- 파란아이콘 -->
                                    <input type="password" name="password" id="password"  class="form-control" aria-describedby="emailHelp" placeholder="비밀번호">
                                    <input type="password" name="password2" id="password2"  class="form-control" aria-describedby="emailHelp" placeholder="비밀번호 확인">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">이름</label>
                                    <i aria-hidden="true" class="icon-required"></i> <!-- 파란아이콘 -->
                                    <input type="text"  name="name" class="form-control" id="name" aria-describedby="emailHelp" placeholder="이름을 입력하세요">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">휴대폰 번호</label>
                                    <i aria-hidden="true" class="icon-required"></i> <!-- 파란아이콘 -->
                                    <input type="text"  name="phone" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="휴대폰 번호">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">이메일</label>
                                    <i aria-hidden="true" class="icon-required"></i> <!-- 파란아이콘 -->
                                    <input type="email" name="email"  class="form-control" id="email" aria-describedby="emailHelp" placeholder="이메일">
                                </div>
                                <div class="form-group">
                                    <p class="text-center">이용약관 및 개인정보수집 및 이용 안내 <a href="#">자세히 보기</a></p>
                                </div>
                                <div class="form-group">
                                	<input type="checkbox" name="ch1" value="이용약관">이용약관 동의(필수)<br>
                                	<input type="checkbox" name="ch2" value="개인정보수집">개인정보수집 및 이용 동의(필수)
                                </div>	
                                <div class="col-md-12 text-center mb-3">
                                    <button type="submit" class="btn btn-block mybtn btn-primary tx-tfm">가입하기</button>
                                </div>
                                <div class="col-md-12 text-center mb-3">    
                                    <a href="javascript:kakaoJoin();" class="google btn mybtn"><i class="fa fa-google-plus">
                                      </i> 카카오 간편가입
                                    </a>
                                </div>
                                
                                <div class="col-md-12 ">
                                    <div class="form-group">
                                        <p class="text-center"><a href="#" id="signin">기존 회원 로그인</a></p>
                                    </div>
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
                        password: {
                            required: true,
                        }
                    },
                    messages: {
                        id: "아이디를 입력하세요",
                        password: {
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
                    		minlength: 4
                    	},
                    	password: {
                            required: true,
                            minlength: 6
                        },
                        
                        name: "required",
                        phone: "required",
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
                            minlength: "아이디는 4자 이상 영문,숫자만 허용합니다"
                        },
                        
                        password: {
                            required: "비밀번호를 입력하세요",
                            minlength: "비밀번호는 6자 이상 영문,숫자만 허용합니다"
                        },
                        name: "이름을 입력하세요",
                        phone: "휴대폰 번호를 입력하세요",
                        email: "이메일을 입력하세요",
                       	ch1: "이용약관 및 개인정보 처리방침에 동의하셔야 가입이 가능합니다",
                        ch2: "이용약관 및 개인정보 처리방침에 동의하셔야 가입이 가능합니다"
                    },
                    submitHandler: function (form) {
                        form.submit();
                    }
                });
            });
        </script>
    </body>
</html>
