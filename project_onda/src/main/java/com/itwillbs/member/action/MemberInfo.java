package com.itwillbs.member.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;

public class MemberInfo implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// String id = "id" 세션값 가져오기
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");

		MemberDAO dao = new MemberDAO();
		
		MemberDTO dto = dao.getMember(id);
		
		// MemberDTO 정보를 request 담아서 오기
		request.setAttribute("dto", dto);

		ActionForward forward=new ActionForward();
		forward.setPath("./member/info.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
	
}
