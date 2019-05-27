package com.rest.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rest.DAO.UserDAO;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public login() {
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
		UserDAO dao = new UserDAO();
		Crypt crypt = new Crypt();
		String nickname = request.getParameter("nickname");
		String pw = request.getParameter("pw");
		String[] check = request.getParameterValues("remember");
		HttpSession session = request.getSession(false);
		Cookie[] cookies = request.getCookies();
		for (int i = 0; check != null && i < check.length; i++) {
			String remem = check[i];
		}

		// 세션이 없으면 세션을 생성, 세션이 있으면 해당 새션을 불러옴
		if (check != null) {
			System.out.println("체크 됨");
			Cookie nicknameCookie = new Cookie("nickname", nickname);
			Cookie pwCookie = new Cookie("pw", crypt.run_Encrypt(pw));
			response.addCookie(nicknameCookie);
			response.addCookie(pwCookie);
			session = request.getSession();
			session.setAttribute("nickname", nickname);
			try {
				session.setAttribute("pw", crypt.run_Encrypt(pw));
			} catch (Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect("/Calendar");
		} else {
			System.out.println("체크 안됨");
			for (int i = 0; i < cookies.length; i++) {
				cookies[i].setValue(null);
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
			if (session == null || session.getAttribute("nickname") == null) {
				System.out.println("세션없음");
				session = request.getSession();
				session.setAttribute("nickname", nickname);
				System.out.println(session.getAttribute("nickname"));
				try {
					session.setAttribute("pw", crypt.run_Encrypt(pw));
					System.out.println(pw);
				} catch (Exception e) {
					e.printStackTrace();
				}
				response.sendRedirect("/Calendar");
			} else {
				System.out.println("세션있음");
				session = request.getSession();
				response.sendRedirect("/Calendar");
			}
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
