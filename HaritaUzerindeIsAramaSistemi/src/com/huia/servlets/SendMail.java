package com.huia.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.huia.service.dao.user.UserDAOImp;

/**
 * Servlet implementation class SendMail
 */
@WebServlet("/SendMail")
public class SendMail extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		UserDAOImp user = new UserDAOImp();

		String mail = request.getParameter("answer");

		int adid = Integer.parseInt(request.getParameter("hdnadvertid"));

		String username = request.getParameter("hdnusername");

		user.SendMailEmployertoApplicant(mail, username, adid);
		session.setAttribute("errorMessage", "Everthing is okey");
		// request.getRequestDispatcher("/MyReferencesEmployer.jsp")
		// .forward(request, response);
		response.sendRedirect(
				"/HaritaUzerindeIsArama/myreferencesemployer.jsp");

	}

}
