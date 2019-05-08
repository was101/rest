package com.rest.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rest.DAO.ReservationDAO;
import com.rest.VO.ReservationVO;

/**
 * Servlet implementation class Reservation
 */
@WebServlet("/Reservation")
public class Reservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Reservation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		ReservationDAO dao = new ReservationDAO();
		ReservationVO vo = new ReservationVO();
		
		// vo객체로 데이터 저장
		System.out.println("nickname : " + session.getAttribute("nickname"));
		System.out.println("pw : " + session.getAttribute("pw"));
		System.out.println("time : " + request.getParameter("time"));
		System.out.println("rm_no : " + request.getParameter("rm_no"));
		vo.setNickname((String)session.getAttribute("nickname"));
		vo.setTime((String)request.getParameter("time"));
		vo.setRm_no(Integer.parseInt((String)request.getParameter("rm_no")));
		vo.setPw((String)session.getAttribute("pw"));
		System.out.println(vo);
		// DB에 저장
		dao.reservation(vo);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
