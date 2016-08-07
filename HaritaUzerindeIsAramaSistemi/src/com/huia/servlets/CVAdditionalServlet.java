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
 * Servlet implementation class CVAdditionalServlet
 */
@WebServlet("/CVAdditionalServlet")
public class CVAdditionalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CVAdditionalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		CVInfoBean cv= new CVInfoBean();
		CvDAOImp cvImp = new CvDAOImp();
		
		String userName=(String)request.getRemoteUser();
		cv.setUserName(userName);
		cv.setCertificateName(request.getParameter("CertificateName"));
		cv.setCertificateDate(request.getParameter("CertificateDate"));
		cv.setCertificatePlace(request.getParameter("CertificatePlace"));
		cv.setCertificateExplanation(request.getParameter("CertificateExplanation"));
		cv.setExamName(request.getParameter("ExamName"));
		cv.setExamPlace(request.getParameter("ExamPlace"));
		cv.setExamDate(request.getParameter("ExamDate"));
		cv.setExamExplanation(request.getParameter("ExamExplanation"));
		cv.setSkills(request.getParameter("Skills"));
		cv.setSeminarName(request.getParameter("SeminarName"));
		cv.setSeminarPlace(request.getParameter("SeminarPlace"));
		cv.setSeminarStartDate(request.getParameter("SeminarStartDate"));
		cv.setSeminarFinishDate(request.getParameter("SeminarFinishDate"));
		cv.setBursaryExplanation(request.getParameter("BursaryExplanation"));
		cv.setFondationInformation(request.getParameter("FondationInformation"));
		cv.setBloodInfo(request.getParameter("BloodInfo"));
		cv.setCigaretteInfo(request.getParameter("CigaretteInfo"));
		cv.setSalaryExpectation(request.getParameter("SalaryExpectation"));
		cvImp.AddCvInfoAdditional(cv);
		response.sendRedirect("UserProfile.jsp?userName="+userName);
		
	}

}
