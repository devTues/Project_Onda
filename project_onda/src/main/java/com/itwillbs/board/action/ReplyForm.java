package com.itwillbs.board.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;

public class ReplyForm implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		BoardDAO dao = new BoardDAO();
        int num = Integer.parseInt(request.getParameter("num"));
        
        BoardDTO dto = dao.getBoard(num);
        request.setAttribute("dto", dto);
        
        ActionForward forward = new ActionForward();
        forward.setPath("./board/replyForm.jsp");
        forward.setRedirect(false); 
        return forward;
	}

}
