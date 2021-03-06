package com.huia.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.huia.service.dao.user.UserDAOImp;

/**
 * Servlet implementation class DeleteReferences
 */
@WebServlet("/deleterefr")
public class DeleteReferences extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		UserDAOImp user = new UserDAOImp();

		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");

		int adid = Integer.parseInt(request.getParameter("adId"));

		user.deleteReferences(adid, username);
	}

}
