<%@page import="com.itwillbs.menu.db.MenuDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
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
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">

    <!-- CSS -->
    <link rel="stylesheet" href="./css/style.min.css">

    <!-- Modernizr JS for IE8 support of HTML5 elements and media queries -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.js"></script>
	<title>Menu List</title>
</head>
<jsp:include page="../inc/headerMenu.jsp"></jsp:include>
<body data-spy="scroll" data-target="#navbar">
<div id="canvas-overlay"></div>
<div class="boxed-page">
<section id="gtco-menu" class="section-padding">
    <div class="container">
        <div class="section-content">
            <div class="row mb-5">
                <div class="col-md-12">
                    <div class="heading-section text-center">
						<h2>MENU LIST</h2>
					</div>
					<div class="row mt-5">
					<div class="col-md-10 mb-2 text-left">
						<input type="button" value="메뉴추가" class="btn btn-primary btn-shadow btn-lg" onclick="location.href='./MenuInsertForm.mn'">
                    </div>
					<%
					//세션값이 null이거나 admin 아니면 알람
					String id=(String)session.getAttribute("id");
					if(id==null || !id.equals("admin")){
					%>
						<script type="text/javascript">
						alert("관리자만 이용가능합니다");
						history.back();
						</script>
					<%
					}
					
					List<MenuDTO> menuList=(List<MenuDTO>)request.getAttribute("menuList");
					//startPage pageBlock currentPage endPage pageCount
					int startPage=(Integer)request.getAttribute("startPage");
					int pageBlock=(Integer)request.getAttribute("pageBlock");
					int currentPage=(Integer)request.getAttribute("currentPage");
					int endPage=(Integer)request.getAttribute("endPage");
					int pageCount=(Integer)request.getAttribute("pageCount");
					%>
					<table class="table table-hover">
						<thead>
						<tr>
							<th scope="col">상품번호</th>
							<th scope="col">상품이름</th>
							<th scope="col">상품가격</th>
							<th scope="col">카테고리</th>
							<th scope="col">이미지</th>
							<th scope="col">상품관리</th>
						</tr>
						</thead>
						<%
						for(int i = 0; i<menuList.size(); i++) {
							MenuDTO dto = menuList.get(i);
						%>
						<tr>
							<td><%=dto.getMenu_num()%></td>
						    <td><%=dto.getMenu_name() %></td>
						    <td><%=dto.getMenu_price() %></td>
						    <td><%=dto.getMenu_category() %></td>
						    <td><%=dto.getMenu_img() %></td>
							<td><input type="button" value="수정" class="btn btn-primary btn-shadow btn-lg"
				         		onclick="location.href='./MenuUpdateForm.mn?menu_num=<%=dto.getMenu_num()%>'">
								<input type="button" value="삭제" class="btn btn-primary btn-shadow btn-lg"
				         		onclick="location.href='./MenuDelete.mn?menu_num=<%=dto.getMenu_num()%>'"></td>
						</tr>
						<%
						}
						%>
					</table>
                	</div>
                	<%
					// 10페이지 이전 
					if(startPage > pageBlock){
						%>
					<a href="./AdminMenuList.mn?pageNum=<%=startPage-pageBlock%>">[5페이지 이전] </a>
						<%	
					}
					
					// 이전 currentPage-1
					if(currentPage > 1){
						%>
					<%-- 	<a href="./reservationList.re?pageNum=<%=currentPage-1%>">[1페이지 이전] </a> --%>
						<%
					}
					
					for(int i=startPage;i<=endPage;i++){
						%>
						<a href="./AdminMenuList.mn?pageNum=<%=i%>"><%=i %></a>
						<%
					}
					
					// 다음 currentPage+1
					if(currentPage < pageCount){
						%>
					<%-- 	<a href="./reservationList.re?pageNum=<%=currentPage+1%>">[1페이지 다음]</a> --%>
						<%
					}
					
					//10페이지 다음 
					if(endPage < pageCount){
						%>
						<a href="./AdminMenuList.mn?pageNum=<%=startPage+pageBlock%>">[5페이지 다음]</a>
						<%
					}
					%>
                </div>	
            </div>
        </div>
    </div>
</section>
</div>
<!-- footer -->
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
<!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
	<!-- Main JS -->
	<script src="./js/app.min.js "></script>
</body>
</html>