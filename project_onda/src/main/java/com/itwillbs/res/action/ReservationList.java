package com.itwillbs.res.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.res.db.ReservationDAO;
import com.itwillbs.res.db.ReservationDTO;
import com.itwillbs.res.action.ActionForward;

public class ReservationList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
		
		ReservationDAO dao=new ReservationDAO();
	
		List<ReservationDTO> reservationList =dao.getReservationList(id);
	
		request.setAttribute("reservationList", reservationList);
		
		ActionForward forward=new ActionForward();
		forward.setPath("./reservation/list.jsp");
		forward.setRedirect(false);
		return forward;
		}
	}
