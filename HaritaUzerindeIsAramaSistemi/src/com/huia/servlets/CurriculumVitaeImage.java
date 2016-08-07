package com.huia.servlets;



import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.huia.bean.CVInfoBean;
import com.huia.service.dao.user.CvDAOImp;






@WebServlet("/CurriculumVitaeImage")
@MultipartConfig(maxFileSize = 16177215)  //max 16 mb can upload
public class CurriculumVitaeImage extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CurriculumVitaeImage() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		CVInfoBean imageBean= new CVInfoBean();
		CvDAOImp imageDAO= new CvDAOImp();
		
		imageBean.setImagePath(request.getPart("ImagePath"));
		System.out.println(request.getPart("ImagePath"));
		 
		String userName=(String)request.getRemoteUser();
		System.out.println(userName);

			   imageBean.setUserName(userName);
		
		
		imageDAO.insertImage(imageBean);
		response.sendRedirect("UserProfile.jsp?userName="+userName);
		
		
	}

}
