package com.huia.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.huia.service.db.ConnectionHelper;

/**
 * Servlet implementation class companyUserSearch
 */
@WebServlet("/companyUserSearch")
public class companyUserSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ConnectionHelper conn = new ConnectionHelper(); 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public companyUserSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
		response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();      
        String companyUserName=request.getParameter("companyUserName"); 
        if(companyUserName == null){
        	response.sendRedirect("employerhome.jsp");
        }else{
        	 Connection con = conn.getConnection();
       		 PreparedStatement stmt = null;
       		 ResultSet rs = null;
       		 int count=0;	
       		 String query =  "SELECT * FROM tblcompanyinformation WHERE UserName=?";
       		 stmt = conn.getStatement(con, query);
       		 try {
       		 	stmt.setString(1,companyUserName);
       		 	rs = stmt.executeQuery();
       		 	while (rs.next()) {
       				rs.getString("UserName");
       				count++;	
       			}
       		 	if(count>0 && count <=1)
       		 	response.sendRedirect("FirmProfile.jsp?companyUserName="+companyUserName);
       		 	else
       		 	{
       		 
       		   out.println("<script type=\"text/javascript\">");
      		   out.println("alert('Böyle Bir Kullanýcý Adý Yok...');");
      		   out.println("location='FirmProfile.jsp?companyUserName="+request.getRemoteUser()+"';");
      		   out.println("</script>");
       		 	}
       		 	
       		 } catch (SQLException e){
       			 response.getOutputStream().flush();
       			 response.getOutputStream().close();


       			 	e.printStackTrace();

       			 } finally {

       			 	conn.closeStatement(stmt);
       			 	conn.closeConnection(con);
       			 	conn.closeResultSet(rs);
       			 }      	
        }
	}

}
