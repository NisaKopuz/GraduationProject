package com.huia.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.huia.bean.AdBean;
import com.huia.service.dao.map.MapDAOImp;

/**
 * Servlet implementation class GetAdvertsDetail
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/GetAdvertModal",
		"/getadvertmodal" })
public class GetAdvertModal extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		AdBean advertbean = new AdBean();
		MapDAOImp mp = new MapDAOImp();
		String adId = request.getParameter("adId");

		try {
			advertbean = mp.getAdvertModal(Integer.parseInt(adId));
		} catch (NumberFormatException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		GsonBuilder builder = new GsonBuilder();
		Gson gson = builder.create();
		response.getWriter().write(gson.toJson(advertbean));
	}

}
