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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		String remem = "";
		for (int i = 0; check != null && i < check.length; i++) {
			remem = check[i];
		}

		// �꽭�뀡�씠 �뾾�쑝硫� �꽭�뀡�쓣 �깮�꽦, �꽭�뀡�씠 �엳�쑝硫� �빐�떦 �깉�뀡�쓣 遺덈윭�샂
		if (check != null) {
			Cookie nicknameCookie = new Cookie("nickname", nickname);
			Cookie pwCookie = new Cookie("pw", crypt.run_Encrypt(pw));
			Cookie reCookie = new Cookie("checked", remem);
			nicknameCookie.setMaxAge(60*60*24*30);
			pwCookie.setMaxAge(60*60*24*30);
			reCookie.setMaxAge(60*60*24*30);
			response.addCookie(nicknameCookie);
			response.addCookie(pwCookie);
			response.addCookie(reCookie);
			session = request.getSession();
			session.setAttribute("nickname", nickname);
			try {
				session.setAttribute("pw", crypt.run_Encrypt(pw));
			} catch (Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect("/Rest/Calendar");
		} else {
			Cookie nicknameCookie = new Cookie("nickname", nickname);
			Cookie pwCookie = new Cookie("pw", crypt.run_Encrypt(pw));
			Cookie reCookie = new Cookie("checked", remem);
			nicknameCookie.setMaxAge(60*30);
			pwCookie.setMaxAge(60*30);
			reCookie.setMaxAge(60*30);
			response.addCookie(nicknameCookie);
			response.addCookie(pwCookie);
			response.addCookie(reCookie);
			session = request.getSession();
			session.setAttribute("nickname", nickname);
			try {
				session.setAttribute("pw", crypt.run_Encrypt(pw));
			} catch (Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect("/Rest/Calendar");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
