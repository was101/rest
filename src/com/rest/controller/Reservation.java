package com.rest.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

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
		List<String> list = dao.resCheck((String)session.getAttribute("nickname"));
		Date date = new Date();
		list.add("9999");
		for(String s : list) {
			System.out.println("time : " + s);
		}
		// vo媛앹껜濡� �뜲�씠�꽣 ���옣
		// DB 議고쉶
		if(list.size() < 3) {
			ReservationVO vo = new ReservationVO();
			vo.setNickname((String)session.getAttribute("nickname"));
			vo.setTime((String)request.getParameter("time"));
			vo.setRm_no(Integer.parseInt((String)request.getParameter("rm_no").replaceAll("t", "")));
		// DB�뿉 ���옣
			boolean check = true;
			int time = Integer.parseInt(vo.getTime().replace("m", ""));
			System.out.println("resTime : " + time);
			if(time % 100 >= 60) time += 40;
			for(int i = 0; i < list.size(); i++) {
				int p20 = Integer.parseInt(list.get(i).replace("m", "")) + 20;
				int m20 = p20 - 40;
				int same = p20 - 20;
				if(p20 % 100 >= 60) p20 += 40;
				if(m20 % 100 >= 60) m20 -= 60;
				if(same % 100 >= 60) same += 40;
				if(time == p20 || time == m20) {
					System.out.println("time : " + time + " p20 : " + p20 + " m20 : " + m20);
					response.getWriter().write("d");
					check = false;
					break;
				} else if(time == same) {
					response.getWriter().write("s");
					check = false;
					break;
				} else if(time / 100 > 6) {
					if(date.getHours() > time / 100) {
						response.getWriter().write("v");
						check = false;
					}else if(date.getHours() == time / 100 && date.getMinutes() > time % 100) {
						response.getWriter().write("v");
						check = false;
					}
				}else if(time / 100 < 6 && date.getHours() < 6) {
					if(date.getHours() > time / 100) {
						response.getWriter().write("v");
						check = false;
					}else if(date.getHours() == time / 100 && date.getMinutes() > time % 100) {
						response.getWriter().write("v");
						check = false;
					}
				}
			}
			if(check) { 
		dao.reservation(vo);
		response.getWriter().write("o");
			}
		}else response.getWriter().write("x");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
