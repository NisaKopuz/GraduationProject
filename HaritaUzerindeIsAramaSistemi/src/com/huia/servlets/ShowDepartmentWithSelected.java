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
 * Servlet implementation class ShowDepartmentWithSelected
 */
@WebServlet(asyncSupported = true, urlPatterns = {
		"/showdepartmentwithselected" })

public class ShowDepartmentWithSelected extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		AdDAOImp addao = new AdDAOImp();

		HttpSession session = request.getSession();
		int companyid = (Integer) (session.getAttribute("companyid"));

		String departments = addao.showDepartmentsWithSelected(companyid,
				Integer.parseInt(request.getParameter("deptid")));

		response.getWriter().write(departments);
	}

}
