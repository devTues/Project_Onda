package com.itwillbs.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//처리담당자(서블릿을 상속)
public class MemberFrontController extends HttpServlet {
	//서블릿 파일이 동작할때 => 자동으로 메서드 호출 service()
	//	                 doGet() doPost()
	//웹서버에서 서블릿이 동작할때 자동으로 메서드 호출되면
	//메서드 오버라이딩해서 재정의
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURL=request.getRequestURL().toString();
		String requestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String strpath=requestURI.substring(contextPath.length());
		
		ActionForward forward=null;
		Action action=null;
		
		if(strpath.equals("/MemberAgree.me")) {
			forward = new ActionForward();
			forward.setPath("./member/agree.jsp");
			forward.setRedirect(false);
		
		} else if(strpath.equals("/MemberInsertForm.me")) {
			forward = new ActionForward();
			forward.setPath("./member/insertForm.jsp");
			forward.setRedirect(false);
			
		} else if(strpath.equals("/MemberInsertIdCheck.me")) {
			forward = new ActionForward();
			forward.setPath("./member/insertIdCheck.jsp");
			forward.setRedirect(false);	
			
		} else if(strpath.equals("/MemberInsertPro.me")) {
			action=new MemberInsertPro();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
		
		} else if(strpath.equals("/KakaoInsert.me")) {
			action=new KakaoInsert();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
						
		} else if(strpath.equals("/MemberLoginForm.me")) {
			forward = new ActionForward();
			forward.setPath("./member/loginForm.jsp");
			forward.setRedirect(false);
		
		} else if(strpath.equals("/MemberLoginPro.me")) {
			action=new MemberLoginPro();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
			
//		} else if(strpath.equals("/KakaoLogin.me")) {
//			action=new KakaoLogin();
//			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
//		
		} else if(strpath.equals("/MemberMain.me")) {
			forward = new ActionForward();
			forward.setPath("./member/main.jsp");
			forward.setRedirect(false);
			
		} else if(strpath.equals("/MemberLogout.me")) {
			action=new MemberLogout();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
			
		} else if(strpath.equals("/MemberInfo.me")) {
			action=new MemberInfo();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
			
		} else if(strpath.equals("/MemberUpdateForm.me")) {
			action=new MemberUpdateForm();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
			
		} else if(strpath.equals("/MemberUpdatePro.me")) {
			action=new MemberUpdatePro();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
			
		} else if(strpath.equals("/MemberDeleteForm.me")) {
			// ./member/deleteForm.jsp	
			forward = new ActionForward();
			forward.setPath("./member/deleteForm.jsp");
			forward.setRedirect(false);
		
		} else if(strpath.equals("/MemberDeletePro.me")) {
			action=new MemberDeletePro();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}

		} else if(strpath.equals("/MemberList.me")) {
			action=new MemberList();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
		}
			
		// 이동(경로정보, 이동방식 담아서 오면 이동) ActionForward
		if(forward !=null) {
			if(forward.isRedirect()) {
				// true -> sendRedirect() 방식
				System.out.println("true:" + forward.getPath() + "sendRedirect()방식 이동");
				response.sendRedirect(forward.getPath());
			} else {
				// false -> foward() 방식
				System.out.println("false:" + forward.getPath() + "forward()방식 이동");
				RequestDispatcher dis=request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		} 
		
} //doProcess() 메서드
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberFrontController doGet()");
		// doProcess()호출
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberFrontController doPost()");
		doProcess(request, response);
	}

	
	

}
