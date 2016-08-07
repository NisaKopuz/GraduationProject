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
 * Servlet implementation class CVContactServlet
 */
@WebServlet("/CVContactServlet")
public class CVContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CVContactServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		CVInfoBean cv= new CVInfoBean();
		CvDAOImp cvImp = new CvDAOImp();
		
		String userName=(String)request.getRemoteUser();
		cv.setUserName(userName);
	    cv.setName(request.getParameter("Name"));
	    
	    cv.setSurname(request.getParameter("Surname"));
	    cv.setTitle(request.getParameter("Title"));
	    cv.setCountry(request.getParameter("sel1"));
	    
	    String City= request.getParameter("City");
	    String City2=request.getParameter("sel2");
	   
	    cv.setCity(City2);
	    if(City2 == null){
	    	   cv.setCity(City);
	    }
	   
	    cv.setTown(request.getParameter("Town"));
	    cv.setDistrict(request.getParameter("District"));
	    String HomePhoneCodes=request.getParameter("HomePhoneCodes");
	    String HomePhoneNumber=request.getParameter("HomePhoneNumber");
	    
	    cv.setHomePhoneNumber(HomePhoneCodes+HomePhoneNumber);
	    
	    String CellPhoneCodes=request.getParameter("CellPhoneCodes");
	    String CellPhoneNumber=request.getParameter("CellPhoneNumber");
	    
	    cv.setCellPhoneNumber(CellPhoneCodes+CellPhoneNumber);
	    cv.setEposta(request.getParameter("Eposta"));
	    cv.setWebPage(request.getParameter("WebPage"));
	    cv.setWebPage2(request.getParameter("WebPage2"));
		
		cvImp.AddCvInfo(cv);
		response.sendRedirect("CVPersonalInformation.jsp");
	}

}
