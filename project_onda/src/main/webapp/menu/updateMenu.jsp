
<%@page import="com.itwillbs.menu.db.MenuDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Resto">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- External CSS -->
    <link rel="stylesheet" href="./vendor/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="./vendor/select2/select2.min.css">
    <link rel="stylesheet" href="./vendor/owlcarousel/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdn.rawgit.com/noelboss/featherlight/1.7.13/release/featherlight.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.1/css/brands.css">

    <!-- Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700|Josefin+Sans:300,400,700">
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

    <!-- CSS -->
    <link rel="stylesheet" href="./css/style.min.css">

    <!-- Modernizr JS for IE8 support of HTML5 elements and media queries -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="./js/reservation.js"></script>
	<title>Update Menu</title>
</head>
<jsp:include page="../inc/headerMenu.jsp"></jsp:include>
<body data-spy="scroll" data-target="#navbar">

<%
MenuDTO dto = (MenuDTO) request.getAttribute("dto");
%>

<div id="canvas-overlay"></div>
<div class="boxed-page">
<section id="gtco-menu" class="section-padding">
    <div class="container">
        <div class="section-content">
            <div class="row mb-5">
                <div class="col-md-12">
                    <div class="heading-section text-center">
						<h2>Update Menu</h2><br>						
                    </div>
                    
					<form action="./MenuUpdatePro.mn" method="post" enctype="multipart/form-data">
						<div class="row mt-5">
							<div class="col-md-12">
								<div class="dishes-textl">	
									<h5>카테고리</h5>
									<input type="hidden" name="menu_num" value="<%=dto.getMenu_num()%>">
										<label><input type="radio" name="menu_category" value="음료">음료</label> 
										<label><input type="radio" name="menu_category" value="푸드">푸드</label>
										<label><input type="radio" name="menu_category" value="굿즈">굿즈</label>
									<h5>상품이름</h5>
									<input type="text" name="menu_name" value="<%=dto.getMenu_name()%>">
									<h5>상품가격</h5>
									<input type="text" name="menu_price" value="<%=dto.getMenu_price()%>">
									<h5>상세설명</h5>
									<textarea name="menu_detail" rows="20"cols="40"value="<%=dto.getMenu_detail()%>"></textarea>
									<h5>첨부파일</h5>
									<input type="file" name="menu_img"> <%=dto.getMenu_img()%>
									<input type="hidden" name="oldfile" value="<%=dto.getMenu_img()%>">
									<input type="submit" value="메뉴수정" class="btn">
								</div>
							</div>
						</div>	
					</form>
				</div>
            </div>	
        </div>
    </div>
</section>
</div>
<jsp:include page="../inc/footerMain.jsp"></jsp:include>
	<!-- External JS -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
	<script src="./vendor/bootstrap/popper.min.js"></script>
	<script src="./vendor/bootstrap/bootstrap.min.js"></script>
	<script src="./vendor/select2/select2.min.js "></script>
	<script src="./vendor/owlcarousel/owl.carousel.min.js"></script>
	<script src="https://cdn.rawgit.com/noelboss/featherlight/1.7.13/release/featherlight.min.js"></script>
	<script src="./vendor/stellar/jquery.stellar.js" type="text/javascript" charset="utf-8"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Main JS -->
	<script src="./js/app.min.js "></script>
</body>
</html>