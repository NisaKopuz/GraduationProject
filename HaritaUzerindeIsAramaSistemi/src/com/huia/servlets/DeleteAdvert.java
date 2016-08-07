package com.huia.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.huia.service.dao.ad.AdDAOImp;

/**
 * Servlet implementation class DeleteAdvert
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/DeleteAdvert",
		"/deleteadvert" })
public class DeleteAdvert extends HttpServlet {

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
		AdDAOImp addao = new AdDAOImp();
		String adid = request.getParameter("adId");
		boolean stat = false;

		stat = addao.deleteAdvert(adid);

		if (stat == true) {
			response.getWriter().write("true");
		} else
			response.getWriter().write("false");

	}

}
