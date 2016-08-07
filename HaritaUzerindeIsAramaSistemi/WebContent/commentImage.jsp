<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*"%>
 <%@ page import="java.sql.*"%>
 <%@ page import="java.util.*"%>
  <%@ page import="java.text.*"%>
 <%@ page import="javax.servlet.*"%>
 <%@ page import="javax.servlet.http.*"%>
 <%@ page import="javax.servlet.http.HttpSession"%>
 <%@ page import="com.huia.service.db.ConnectionHelper" %>
 <%@ page language="java"%>
 <%@ page session="true"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>

<%
int count=0;
 ConnectionHelper conn = new ConnectionHelper();
Connection con = conn.getConnection();
PreparedStatement stmt = null;
ResultSet rs = null;
int CommentId= Integer.parseInt(request.getParameter("CommentId"));

String query = "select * from tblcomment where CommentId=?";
stmt = conn.getStatement(con, query);

try {
	stmt.setInt(1,CommentId);
	rs = stmt.executeQuery();
	InputStream sImage=null;
    if(rs.next()) {
    	count++;
    byte[] bytearray = new byte[1048576];
    int size=0;
    sImage = rs.getBinaryStream(5);
    response.reset();
    response.setContentType("image/jpeg");
    while((size=sImage.read(bytearray))!= -1 ){
    response.getOutputStream().write(bytearray,0,size);
 
    
    }
    }
    System.out.println("Comment:"+CommentId);
    out.clear(); 
    out = pageContext.pushBody();
  

} catch (SQLException e){
response.getOutputStream().flush();
response.getOutputStream().close();


	e.printStackTrace();

} finally {

	conn.closeStatement(stmt);
	conn.closeConnection(con);
	conn.closeResultSet(rs);
}

%>
</body>
</html>