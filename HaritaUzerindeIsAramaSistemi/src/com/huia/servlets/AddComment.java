package com.huia.servlets;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.huia.service.dao.ad.AdDAOImp;
import com.huia.service.dao.map.MapUtilities;

/**
 * Servlet implementation class AddComment
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/AddComment",
		"/addcomment" })
public class AddComment extends HttpServlet {

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
		AdDAOImp addao = new AdDAOImp();
		MapUtilities mu = new MapUtilities();

		java.util.Date date = Calendar.getInstance().getTime();
		java.sql.Date currentdate = new java.sql.Date(date.getTime());
		String commentText = request.getParameter("commentText");
		String location = request.getParameter("location");

		String adid = request.getParameter("adid");
		String username = (String) session.getAttribute("username");
		session.setAttribute("AdId", adid);
		if (commentText != null && commentText != "") {
			addao.addComment(currentdate, commentText, location,
					Integer.parseInt(adid), username);
			response.getWriter().write(mu.prepareComments(Integer.parseInt(adid),
					currentdate, commentText, location, null, username));
		}
		

	}

}
