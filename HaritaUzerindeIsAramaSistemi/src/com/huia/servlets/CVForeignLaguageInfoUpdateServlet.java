package com.huia.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.huia.bean.CVInfoBean;
import com.huia.service.dao.user.CvDAOImp;

@WebServlet("/CVForeignLaguageInfoUpdateServlet")
public class CVForeignLaguageInfoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		CVInfoBean cv= new CVInfoBean();
		CvDAOImp cvImp = new CvDAOImp();
		
		String userName=(String)request.getRemoteUser();
		cv.setUserName(userName);
		cv.setLanguage(request.getParameter("Language"));
		cv.setReading(request.getParameter("Reading"));
		cv.setWriting(request.getParameter("Writing"));
		cv.setSpeaking(request.getParameter("Speaking"));
		cv.setLearningPlace(request.getParameter("LearningPlace"));
		cv.setNativeLanguageInfoRadio(request.getParameter("NativeLanguageInfoRadio"));
		cvImp.setCvInfoLanguage(cv);
		response.sendRedirect("CVReferenceInfoUpdate.jsp");
	}

}
