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

/**
 * Servlet implementation class unfollowServletFirm
 */
@WebServlet("/unfollowServletFirm")
public class unfollowServletFirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ConnectionHelper conn = new ConnectionHelper();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public unfollowServletFirm() {
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
		response.setContentType("text/html");  
		response.setCharacterEncoding("utf-8");  
        String companyUrlFollowed=(String)request.getSession().getAttribute("companyUserName");
        Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		String query="DELETE FROM tblFollow  WHERE FollowedUserName=?";
		try{
			con.setAutoCommit(false);
			stmt = conn.getStatement(con, query);
			stmt.setString(1, companyUrlFollowed);
			stmt.executeUpdate();
			con.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			conn.closeConnection(con);
			conn.closeStatement(stmt);
		}
		//Takip Ettiði Kiþinin Sayfasýna Yönlendiriliyor.
		response.sendRedirect("FirmProfile.jsp?companyUserName="+companyUrlFollowed);
	}


	}
