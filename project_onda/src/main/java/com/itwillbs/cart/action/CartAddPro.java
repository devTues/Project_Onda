package com.itwillbs.cart.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.cart.db.CartDAO;
import com.itwillbs.cart.db.CartDTO;

public class CartAddPro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String cus_id = (String)session.getAttribute("cus_id");
		
		int menu_num = Integer.parseInt(request.getParameter("menu_num"));
		
		// TODO 수량값이 0일 경우 NumberFormatException 오류!
		int crt_count=Integer.parseInt(request.getParameter("crt_count"));
		
		// 바구니에 상품정보 담기
		// CartDTO => 객체생성(기억장소 할당)
		CartDTO dto=new CartDTO();
		
		dto.setCus_id(cus_id);
		dto.setMenu_num(menu_num);
		dto.setCrt_price(0);
		dto.setCrt_count(crt_count);
		
		CartDAO dao=new CartDAO();
		// dao.insertCart(cus_id, menu_num, crt_count);
		// dao.insertCart(CartDTO 바구니 주소);
		dao.insertCart(dto);
		
		request.setAttribute("dto", dto);
		ActionForward forward=new ActionForward();
		forward.setPath("./CartList.ca");
		forward.setRedirect(true);
		return forward;
	}


}
