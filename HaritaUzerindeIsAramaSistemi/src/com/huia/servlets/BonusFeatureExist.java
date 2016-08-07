package com.huia.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.huia.service.dao.user.UserDAOImp;

/**
 * Servlet implementation class BonusFeatureExist
 */
@WebServlet("/BonusFeatureExist")
public class BonusFeatureExist extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BonusFeatureExist() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		UserDAOImp user = new UserDAOImp();

		String username = request.getParameter("username");

		if (user.isBonusFeatureUsed(username)) {
			response.getWriter().write("1");

		} else
			response.getWriter().write("0");

	}

}
