package com.huia.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.huia.service.dao.user.UserDAOImp;

/**
 * Servlet implementation class ChangeMessageStatusForEmployer
 */
@WebServlet("/changeMessageStatusForEmployer")
public class ChangeMessageStatusForEmployer extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		UserDAOImp user = new UserDAOImp();

		int adid = Integer.parseInt(request.getParameter("adId"));

		user.changeMessageStatusForEmployer(request.getParameter("username"),
				adid);

		String html = "<button type=\"button\" class=\"btn btn-default\" id=\"closebutton\" onclick=\"changeStatus("
				+ adid + ")\" >Kapat</button>";
		response.getWriter().write(html);
	}

}
