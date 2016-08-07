package com.huia.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.huia.bean.CVInfoBean;
import com.huia.service.dao.user.CvDAOImp;

@WebServlet("/CVPersonalInformationUpdateServlet")
public class CVPersonalInformationUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		CVInfoBean cv= new CVInfoBean();
		CvDAOImp cvImp = new CvDAOImp();
		
		String userName=(String)request.getRemoteUser();
		cv.setUserName(userName);

	    cv.setID(request.getParameter("ID"));
	    cv.setMaritalStatusDrpdwnlst(request.getParameter("MaritalStatusDrpdwnlst"));
	    cv.setGenderRadioBttn(request.getParameter("genderRadioBttn"));
	    cv.setBirthDate(request.getParameter("BirthDate"));
	    cv.setBirthPlace(request.getParameter("BirthPlace"));
	    cv.setNationality(request.getParameter("Nationality"));
	    cv.setDrivingLicence(request.getParameter("DrivingLicence"));
	    cv.setDisabledInfo(request.getParameter("DisabledInfo"));
	    cv.setPercentage(request.getParameter("Percentage"));
	    cv.setHealthCertificate(request.getParameter("HealthCertificate"));
	    cv.setHealthCertificatetxt(request.getParameter("HealthCertificatetxt"));
	    cv.setChronicIlness(request.getParameter("ChronicIlness"));
	    cv.setChronicIlnesstxt(request.getParameter("ChronicIlnesstxt"));
	    cv.setUsedMedicine(request.getParameter("UsedMedicine"));
	    cv.setUsedMedicinetxt(request.getParameter("UsedMedicinetxt"));
	    cv.setCommunicableIllness(request.getParameter("CommunicableIllness"));
	    cv.setCommunicableIllnesstxt(request.getParameter("CommunicableIllnesstxt"));
	    cv.setLossOfConsciousness(request.getParameter("LossOfConsciousness"));
	    cv.setLossOfConsciousnesstxt(request.getParameter("LossOfConsciousnesstxt"));
	    cv.setUserName(userName);
	    
		int setIdContact=cvImp.idContact(userName);
		
		cv.setIdContact(setIdContact);
		cvImp.setCvInfoPersonal(cv);
		
		response.sendRedirect("CVEducationalInfoUpdate.jsp");
	}

}
