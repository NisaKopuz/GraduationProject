package com.huia.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.MultipartConfig;
import com.huia.bean.CVInfoBean;
import com.huia.service.dao.user.CvDAOImp;

/**
 * Servlet implementation class CVImageServlet
 */
@WebServlet("/CVImageServlet")
@MultipartConfig(maxFileSize = 16177215)  //max 16 mb can upload
public class CVImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public CVImageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		CVInfoBean cv= new CVInfoBean();
		CvDAOImp cvImp = new CvDAOImp();		
		String userName=(String)request.getRemoteUser();
		cv.setUserName(userName);
		cv.setImagePath(request.getPart("ImagePath"));
		cvImp.insertImage(cv);
		response.sendRedirect("UserProfile");
		
	}

}
