package com.huia.servlets;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.huia.bean.CVInfoBean;
import com.huia.service.dao.user.CvDAOImp;
import com.huia.service.db.ConnectionHelper;

/**
 * Servlet implementation class CVEducationalInfoUpdateServlet
 */
@WebServlet("/CVEducationalInfoUpdateServlet")
public class CVEducationalInfoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ConnectionHelper conn = new ConnectionHelper();
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		CVInfoBean cv= new CVInfoBean();
		CvDAOImp cvImp = new CvDAOImp();
		
		String userName=(String)request.getRemoteUser();
		cv.setUserName(userName);
	
		    cv.setEducationLevel(request.getParameter("EducationLevel"));
		    cv.setStartDate(request.getParameter("StartDate"));
		    cv.setFinishDate(request.getParameter("datepicker2"));
		    cv.setDiplomaGradeSystem(request.getParameter("DiplomaGradeSystem"));
		    cv.setDiplomaGrade(request.getParameter("DiplomaGrade"));
		    cv.setUniversityName(request.getParameter("UniversityName"));
		    cv.setUniversityTown(request.getParameter("UniversityTown"));
		    cv.setFacultyName(request.getParameter("FacultyName"));
		    cv.setDepartmentName(request.getParameter("DepartmentName"));
		    cv.setEducationType(request.getParameter("EducationType"));
		    cv.setEducationLanguage(request.getParameter("EducationLanguage"));
		    cv.setBursaryType(request.getParameter("BursaryType"));
		    cv.setMinortxt(request.getParameter("Minortxt"));
		    cv.setDoubleMajortxt(request.getParameter("DoubleMajortxt"));
		   
		    int setID=cvImp.ID(userName);
		    cv.setIdForEducation(setID);
		    cvImp.setCvInfoEducation(cv);
		    response.sendRedirect("CVBusinessInfoUpdate.jsp");
		
	}

}
