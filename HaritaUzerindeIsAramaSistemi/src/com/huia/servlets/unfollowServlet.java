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

@WebServlet("/unfollowServlet")
public class unfollowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ConnectionHelper conn = new ConnectionHelper();
    public unfollowServlet() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
		response.setCharacterEncoding("utf-8");  
        String userUrlFollowed=(String)request.getSession().getAttribute("UserName");
        Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		String query="DELETE FROM tblFollow  WHERE FollowedUserName=?";
		try{
			con.setAutoCommit(false);
			stmt = conn.getStatement(con, query);
			stmt.setString(1, userUrlFollowed);
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

