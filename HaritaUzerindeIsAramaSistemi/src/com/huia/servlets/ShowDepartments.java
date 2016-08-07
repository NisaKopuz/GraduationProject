package com.huia.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.huia.service.dao.ad.AdDAOImp;

/**
 * Servlet implementation class ShowDepartments
 * 
 */

@WebServlet("/ShowDepartments")
public class ShowDepartments extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		AdDAOImp addao = new AdDAOImp();
		String departments = addao.showDepartments(
				Integer.parseInt(request.getParameter("companyId")));

		response.getWriter().write(departments);

	}

}
