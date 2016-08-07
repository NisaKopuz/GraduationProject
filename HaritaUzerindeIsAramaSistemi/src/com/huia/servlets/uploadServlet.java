package com.huia.servlets;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.huia.service.db.ConnectionHelper;
 
@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class uploadServlet extends HttpServlet {
   
	private static final long serialVersionUID = 1L;
	// database connection settings
	static ConnectionHelper conn = new ConnectionHelper();
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
    	Connection con = conn.getConnection();
		PreparedStatement statement = null;
        String firstName = "Heyyy";
    
         
        InputStream inputStream = null; // input stream of the upload file
         
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
         
       
        String message = null;  // message will be sent back to client
        String sql = "INSERT INTO tblProfileImage (UserName, Photo) values (?, ?)";
        try {
          
                statement =conn.getStatement(con, sql);
            // constructs SQL statement
          
           
            statement.setString(1, firstName);
           
             
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(2, inputStream);
            }
 
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
           
                	conn.closeConnection(con);
        			conn.closeStatement(statement);
                
            }
           
        }
    }
