package com.huia.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.huia.service.dao.map.MapDAOImp;

/**
 * Servlet implementation class GetCompanyName
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/GetCompanyName",
		"/getcompanyname" })
public class GetCompanyName extends HttpServlet {

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
		String deptId = request.getParameter("deptId");

		try {
			String companyname = mp.getCompanyName((Integer.parseInt(deptId)));
			response.getWriter().write(companyname);
		} catch (NumberFormatException e) {

			e.printStackTrace();
		}
	}

}
