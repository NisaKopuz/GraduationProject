package com.huia.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.huia.service.dao.map.MapDAOImp;

/**
 * Servlet implementation class GetDetail
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/GetDetail", "/getdetail" })
public class GetDetail extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		MapDAOImp mp = new MapDAOImp();
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		String adId = request.getParameter("adId");
		try {
			String detail = mp.getAdDetailsWithAdId((Integer.parseInt(adId)),
					username);
			response.getWriter().write(detail);
		} catch (NumberFormatException | SQLException e) {
			e.printStackTrace();
		}
	}
}
