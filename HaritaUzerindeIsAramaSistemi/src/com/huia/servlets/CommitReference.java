package com.huia.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.huia.service.dao.ad.AdDAOImp;

/**
 * Servlet implementation class CommitReference
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/CommitReference",
		"/commitreference" })
public class CommitReference extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		AdDAOImp ad = new AdDAOImp();
		String adId = request.getParameter("adId");
		String messageUser = request.getParameter("messageUser");
		String companyName = request.getParameter("companyName");
		String username = (String) session.getAttribute("username");

		ad.addReference(username, companyName, messageUser,
				Integer.parseInt(adId));

		response.getWriter().write("1");

	}

}
