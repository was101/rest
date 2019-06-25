package com.rest.controller;

import java.io.IOException;
import java.io.PrintWriter;

//--------------�븫&蹂듯샇�솕
import org.apache.tomcat.util.codec.binary.Base64;
//--------------�븫&蹂듯샇�솕 end

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rest.DAO.UserDAO;
import com.rest.VO.UserVO;

/**
 * Servlet implementation class Test
 */
@WebServlet("/Test")
public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public Test() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserDAO dao = new UserDAO();

		Crypt crypt = new Crypt();

		String nickname = request.getParameter("nickname");
		String pw = request.getParameter("pw");

		try {
			if (dao.confirmNick(nickname, crypt.run_Encrypt(pw)))
				response.getWriter().write("true");
			else
				response.getWriter().write("false");
		} catch (Exception e) {
			System.out.println("security error");
//			e.printStackTrace();	//媛쒕컻�옄�슜
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