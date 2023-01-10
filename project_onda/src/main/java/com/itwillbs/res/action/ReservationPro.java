package com.itwillbs.res.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.res.db.ReservationDAO;
import com.itwillbs.res.db.ReservationDTO;

public class ReservationPro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// request �ѱ�ó��
		request.setCharacterEncoding("utf-8");
		// ���� �Է��� ������ -> ���� request ����
		// id pass name ���� �Ķ���Ͱ� �����ͼ� ����
		String id = request.getParameter("id");
		String res_use_date=request.getParameter("res_use_date");
		String time=request.getParameter("time");
		int person=Integer.parseInt(request.getParameter("person"));
		String table=request.getParameter("table");
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		// �������� ��¥�ð� ��������
		Timestamp date=new Timestamp(System.currentTimeMillis());

		// ����۾� => 1~4�ܰ� �ڹ����Ͽ� �޼��� ����
		// package member, �����̸� MemberDAO
		// => insertMember()�޼��� ����

		// MemberDAO �ڹ����� => ��ü����(������ �Ҵ�)
		// int a=10;
		ReservationDAO dao = new ReservationDAO();
		System.out.println("MemberDAO �ּ� : " + dao);
		// �޼��� ȣ��(id,pass,name,date ����)

		// id,pass,name,date�� ������ �ٱ��� ����� => �ڹ�����
		// package member, �����̸� MemberDTO

		// �ٱ��Ͽ� id,pass,name,date ���
		// MemberDTO => ��ü����(������ �Ҵ�)
		ReservationDTO dto = new ReservationDTO();
		System.out.println("ReservationDTO �ּ� : " + dto);
		// id,pass,name,date ���� ���=> ���� private ��������
//				 dto.id=id;
		dto.setCus_id(id);
	    dto.setRes_use_date(res_use_date);
	    dto.setRes_phone(phone);
	    dto.setRes_time(time);
	    dto.setRes_mem(person);
	    dto.setTb_num(table);
	    dto.setRes_date(date);
	    dto.setRes_name(name);

		// dao.insertMember(id, pass, name, date);
		// dao.insertMember(MemberDTO �ٱ��� �ּ�);
		dao.insertReservations(dto);

		// ���� �̵��� �ּ�
		// �̵� ./MemberLoginForm.me
		// ActionForward ��ü����
		// �̵����, �̵���� ��Ƽ� ����
		ActionForward forward = new ActionForward();
		forward.setPath("./reservationList.re");
		forward.setRedirect(true);
		return forward;
	}

}
