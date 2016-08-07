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


	@WebServlet("/MailServlet")
	public class MailServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
		static ConnectionHelper conn = new ConnectionHelper();
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html");  
			response.setCharacterEncoding("utf-8");
			
			String UserName=request.getRemoteUser();
			Connection con = conn.getConnection();
			PreparedStatement stmt = null;
			PreparedStatement stmt2 = null;
			PreparedStatement stmt3 = null;
	
			String inputTo= request.getParameter("inputTo");
   		 	String inputSubject = request.getParameter("inputSubject");
   		 	String inputBody = request.getParameter("inputBody");
   		
   		    String mysqlUserName="";
	   		String Name="";
	   		String Surname="";
	   		ResultSet rs = null;
	   		ResultSet rs1 = null;
			String query = "INSERT INTO tblMessage (messageTo,messageFrom,messageSubject,messageBody,UserName) VALUES(?,?,?,?,?)";
			String query2= "SELECT * FROM tbluserregistration WHERE UserName=?";
			String query3= "SELECT * FROM tbluserregistration ";
			stmt2 = conn.getStatement(con, query2);
			stmt3 = conn.getStatement(con, query3);
			PrintWriter out = response.getWriter(); 
			try {
				con.setAutoCommit(false);
				rs1 = stmt3.executeQuery();
				con.setAutoCommit(false);
				stmt = conn.getStatement(con, query);
				stmt2.setString(1, UserName);
				rs = stmt2.executeQuery();
				
				while (rs.next()) {
					Name=rs.getString("Name");
					Surname=rs.getString("Surname");
					System.out.println("1");
				
				}
				while(rs1.next()){
					mysqlUserName=rs1.getString("UserName");
					System.out.println(mysqlUserName);
					if(inputTo.equals(mysqlUserName)){
						stmt.setString(1, inputTo);
						stmt.setString(2, Name+" "+Surname);
						stmt.setString(3, inputSubject);
						stmt.setString(4, inputBody);
						stmt.setString(5, UserName);
						stmt.executeUpdate();
						con.commit();
					}
				}	
				out.println("<script type=\"text/javascript\">");
		  		out.println("alert('Mesaj Başarı ile Gönderildi');");
		  		out.println("location='Email.jsp';");
		  		out.println("</script>");	
		
				
			} catch (SQLException e){
				out.println("<script type=\"text/javascript\">");
		  		out.println("alert('Mesaj Gönderilemedi');");
		  		out.println("location='Email.jsp';");
		  		out.println("</script>");	

				e.printStackTrace();
			}

			 finally {
				conn.closeConnection(con);
				conn.closeStatement(stmt);
				conn.closeStatement(stmt2);
				conn.closeStatement(stmt3);
				conn.closeResultSet(rs);
				conn.closeResultSet(rs1);

			}	
		}
}
	


