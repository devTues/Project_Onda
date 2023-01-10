<%@page import="java.util.List"%>
<%@page import="com.itwillbs.res.db.TableDTO"%>
<%@page import="com.itwillbs.res.db.ReservationDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateForm</title>
<link href="./css/menu.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function check() {
	   
	  
	let table = document.fr.table;
	if(table.value == ""){
		alert("테이블 선택해 주세요.");
// 		name.focus();
		return false;
	   }


   let name = document.fr.name;
   if(name.value == ""){
      alert("이름을 입력해 주세요.");
      name.focus();
      return false;
   }
   
   let phone = document.fr.phone;
   if(phone.value == ""){
      alert("전화번호를 입력해 주세요.");
      phone.focus();
      return false;
   }
   
   regex = /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;
   if(!regex.test(phone.value)){
      alert("숫자로만 12또는 13자리를 입력해 주세요.");
      phone.focus();
      return false;
   }
   
   if(document.fr.ch.checked==false) {
      alert("이용약관 및 개인정보 처리방침에 동의하셔야 가입이 가능합니다.");
      return false;
   }
   document.fr.submit();
   
}

window.onload = function() {
	let dateElement = document.getElementById('res_use_date');
	let mindate = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, 10);
	dateElement.value = mindate;
	dateElement.setAttribute("min", mindate);


	let dateElement2 = document.getElementById('res_use_date');
	let maxdate = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000*39).toISOString().slice(0, 10);
// 	dateElement2.value = maxdate;
	dateElement2.setAttribute("max", maxdate);
	
	// 테이블 null인거 싫어서 default 설정
	$("#table option:eq(0)").prop("selected", true); //첫번째 option 선택
};

$(document).ready(function() {
	// 예약시간 예약테이블 조회
	$("#res_use_date").on("change", selectTimeTable);	// 달력
	$("#time").on("change", selectTimeTable);			// 시간
	$("#table").on("change", selectTimeTable);			// 테이블
	
	function selectTimeTable(event){
		var res_use_date = $('#res_use_date').val();
		var time = $('#time').val();
		var table = $('#table').val();
		
		$.ajax({
			url:'./selectTimeTable.re',
			data:{ 'res_use_date' : res_use_date
				 , 'time' : time
				 , 'table' : table},
			success: function(rdata){
				// 예약 가능 여부
				var ResAvail = rdata == 0 ? true : false;
				if(!ResAvail){
					alert("예약불가");
				}
			}
		});
	}
})


</script>
</head>
<body>

<h1>예약</h1>
<%
ReservationDTO dto = (ReservationDTO)request.getAttribute("dto");
	%>
<form action="./reservationUpdatePro.re" method="post" name="fr"  onsubmit="return check()">
<input type="hidden" name="res_num" value="<%=dto.getRes_num()%>">
*예약 날짜 <br>
   <input type="date" name ="res_use_date" ><br>
*예약 시간<br>
<!--    <input type="number" min="10" max="20" name="time" value="10">시<br> -->
      <select size="5" name="time" value="<%=dto.getRes_time()%>" >
     <optgroup label="예약시간">
      <option selected>10:00</option>
      <option>11:00</option>
      <option>12:00</option>
      <option>13:00</option>
      <option>14:00</option>
      <option>15:00</option>
      <option>16:00</option>
      <option>17:00</option>
      <option>18:00</option>
      <option>19:00</option>
      <option>20:00</option>
     </optgroup>
    </select> <br>
   
   <%
List<TableDTO> tableList =  (List<TableDTO>)request.getAttribute("tableList");
%>
   
*예약 인원<br>
   <input type="number" name="person" min="1" max="8" value="<%=dto.getRes_mem()%>">명<br>

*예약 테이블<br>
    <select size="5" id="table" name="table" value="<%=dto.getTb_num()%>">
     <optgroup label="일반" >
      <%
    for(int i=0;i<5;i++){
    	TableDTO dto1=tableList.get(i);
    	%>
      <option><%=dto1.getTb_num() %>번 테이블</option>
<%
    }
%>     </optgroup>
     <optgroup label="키즈" >
      <%
    for(int i=5;i<10;i++){
    	TableDTO dto1=tableList.get(i);
    	%>
      <option><%=dto1.getTb_num() %>번 테이블</option>
<%
    }
%> </optgroup>

<optgroup label="야외" >
      <%
    for(int i=10;i<15;i++){
    	TableDTO dto1=tableList.get(i);
    	%>
      <option><%=dto1.getTb_num() %>번 테이블</option>
<%
    }
%> </optgroup>

<optgroup label="단체" >
      <%
    for(int i=15;i<20;i++){
    	TableDTO dto1=tableList.get(i);
    	%>
      <option><%=dto1.getTb_num() %>번 테이블</option>
<%
    }
%> </optgroup>

    </select> <br>
단체석의 경우 6인이상 가능합니다.<br>
*고객성함<br>
   <input type="text" name="name" value="<%=dto.getRes_name()%>"><br>
*휴대폰 번호<br>
   <input type="text" name="phone" placeholder="ex) 01012345678" value="<%=dto.getRes_phone()%>"><br>
<h2>약관동의</h2>
    <input type="checkbox" name="ch" value="이용약관">이용약관 동의(필수)<br><br>
   <div tabindex="0" class="" style="height: 100px; border:1px solid #dfe0df; margin-top: -5px; border-radius: 4px; padding: 12px 14px; overflow-y: auto; background:#fff; color:#000;">
                  취소 및 환불 약관<br>
   <br>
 올바른 예약문화 정착을 위하여 예약 취소시 환불 기준을 아래와 같이 운영하고 잇으니, 꼭 확인을 하시고 신중하게 예약취속와 변경을 하시기 당부드립니다.<br>
 - 취소 수수료는 예약시점과는 무고나한 이용일 기준입니다. 에약후 바로 환불 요청하셨더라도 취소 환불 규정에 의해 이용일 기준으로 차감되어 환불됩니다.<br>
 - 예약 일자 변경은 기존 예약취소와 동일하므로 전화 변경이 불가하며 홈페이지 예약조회 및 취소 를 통해 기존 예약 취소 후 다시 예약해 주시면 됩니다.<br>
 - 환불정보는 카드결제의 경우 카드사로 확인까지 7~14일정도 소요됩니다.<br>
 - 최종 환불되는 일자는 고객님의 신용카드 결제 일자 및 신용카드사의 환불 규정에 따라 차이가 있을 수 있습니다.<br>
 <pre>
 예약 후 이용일까지 남은 기간   취소수수료<br>
이용 10일 전까지		없음<br>
이용 9일 전		총 결제금액의 10% 차감<br>
이용 8일 전		총 결제금액의 20% 차감<br>
이용 7일 전		총 결제금액의 30% 차감<br>
이용 6일 전		총 결제금액의 40% 차감<br>
이용 5일 전   	총 결제금액의 50% 차감<br>
이용 4일 전   	총 결제금액의 60% 차감<br>
이용 3일 전   	총 결제금액의 70% 차감<br>
이용 2일 전   	총 결제금액의 80% 차감<br>
이용 1일 전   	총 결제금액의 90% 차감<br>
이용 당일  	총 결제금액의 100% 차감<br>
</pre>
</div>

<input type="submit" name="btn" id="btn"  value="예약수정"> <br>
</form>
</body>
</html>