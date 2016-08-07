package com.huia.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.huia.bean.UserBean;
import com.huia.service.dao.user.UserDAOImp;

/**
 * Servlet implementation class userSettingsServlet
 */
@WebServlet("/userSettingsServlet")
public class userSettingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		UserDAOImp user = new UserDAOImp();
		UserBean userbean = new UserBean();
		String username = (String)request.getRemoteUser();
		String newPassword = request.getParameter("txtYeniSifre");
		if("".equals(newPassword)){
			userbean.setUsername(username);
			userbean.setName(request.getParameter("name"));
			userbean.setSurname(request.getParameter("surname"));
			userbean.setCellphone(request.getParameter("phonenumber"));
			userbean.setEmail(request.getParameter("email"));
			user.updateUserRegistrationWithoutPassword(userbean);
			response.sendRedirect("userhome.jsp");
		}else{
			userbean.setUsername(username);
			userbean.setName(request.getParameter("name"));
			userbean.setSurname(request.getParameter("surname"));
			userbean.setCellphone(request.getParameter("phonenumber"));
			userbean.setEmail(request.getParameter("email"));
			userbean.setPassword(request.getParameter("txtYeniSifre"));
			user.updateUserRegistration(userbean);
			response.sendRedirect("userhome.jsp");
		}
		
	}

}
