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
 * Servlet implementation class ChangeAccountInformation
 */
@WebServlet("/ChangeAccountInformationUser")
public class ChangeAccountInformationUser extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");

		UserBean user = new UserBean();
		UserDAOImp userdao = new UserDAOImp();
		Boolean controlpassword;

		// Session ile kullanýcýnýn alýnmasý
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");

		// Parametrelerin alýnmasý

		String name = request.getParameter("name");
		String surname = request.getParameter("surname");
		String email = request.getParameter("email");

		String oldpassword = request
				.getParameter("ctl00$MasterPageBody$txtEskiSifre");
		String newpassword = request.getParameter("txtYeniSifre");
		String confirmpassword = request
				.getParameter("ctl00$MasterPageBody$txtYeniSifreTekrar");
		String cellphone = request.getParameter("phonenumber");
		String clickstatus = request.getParameter("hdnisClicked");

		if (clickstatus.equals("hayir")) {

			user.setUsername(username);
			user.setName(name);
			user.setSurname(surname);
			user.setEmail(email);
			user.setCellphone(cellphone);

			userdao.updateUserRegistrationWithoutPassword(user);
			response.sendRedirect(
					"http://localhost:8080/HaritaUzerindeIsArama/myaccountuser.jsp");

		} else {

			if (oldpassword.isEmpty() || newpassword.isEmpty()
					|| confirmpassword.isEmpty()) {
				session.setAttribute("errorMessage",
						"Boþ alanlarý doldurunuz.");

				response.sendRedirect(
						"http://localhost:8080/HaritaUzerindeIsArama/myaccountuser.jsp");
			} else {
				// Þifre Kontrolü
				controlpassword = userdao.controlPassword(username,
						oldpassword);

				if (controlpassword) {
					user.setUsername(username);
					user.setName(name);
					user.setSurname(surname);
					user.setEmail(email);
					user.setCellphone(cellphone);
					user.setPassword(newpassword);
					userdao.updateUserRegistration(user);
					response.sendRedirect(
							"http://localhost:8080/HaritaUzerindeIsArama/myaccountuser.jsp");

				} else {
					session.setAttribute("errorMessage",
							"Þifrenizi yanlýþ girdiniz.");
					response.sendRedirect(
							"http://localhost:8080/HaritaUzerindeIsArama/myaccountuser.jsp");
				}
			}
		}
	}
}
