package com.itwillbs.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;

public class MemberUpdateForm implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		//MemberDAO 객체 생성
		MemberDAO dao = new MemberDAO();
		
		// 리턴할 형 MemberDTO getMember(String id)
		// 메서드 정의
		// MemberDTO dto=디비작업주소.getMember(id) 메서드 호출
		MemberDTO dto = dao.getMember(id);
		
		// MemberDTO 정보를 request 담아서 오기
		request.setAttribute("dto", dto);
		
		ActionForward forward=new ActionForward();
		forward.setPath("./member/updateForm.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
}
