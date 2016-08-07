package com.huia.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.huia.service.db.ConnectionHelper;

@WebServlet("/inboxServlet")
public class inboxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ConnectionHelper conn = new ConnectionHelper();
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");  
		response.setCharacterEncoding("utf-8");

		String[] checkedIds = request.getParameterValues("messageId");
		ArrayList<String> list = new ArrayList<>();
		String UserName=request.getRemoteUser();
		String inputTo= "";
		String inputFrom="";
        String inputSubject = "";
		String inputBody = "";

		Connection con = conn.getConnection();
		PreparedStatement stmt4 = null;
		PreparedStatement stmt2 = null;
		PreparedStatement stmt3 = null;
		ResultSet rs = null;
		
		for(int i=0;i<checkedIds.length;i++){

			   String query2= "Select * from tblMessage WHERE messageId=?";
			   String query3="INSERT INTO tblDeletedMessage (messageTo,messageFrom,messageSubject,messageBody,UserName,messageId) VALUES(?,?,?,?,?,?)";
			   stmt2 = conn.getStatement(con, query2);
			   stmt3 = conn.getStatement(con, query3);
			   try{		  
				   stmt2.setString(1, checkedIds[i]);
				   rs = stmt2.executeQuery();
				   while(rs.next()){
					inputTo = rs.getString("messageTo");
					inputFrom =rs.getString("messageFrom");
					inputSubject = rs.getString("messageSubject");
					inputBody = rs.getString("messageBody");
					
					stmt3.setString(1, inputTo);
					stmt3.setString(2, inputFrom);
					stmt3.setString(3, inputSubject);
					stmt3.setString(4, inputBody);
					stmt3.setString(5, UserName);
					stmt3.setString(6, checkedIds[i]);			
					stmt3.executeUpdate();
				   }
			   	}catch(SQLException e){
			   		e.printStackTrace();
			   	}
			String query4= "DELETE FROM tblMessage WHERE messageId=?";	  
			   stmt4 = conn.getStatement(con, query4);	
			   try {			
					stmt4.setString(1, checkedIds[i]);
					stmt4.executeUpdate();	
					response.sendRedirect("Inbox.jsp");
					
			   }catch(Exception e){
				   
			   }
	       }

		}

	}


