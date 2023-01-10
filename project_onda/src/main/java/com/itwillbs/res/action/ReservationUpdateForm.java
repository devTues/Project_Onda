package com.itwillbs.res.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.res.db.ReservationDAO;
import com.itwillbs.res.db.ReservationDTO;
import com.itwillbs.res.db.TableDAO;
import com.itwillbs.res.db.TableDTO;

public class ReservationUpdateForm implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int res_num = Integer.parseInt(request.getParameter("res_num"));
		
		ReservationDAO dao = new ReservationDAO();
		ReservationDTO dto = dao.getReservation(res_num); // 기존예약정보
		
		System.out.println("=============================");
		System.out.println(dto);
		System.out.println("=============================");
		
		TableDAO tDao = new TableDAO();
		List<TableDTO> list = tDao.getTable();
		
		System.out.println("입력됫나요?");
		request.setAttribute("dto", dto);
		request.setAttribute("tableList", list);

		ActionForward forward = new ActionForward();
		forward.setPath("./reservation/updateForm.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
