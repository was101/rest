package com.rest.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rest.DAO.ReservationDAO;
import com.rest.VO.ReservationVO;

/**
 * Servlet implementation class Calendar
 */
@WebServlet("/Calendar")
public class Calendar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Calendar() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);

		// 세션이 없으면 로그인화면으로, 있으면 캘린더 생성.
		if (session == null || session.getAttribute("nickname") == null) {
			RequestDispatcher rd = request.getRequestDispatcher("Start");
			rd.forward(request, response);
		} else {
			ReservationDAO dao = new ReservationDAO();

			// 방 번호 값이 있으면 해당 번호로, 없으면 default로 1을 넣음.
			int rm_no = 1;
			if (request.getParameter("rm_no") != null)
				rm_no = Integer.parseInt(request.getParameter("rm_no"));

			// DB에서 time을 불러온 뒤에 json형식으로 바꿈.(아직은 String)
			String time = "";
			ReservationVO vo;
			ArrayList<ReservationVO> vlist = dao.booked(rm_no);
			for (int i = 0; i < vlist.size(); i++) {
				vo = vlist.get(i);
				time += vo.toString();
				if (vlist.size() - 1 != i)
					time += ", ";
			}
			request.setCharacterEncoding("UTF-8");
			String html = "";
			for (int i = 1; i <= 3; i++) {
				html += "<div class='row d-flex justify-content-center'><table class='t" + i + "'><tbody><tr>";
				for (int j = 6; j < 12; j++) {
					for (int k = 0; k <= 4; k += 2) {
						if(j < 8) {
							html += "<td class='" + j + ":" + k + "0 default'>" + j + ":" + k + "0</td>";
						}else if(j == 9 && k == 4) {
							html += "<td class='" + j + ":" + k + "0 default'>" + j + ":" + k + "0</td>";
						}else html += "<td class='" + j + ":" + k + "0'>" + j + ":" + k + "0</td>";
					}
				}
				html += "</tr><tr>";
				for (int j = 12; j < 18; j++) {
					for (int k = 0; k <= 4; k += 2) {
						if(j == 14 && k == 4) html += "<td class='" + (j-12) + ":" + k + "0 default'>" + (j-12) + ":" + k + "0</td>";
						else if(j > 12) html += "<td class='" + (j-12) + ":" + k + "0'>" + (j-12) + ":" + k + "0</td>";
						else html += "<td class='" + j + ":" + k + "0'>" + j + ":" + k + "0</td>";
					}
				}
				if(i == 3) {
					html += "</tr></tbody></table><div class='dnotice' style=><marquee>Disabled</marquee></div></div>";
					html += "<div class='notice'>리클라이너가 고장이 나서 당분간 이용이 불가합니다.</div><br>";
				}else {
				html += "</tr></tbody></table><div class='dnotice' style='display:none'><marquee>Disabled</marquee></div></div>";
				html += "<div class='notice' style='display:none'>안마의자가 고장이 나서 당분간 이용이 불가합니다.</div><br>";
				}
			}

			// time을 출력해서 DB에서 잘 가져 왔는지 확인 가능. 그 후 time을 jsp에 뿌려줌.
			System.out.println(time);
			request.setAttribute("time", time);
			System.out.println(html);
			request.setAttribute("html", html);
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
