package com.rest.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rest.DAO.ReservationDAO;

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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("nickname") == null) {
			response.sendRedirect("/Rest/Start");
		} else {
			ReservationDAO dao = new ReservationDAO();

			int rm_no = 1;
			if (request.getParameter("rm_no") != null)
				rm_no = Integer.parseInt(request.getParameter("rm_no"));

			String time = dao.booked();
			String nickname = (String)session.getAttribute("nickname");
			request.setCharacterEncoding("UTF-8");
			String html = "";
			String status = "";
			String time1 = "";
			List<String> info = dao.getInfo(nickname);
			
			for (int i = 1; i <= 3; i++) {
				html += "<div class='rm0" + i + "'><img class='commaimages" + i + "' src='./images/comma" + i + ".svg'><table class='t" + i + "'><tbody><tr><td class='AM' style='font-weight:bold;'>AM</td>";
				for (int j = 6; j < 12; j++) {
					for (int k = 0; k <= 4; k += 2) {
						if(j < 8) {
							html += "<td class='" + j + "m" + k + "0 default'>" + j + ":" + k + "0</td>";
						}else if(j == 9 && k == 4) {
							html += "<td class='" + j + "m" + k + "0 default'>" + j + ":" + k + "0</td>";
						}else {
							time1 = j + "m" + k + "0";
							html += "<td class='" + j + "m" + k + "0'>" + j + ":" + k + "0</td>";
						}
					}
				}
				html += "</tr><tr><td class='PM' style='font-weight:bold;'>PM</td>";
				for (int j = 12; j < 18; j++) {
					for (int k = 0; k <= 4; k += 2) {
						if(j == 14 && k == 4) html += "<td class='" + (j-12) + "m" + k + "0 default'>" + (j-12) + ":" + k + "0</td>";
						else if(j > 12)
						{
							time1 = (j-12) + "m" + k + "0";
							html += "<td class='" + (j-12) + "m" + k + "0'>" + (j-12) + ":" + k + "0</td>";
						}
						else
						{
							time1 = j + "m" + k + "0";
							html += "<td class='" + j + "m" + k + "0'>" + j + ":" + k + "0</td>";
						}
					}
				}
				if(i < 3) html += "</tr></tbody></table><div class='dnotice" + i + "' style='display:none;'>리클라이너 고장으로 사용할 수 없습니다.</div></div>";
				else html += "</tr></tbody></table><div class='dnotice" + i + "' style='display:none;'>안마의자 고장으로 사용할 수 없습니다.</div></div>";
			}
			
			String str = "";
			for(int i = 0; i < info.size(); i++) {
				str = info.get(i);
				System.out.println(Integer.parseInt(str.substring(str.indexOf(">", str.indexOf("g'>")) + 1, str.indexOf(":", str.indexOf("g'>")))));
				if(Integer.parseInt(str.substring(str.indexOf(">", str.indexOf("g'>")) + 1, str.indexOf(":", str.indexOf("g'>")))) < 6 || Integer.parseInt(str.substring(str.indexOf(">", str.indexOf("g'>")) + 1, str.indexOf(":", str.indexOf("g'>")))) > 11) str = str.replace("g'>", "g'><strong>PM</strong> ");
				else str = str.replace("g'>", "g'><strong>AM</strong> ");
				status += str;
			}

			
			request.setAttribute("time", time);
			request.setAttribute("html", html);
			request.setAttribute("status", status);
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
