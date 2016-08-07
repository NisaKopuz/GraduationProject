package com.huia.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.huia.bean.CompanyBean;
import com.huia.bean.UserBean;
import com.huia.service.dao.user.UserDAOImp;

/**
 * Servlet implementation class AddEmployerUser
 */
@WebServlet("/addemployeruser")
public class AddEmployerUser extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();

		UserBean user = new UserBean();
		CompanyBean company = new CompanyBean();
		UserDAOImp userdao = new UserDAOImp();

		if (userdao.isUserNameExist(request.getParameter("username")))

		{

			session.setAttribute("errorMessage",
					"Aynı isme sahip kullanıcı bulunmaktadır.");

			// request.getRequestDispatcher("signupasemployer.jsp").forward(request,
			// response);

			response.sendRedirect(
					"/HaritaUzerindeIsArama/signupasemployer.jsp");
		} else {

			// Aynı kullanıcı bulunmuyorsa bean'e ekle

			user.setUsername(request.getParameter("username"));
			user.setName(request.getParameter("name"));
			user.setSurname(request.getParameter("surname"));
			user.setEmail(request.getParameter("email"));
			user.setCellphone(request.getParameter("cellphone"));
			user.setPassword(request.getParameter("password"));

			// Firma Bilgileri
			company.setName(request.getParameter("companyname"));
			company.setSector(request.getParameter("sector"));
			company.setDistrict(request.getParameter("district"));
			company.setCity(request.getParameter("city"));
			company.setPhonenumber(request.getParameter("phonenumber"));
			company.setTown(request.getParameter("town"));

			try {
				userdao.AddEmployerUser(user, company);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			
			session.setAttribute("username", request.getParameter("username"));
			session.setAttribute("companyname",
					request.getParameter("companyname"));
			response.sendRedirect("/HaritaUzerindeIsArama/CompanyDetail.jsp");

		}

	}

}
