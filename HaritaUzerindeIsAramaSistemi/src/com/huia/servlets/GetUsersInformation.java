package com.huia.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.huia.service.dao.user.UserDAOImp;

/**
 * Servlet implementation class GetUsersNameAndSurname
 */
@WebServlet("/getUsersinformation")
public class GetUsersInformation extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		UserDAOImp userdao = new UserDAOImp();

		// Session ile kullanýcýnýn alýnmasý

		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");

		// ArrayList oluþturulmasý

		ArrayList<String> userinformation = new ArrayList<String>();

		userinformation = userdao.getUserInformation(username);

		// Json Kullanýmý

		Map<Integer, String> ind = new LinkedHashMap<Integer, String>();
		for (int i = 0; i < userinformation.size(); i++) {

			ind.put(i, userinformation.get(i));

		}

		String json = null;
		json = new Gson().toJson(ind);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);

	}

}
