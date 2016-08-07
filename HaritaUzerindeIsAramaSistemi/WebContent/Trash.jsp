<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<!DOCTYPE html>
<html lang="tr">
<head>
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style>
body {
	padding-top: 50px; /* Whatever the height of your navbar is; the
                             default is 50px */
}

.borderless tbody tr td, .borderless tbody tr th, .borderless thead tr th {
    border: none;
    }
  table { table-layout: fixed; }
 table th, table td,table tr { overflow: hidden; 
 						text-align:center;}
 th{
 background-color: #9494b8;
 	height:6px;
    color: black;
  
 }

</style>
<%
ConnectionHelper conn= new ConnectionHelper();
Connection con = conn.getConnection();
 PreparedStatement stmt = null;
 ResultSet rs = null;
 String	messageFrom = "";
 String messageSubject = "";
 String messageBody = "";
 int messageId = 0;

 String UserName=request.getRemoteUser();
 String query =  "SELECT * FROM tblDeletedMessage WHERE UserName=? order by messageId desc";
 stmt = conn.getStatement(con, query);
 try {
	 	stmt.setString(1,UserName);
	 	rs = stmt.executeQuery();
%>

</head>

<%
String username=request.getRemoteUser();
session.setAttribute("username",username);
%>


<body >

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

				<a class="navbar-brand" href="/HaritaUzerindeIsArama/userhome.jsp">
					<img alt="İşBurada" src="/HaritaUzerindeIsArama/images/logo.png"
					width="25" height="25">
				</a>

			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="/HaritaUzerindeIsArama/userhome.jsp">İşBurada</a></li>
				</ul>
					<form class="navbar-form pull-left" role="search" method="POST"><!-- Didem Kaçmaz Arama Butonu -->
                        <div class="form-group">
                           <input type="text" name="userName" class="form-control" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-default" onclick="form.action='userSearch'"><span class="glyphicon glyphicon-search"></span></button>
                    </form>

				<ul class="nav navbar-nav navbar-right">
					<li><a href="/HaritaUzerindeIsArama/MyReferencesUser.jsp"><span class="glyphicon glyphicon-list-alt"></span> Başvurularım</a></li>
				    <li><a href="/HaritaUzerindeIsArama/Inbox.jsp"><span class="glyphicon glyphicon-envelope"></span>&nbsp;<span class="badge"></span> </a></li><!-- Didem Kaçmaz Email -->
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> <span class="glyphicon glyphicon-user"></span> <%=request.getRemoteUser()%><span class="caret"></span></a>
				<ul class="dropdown-menu">
							<li><a href="userTimeLine.jsp?userName=<%=request.getRemoteUser()%>"><span class="glyphicon glyphicon-user"></span>Profilim</a></li>
							<li><a href="CVContactInformation.jsp"><span class="glyphicon glyphicon-user"></span>Özgeçmiş Bilgilerim</a></li><!-- Didem Kaçmaz Özgeçmiş -->
							<li><a href="CVContactInformationUpdate.jsp"><span class="glyphicon glyphicon-user"></span> Özgeçmiş Bilgilerimi Güncelle</a></li><!-- Özgeçmiş Güncelle -->
							<li><a href="UserSettings.jsp"><span class="glyphicon glyphicon-cog"></span>Hesabım</a></li>
				</ul></li>
					<li><a href="/HaritaUzerindeIsArama/logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Çıkış Yap</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<form  action="inboxServlet" method="POST">
	<br/><br/>
	<div class="container">
	  <div class="container-fluid ">
   <div class="form-group">
			<div class="col-sm-offset-4 col-sm-8">
    <ul class="nav navbar-nav">
      <li><a href="Inbox.jsp">Gelen Kutusu</a></li>
      <li><a href="Email.jsp">Email Oluştur</a></li>
      <li><a href="Trash.jsp">Çöp Kutusu</a></li> 
    </ul>
    </div>
    </div><br><br><br>
  </div>
	<table class="table table-nonfluid" style="margin-left:100px; width: 920px; align:center;">	
	<thead>
	<tr>

	<th>Mesaj Gönderen Kişi</th>
	<th>Mesaj Başlığı</th>
	<th>Mesaj</th>
	</tr>
	</thead>
	<%
	while (rs.next()) {

		messageFrom = rs.getString("messageFrom");
		messageSubject = rs.getString("messageSubject");
		messageBody=rs.getString("messageBody");
		messageId = rs.getInt("messageId");

			
	%>
	<tbody id="details">
      	<tr>
		
        <td><%=messageFrom%></td>
        <td><%=messageSubject%></td>
        <td><%=messageBody%></td>

      </tr>

	<%}
			} catch (SQLException e){

			e.printStackTrace();
		} finally {
			conn.closeStatement(stmt);
			conn.closeConnection(con);
			conn.closeResultSet(rs);
		}
%>	</tbody>
	</table>
	</div>
	
						
	</form>
</body>
</html>