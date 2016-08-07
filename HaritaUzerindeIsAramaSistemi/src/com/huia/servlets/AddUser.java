package com.huia.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.huia.bean.UserBean;
import com.huia.service.dao.user.UserDAOImp;

/**
 * Servlet implementation class AddUser
 */
@WebServlet(name = "adduser", urlPatterns = { "/adduser" })
public class AddUser extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		UserDAOImp user = new UserDAOImp();
		UserBean userbean = new UserBean();

		HttpSession session = request.getSession();

		// Parametrelerin al�nmas�
		String username = request.getParameter("username");
		String name = request.getParameter("name");
		String surname = request.getParameter("surname");
		String cellphone = request.getParameter("cellphone");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		if (user.isUserNameExist(username))

		{

			session.setAttribute("errorMessage",
					"Ayn� isme sahip kullan�c� bulunmaktad�r.");
			response.sendRedirect("/HaritaUzerindeIsArama/signupasuser.jsp");

		} else {

			// Ayn� kullan�c� bulunmuyorsa bean'e ekle

			userbean.setUsername(username);
			userbean.setName(name);
			userbean.setSurname(surname);
			userbean.setCellphone(cellphone);
			userbean.setEmail(email);
			userbean.setPassword(password);

			user.AddUser(userbean);

			response.sendRedirect("/HaritaUzerindeIsArama/userhome.jsp");

		}

	}
}
