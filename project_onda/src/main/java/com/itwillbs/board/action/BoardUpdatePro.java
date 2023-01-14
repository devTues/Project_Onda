package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;

public class BoardUpdatePro implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		int num=Integer.parseInt(request.getParameter("qna_num"));
		String cus_id=request.getParameter("cus_id");
		String qna_title=request.getParameter("qna_title");
		String qna_content=request.getParameter("qna_content");

		BoardDTO dto=new BoardDTO();
		// set메서드호출 num name subject content 저장
		dto.setQna_num(num);
		dto.setCus_id(cus_id);
		dto.setQna_title(qna_title);
		dto.setQna_content(qna_content);

		BoardDAO dao=new BoardDAO();
		
		dao.updateBoard(dto);
		ActionForward forward=new ActionForward();
		forward.setPath("./BoardList.bo");
		forward.setRedirect(true);
		return forward;
	}
}
