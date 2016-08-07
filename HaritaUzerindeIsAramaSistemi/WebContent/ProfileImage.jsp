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

 ConnectionHelper conn = new ConnectionHelper();
Connection con = conn.getConnection();
PreparedStatement stmt = null;
ResultSet rs = null;
String UserName =(String)session.getAttribute("UserName");
String userName = "";
if (UserName != null)
	userName = UserName;

if (UserName == null)
	userName = request.getRemoteUser();
if("".equals(userName)){
	response.sendRedirect("userhome.jsp");
}
String query = "SELECT Photo FROM tblProfileImage WHERE UserName=?";
stmt = conn.getStatement(con, query);
try {
	stmt.setString(1,userName);
	rs = stmt.executeQuery();
	InputStream sImage=null;
    while(rs.next()) {

    byte[] bytearray = new byte[1048576];
    int size=0;
    sImage = rs.getBinaryStream(1);
    response.reset();
    response.setContentType("image/jpeg");
    while((size=sImage.read(bytearray))!= -1 ){
    response.getOutputStream().write(bytearray,0,size);

    }
    }
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