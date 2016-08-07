package com.huia.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.huia.service.db.ConnectionHelper;

@WebServlet("/userSearch")
public class userSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ConnectionHelper conn = new ConnectionHelper();  
    public userSearch() {
        super();
      
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
		response.setCharacterEncoding("utf-8");
        String UserName=request.getParameter("userName"); 
        String roleName = null;
        PrintWriter out = response.getWriter();  
        if(UserName == null){
        	response.sendRedirect("userhome.jsp");
        }else{
         Connection con = conn.getConnection();
   		 PreparedStatement stmt = null;
   		 ResultSet rs = null;
   		 int count=0;	
   		 String query =  "SELECT * FROM tbluser_roles WHERE UserName=?";
   		 stmt = conn.getStatement(con, query);
   		 try {
   		 	stmt.setString(1,UserName);
   		 	rs = stmt.executeQuery();
   		 	while (rs.next()) {
   				rs.getString("UserName");
   				roleName = rs.getString("RoleName");
   				count++;	
   			}
   		 	if(count>0 && count <=1){
   		 		if(roleName.equals("user"))
   		 			response.sendRedirect("userTimeLine.jsp?userName="+UserName);
   		 		else
   		 			response.sendRedirect("FirmProfile.jsp?companyUserName="+UserName);
   		 		
   		 	}
   		 	else
   		 	{
   		 
   		   out.println("<script type=\"text/javascript\">");
  		   out.println("alert('Böyle Bir Kullanıcı Adı Yok...');");
  		   out.println("location='UserProfile.jsp?userName="+request.getRemoteUser()+"';");
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


