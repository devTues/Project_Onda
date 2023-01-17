<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwillbs.board.db.BoardDTO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Resto - Restaurant Bootstrap 4 Template by GetTemplates.co</title>
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
						<h2>QNA INFO</h2>
					</div>
					
					<div class="row mt-5">
					<%
					//세션값이 null이거나 admin 아니면 알람
					String cus_id=(String)session.getAttribute("cus_id");
					if(cus_id==null || !cus_id.equals("admin")){
						%>
						<script type="text/javascript">
						alert("관리자만 이용가능합니다");
						history.back();
						</script>
					<%	
					} 
					List<BoardDTO> boardList = (List<BoardDTO>)request.getAttribute("boardList");
					//startPage pageBlock currentPage endPage pageCount
					int startPage = (Integer) request.getAttribute("startPage");
					int pageBlock = (Integer) request.getAttribute("pageBlock");
					int currentPage = (Integer) request.getAttribute("currentPage");
					int endPage = (Integer) request.getAttribute("endPage");
					int pageCount = (Integer) request.getAttribute("pageCount");
					%>
						<table class="table table-hover">
						<thead>
						    <tr>
						      <th scope="col">글번호</th>
						      <th scope="col">작성자</th>
						      <th scope="col">글제목</th>
						      <th scope="col">등록일</th>
						      <th scope="col">문의관리</th>
						    </tr>
					  </thead>
							<%
							 // 날짜 => 모양 문자열 변경
							SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
							
							for (int i = 0; i < boardList.size(); i++) {
								BoardDTO dto = boardList.get(i);
							%>
							<tr>
								<td><%=dto.getQna_num()%></td>
								<td><%=dto.getCus_id() %></td>
								<td><%=dto.getQna_title()%></td>
								<td><%=dateFormat.format(dto.getQna_reg()) %></td>
								<td>
								<input type="button" class="btn btn-primary btn-shadow btn-lg" value="문의삭제" 
					         	onclick="location.href='./AdminQnaDelete.bo?qna_num=<%=dto.getQna_num()%>'">
								<%
								if(!dto.getCus_id().equals("admin")) { 
									%>
									<input type="button" class="btn btn-primary btn-shadow btn-lg" value="답글달기" 
					         		onclick="location.href='./ReplyForm.bo?qna_num=<%=dto.getQna_num()%>&qna_ref=<%=dto.getQna_ref()%>&qna_re_lev=<%=dto.getQna_re_lev()%>&qna_re_seq=<%=dto.getQna_re_seq()%>'">
								<%
								} 
								%>
					         	</td></tr>
							<%
							}
							%>
						
						</table>
					</div>
					<!--  페이징 처리 -->
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
					    	
					    	<%
							// 10페이지 이전 
							if(startPage > pageBlock){
								%>
					     	 <li class="page-item"><a class="page-link" href="./AdminResList.re?pageNum=<%=startPage-pageBlock%>">Prev</a></li>
					     	 <%	
							}
					    	%>
					    	
					    	<%
					    	for(int i=startPage;i<=endPage;i++){
								%>
								<li class="page-item"><a class="page-link" href="./AdminResList.re?pageNum=<%=i%>"><%=i %></a></li>
								<%
							}
					    	%>
					    	
					      <%
					       if(endPage < pageCount){
							%>
					       <li class="page-item"><a class="page-link" href="./AdminResList.re?pageNum=<%=startPage+pageBlock%>">Next</a></li>
					      <%
							}
							%>
					 	</ul>
					</nav>
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

	<!-- Main JS -->
	<script src="./js/app.min.js "></script>
</body>
</html>