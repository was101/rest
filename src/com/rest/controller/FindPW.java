package com.rest.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//--------------�븫&蹂듯샇�솕
import org.apache.tomcat.util.codec.binary.Base64;
//--------------�븫&蹂듯샇�솕 end

import com.rest.DAO.UserDAO;

/**
 * Servlet implementation class FindPW
 */
@WebServlet("/FindPW")
public class FindPW extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FindPW() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		UserDAO dao = new UserDAO();

		Crypt a = new Crypt();

		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		String pw = dao.findPW(nickname, email);

		try {
			response.getWriter().write(a.run_decrypt(pw));
		} catch (Exception e) {
			e.printStackTrace();
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
