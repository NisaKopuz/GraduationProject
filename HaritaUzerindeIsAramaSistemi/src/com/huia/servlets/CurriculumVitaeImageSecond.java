package com.huia.servlets;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.huia.bean.CVInfoBean;
import com.huia.service.dao.user.CvDAOImp;

@WebServlet("/CurriculumVitaeImageSecond")
public class CurriculumVitaeImageSecond extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CurriculumVitaeImageSecond() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		CVInfoBean imageBean= new CVInfoBean();
		CvDAOImp imageDAO= new CvDAOImp();
		String userName=(String)request.getRemoteUser();
		 imageBean.setUserName(userName);
		 //imageDAO.updateImage(imageBean);
		imageDAO.updateImage(imageBean,userName);
		response.sendRedirect("UserProfile.jsp?userName="+userName);
	}

}
