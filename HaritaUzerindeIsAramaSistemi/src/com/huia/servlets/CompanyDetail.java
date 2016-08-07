package com.huia.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.huia.bean.CompanyBean;
import com.huia.service.dao.ad.AdDAOImp;

@WebServlet({ "/CompanyDetail", "/companydetail" })
public class CompanyDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();

		CompanyBean cb= new CompanyBean();
		AdDAOImp addao = new AdDAOImp();
		int companyid = addao.getCompanyId(session.getAttribute("companyname").toString());
		String companyname=addao.getCompanyName(companyid);
		cb.setName(companyname);
		cb.setCompanyID(companyid);
		cb.setCompanyHistory(request.getParameter("CompanyHistory"));
		System.out.println(request.getParameter("CompanyHistory"));
		cb.setCompanyWebsite(request.getParameter("Website"));
		System.out.println(request.getParameter("Website"));
		cb.setCompanyCountry(request.getParameter("sel1"));
		System.out.println(request.getParameter("sel1"));
		  String City= request.getParameter("City");
			System.out.println(City);
		    String City2=request.getParameter("sel2");
			System.out.println(City2);
		    cb.setCompanyCity(City2);
		
		    if(City2 == null){
		    	   cb.setCompanyCity(City);
		    		System.out.println(City);
		    }

		cb.setCompanyTown(request.getParameter("Town"));
		System.out.println(request.getParameter("Town"));
		cb.setCompanyDistrict(request.getParameter("District"));
		System.out.println(request.getParameter("District"));
		
		addao.AddCompanyDetails(cb);
		
		response.sendRedirect("/HaritaUzerindeIsArama/adddepartment.jsp");
		
	}

}
