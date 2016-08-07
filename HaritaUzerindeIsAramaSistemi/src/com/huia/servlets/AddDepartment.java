package com.huia.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.huia.bean.DepartmentBean;
import com.huia.service.dao.map.MapDAOImp;

/**
 * Servlet implementation class AddDepartment
 */
@WebServlet("/adddepartment")
public class AddDepartment extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		DepartmentBean departmentbean = new DepartmentBean();
		MapDAOImp mapdao = new MapDAOImp();

		// Session ile attribute alınması
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");

		// O username'in companyid'sinin alınması.
		int companyid = mapdao.getCompanyId(username);
		
		String city = request.getParameter("city");
		String town = request.getParameter("town");

		departmentbean.setCoords(request.getParameter("coords"));
		departmentbean.setCompanyid(companyid);
		departmentbean.setDepartmentname(request.getParameter("departmentname"));

		mapdao.addDepartment(departmentbean, city, town);
		
		response.sendRedirect("/HaritaUzerindeIsArama/employerhome.jsp");

	}

}
