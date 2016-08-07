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
 * Servlet implementation class CvReferenceServlet
 */
@WebServlet("/CvReferenceServlet")
public class CvReferenceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CvReferenceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		CVInfoBean cv= new CVInfoBean();
		CvDAOImp cvImp = new CvDAOImp();
		
		String userName=(String)request.getRemoteUser();
		cv.setUserName(userName);
		cv.setReferenceType(request.getParameter("ReferenceType"));
		cv.setReferenceName(request.getParameter("ReferenceName"));
		cv.setReferenceSurname(request.getParameter("ReferenceSurname"));
		cv.setReferansFirmPosition(request.getParameter("ReferansFirmPosition"));
		cv.setReferenceEmail(request.getParameter("ReferenceEmail"));	
		String ReferencePhone  =request.getParameter("ReferencePhoneCode")+request.getParameter("ReferencePhone") ;
		cv.setReferencePhone(ReferencePhone);
		cv.setReferenceFirmName(request.getParameter("ReferenceFirmName"));
		cv.setReferenceFirmSector(request.getParameter("ReferenceFirmSector"));
		cvImp.AddCvInfoReference(cv);
		response.sendRedirect("CVAdditionalInfo.jsp");
		
		
		
	}

}
