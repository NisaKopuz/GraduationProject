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
 * Servlet implementation class CVBusinessServlet2
 */
@WebServlet("/CVBusinessServlet2")
public class CVBusinessServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CVBusinessServlet2() {
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
		cv.setFirmName(request.getParameter("FirmName"));
		cv.setFirmStartDate(request.getParameter("FirmStartDate"));
		cv.setFirmFinishDate(request.getParameter("FirmFinishDate"));
		cv.setFirmContinue(request.getParameter("FirmContinue"));
		cv.setPositionAtFirm(request.getParameter("PositionAtFirm"));
		cv.setFirmSector(request.getParameter("FirmSector"));
		cv.setBusinessScope(request.getParameter("BusinessScope"));
		cv.setExplanation(request.getParameter("Explanation"));
		cvImp.AddCvInfoBusiness(cv);
		response.sendRedirect("CVForeignLaguageInfo.jsp");
	}

}
