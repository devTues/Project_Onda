package com.itwillbs.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;

public class MemberList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session=request.getSession();
		String id = (String)session.getAttribute("id");
		
		if(id==null) {
			// 세션값이 없으면
			response.sendRedirect("MemberLogin.me");
		} else if(! (id.equals("admin"))) {
			// 세션값이 있으면 => admin 아니면 => main.jsp
			response.sendRedirect("MemberMain.me");
			
		}
		
		// 디비작업 기능 => MemberDAO
		// 사용 => MemberDAO 기억장소 할당(객체생성)
		MemberDAO dao = new MemberDAO();
		// dao주소를 통해서 메서드 호출
		// 여러명을 저장하는 List배열변수=dao.getMemberList();
		List<MemberDTO> memberList =dao.getMemberList();
		
		// MemberDTO 정보를 request 담아서 오기
		request.setAttribute("memberList", memberList);

		ActionForward forward=new ActionForward();
		forward.setPath("./member/list.jsp");
		forward.setRedirect(false);
		return forward;
	}

	
}
