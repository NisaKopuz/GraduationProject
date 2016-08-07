package com.huia.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.huia.bean.CVInfoBean;
import com.huia.service.dao.user.CvDAOImp;

/**
 * Servlet implementation class CVEducationServlet2
 */
@WebServlet("/CVEducationServlet2")
public class CVEducationServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CVEducationServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		CVInfoBean cv= new CVInfoBean();
		CvDAOImp cvImp = new CvDAOImp();
		
		String userName=(String)request.getRemoteUser();
		cv.setUserName(userName);
	
		    cv.setEducationLevel(request.getParameter("EducationLevel"));
		    cv.setStartDate(request.getParameter("StartDate"));
		    cv.setFinishDate(request.getParameter("FinishDate"));
		    cv.setContinue(request.getParameter("Continue"));
		    cv.setDiplomaGradeSystem(request.getParameter("DiplomaGradeSystem"));
		    cv.setDiplomaGrade(request.getParameter("DiplomaGrade"));
		    cv.setUniversityName(request.getParameter("UniversityName"));
		    cv.setUniversityTown(request.getParameter("UniversityTown"));
		    cv.setFacultyName(request.getParameter("FacultyName"));
		    cv.setDepartmentName(request.getParameter("DepartmentName"));
		    cv.setEducationType(request.getParameter("EducationType"));
		    cv.setEducationLanguage(request.getParameter("EducationLanguage"));
		    cv.setBursaryType(request.getParameter("BursaryType"));
		    cv.setMinor(request.getParameter("Minor"));
		    cv.setMinortxt(request.getParameter("Minortxt"));
		    cv.setDoubleMajor(request.getParameter("DoubleMajor"));
		    cv.setDoubleMajortxt(request.getParameter("DoubleMajortxt"));
		   
		    int setID=cvImp.ID(userName);
		    cv.setIdForEducation(setID);
		    cvImp.AddCvInfoEducation(cv);
		    response.sendRedirect("CVBusinessInfo.jsp");
	}

}
