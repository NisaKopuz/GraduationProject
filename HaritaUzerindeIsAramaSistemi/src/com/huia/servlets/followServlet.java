package com.huia.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.huia.service.db.ConnectionHelper;

@WebServlet("/followServlet")
public class followServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ConnectionHelper conn = new ConnectionHelper();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public followServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
		response.setCharacterEncoding("utf-8");  
        String UserNameFollower= request.getRemoteUser();
        String userUrlFollowed=(String)request.getSession().getAttribute("UserName");
        
        Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		String query="INSERT INTO tblFollow (UserName,FollowerUserName,FollowedUserName) VALUES(?,?,?)";
		stmt = conn.getStatement(con, query);
		try{
			con.setAutoCommit(false);
			stmt.setString(1, UserNameFollower);
			stmt.setString(2, UserNameFollower);
			stmt.setString(3, userUrlFollowed);
			stmt.executeUpdate();
			con.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			conn.closeConnection(con);
			conn.closeStatement(stmt);
		}
		//Takip Ettiði Kiþinin Sayfasýna Yönlendiriliyor.
		response.sendRedirect("UserProfile.jsp?userName="+userUrlFollowed);
	}


}
