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
 * Servlet implementation class GetSubmitModal
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/GetSubmitModal",
		"/getsubmitmodal" })
public class GetSubmitModal extends HttpServlet {

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
		String username = (String) session.getAttribute("username");
		String adId = request.getParameter("adId");

		AdDAOImp ad = new AdDAOImp();
		String modal = ad.getSubmitModal(Integer.parseInt(adId), username);

		response.getWriter().write(modal);
	}

}
