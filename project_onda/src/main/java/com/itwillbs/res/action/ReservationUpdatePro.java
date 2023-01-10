package com.itwillbs.res.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.res.action.ActionForward;
import com.itwillbs.res.db.ReservationDAO;
import com.itwillbs.res.db.ReservationDTO;

public class ReservationUpdatePro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// request 한글처리
		request.setCharacterEncoding("utf-8");
		// 폼에 입력한 데이터 -> 서버 request 저장
		// id pass name 변수 파라미터값 가져와서 저장
		int res_num=Integer.parseInt(request.getParameter("res_num"));
		String id = "id";
		String res_use_date=request.getParameter("res_use_date");
		String time=request.getParameter("time");
		int person=Integer.parseInt(request.getParameter("person"));
		String table=request.getParameter("table");
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		// 웹서버의 날짜시간 가져오기
		Timestamp date=new Timestamp(System.currentTimeMillis());

		ReservationDTO dto = new ReservationDTO();
		System.out.println("ReservationDTO 주소 : " + dto);
		
		dto.setRes_num(res_num);
		dto.setCus_id(id);
	    dto.setRes_use_date(res_use_date);
	    dto.setRes_phone(phone);
	    dto.setRes_time(time);
	    dto.setRes_mem(person);
	    dto.setTb_num(table);
	    dto.setRes_name(name);
	    dto.setRes_date(new Timestamp(System.currentTimeMillis()));
		// dao.insertMember(id, pass, name, date);
		// dao.insertMember(MemberDTO 바구니 주소);
	    ReservationDAO dao = new ReservationDAO();
//		dao.insertMember(dto);
		dao.updateReservation(dto);

		System.out.println("11111111111111111111111111111111"+request.getParameter("res_num"));
		ActionForward forward = new ActionForward();
		forward.setPath("./reservationList.re");
		forward.setRedirect(true);
		return forward;
	}

}
