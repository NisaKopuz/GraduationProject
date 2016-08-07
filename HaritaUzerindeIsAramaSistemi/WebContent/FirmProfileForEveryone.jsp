<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
 <%@ page import="java.util.*"%>
  <%@ page import="java.text.*"%>
 <%@ page import="javax.servlet.*"%>
 <%@ page import="javax.servlet.http.*"%>
 <%@ page import="javax.servlet.http.HttpSession"%>
 <%@ page import="com.huia.service.db.ConnectionHelper" %>
   <%@ page import="com.huia.service.dao.ad.AdDAOImp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>İşBurada.com</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1h11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">

<style>
.bg-1 {
    background: #2d2d30;
    color: #bdbdbd;
}
.bg-1 h3 {color: #fff;}
.bg-1 p {font-style: italic;}
</style>
<style>
.container {
    padding: 180px 220px;
}

body {
	padding-top: 50px; /* Whatever the height of your navbar is; the
                             default is 50px */
}

#map {
	display: block;
	height: 550px;
}

.control-label {
	width: 220px;
}

.center {
	margin: auto;
	width: 60%;
	border: 2px solid white;
	padding: 20px;
}

.vertical-alignment-helper {
	display: table;
	height: 70%;
	width: 100%;
}

.vertical-align-center {
	/* To center vertically */
	display: table-cell;
	vertical-align: middle;
}

.modal-content {
	/* Bootstrap sets the size of the modal in the modal-dialog class, we need to inherit it */
	width: inherit;
	height: inherit;
	/* To center horizontally */
	margin: 0 auto;
}

.form-control {
	width: 200px;
}
</style>
	<%
	String url= request.getParameter("companyUserName");
	String companyUserName=request.getRemoteUser();
	if("".equals(url)){
	  	   out.println("<script type=\"text/javascript\">");
			   out.println("alert('Böyle Bir Kullanıcı Adı Yok...');");
			   out.println("location='WelcomePage.jsp';");
			   out.println("</script>");
	  }
	%>
</head>
<body>
<form method="POST">
<% 
if(url != null)
companyUserName=url;
ConnectionHelper conn= new ConnectionHelper();
Connection con = conn.getConnection();
 PreparedStatement stmt = null;
 ResultSet rs = null;
 PreparedStatement stmt5 = null;
 ResultSet rs5 = null;
 String query = "SELECT * FROM tblcompanyinformation WHERE UserName=?";
 String query5 = "SELECT FollowerUserName,FollowedUserName FROM tblFollow WHERE FollowerUserName=? ";
 stmt5 = conn.getStatement(con, query5);
 stmt = conn.getStatement(con, query);
 String FollowerUserName=request.getRemoteUser();
 String FollowedUserName= "";

 
 try {
 	stmt.setString(1,companyUserName);
 	rs = stmt.executeQuery();
	stmt5.setString(1, FollowerUserName);
 	rs5 = stmt5.executeQuery();
 	String Name= "";
 	String District="";
 	String Sector="";
 	String Town="";
 	String City="";
	if(rs.next()!=false) {
		Name=rs.getString("Name");
		District=rs.getString("District");
		Sector=rs.getString("Sector");
		Town=rs.getString("Town");
		City=rs.getString("City");
	}else{
		  out.println("<script type=\"text/javascript\">");
		   out.println("alert('Böyle Bir Kullanıcı Adı Yok...');");
		   out.println("location='employerhome.jsp';");
		   out.println("</script>");
	}
	%>
	
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

				<a class="navbar-brand"
					href="/HaritaUzerindeIsArama/employerhome.jsp"> <img
					alt="İşBurada" src="/HaritaUzerindeIsArama/images/logo.png"
					width="25" height="25">
				</a>

			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="/HaritaUzerindeIsArama/employerhome.jsp">İşBurada</a></li>
				</ul>
				
				<ul class="nav navbar-nav navbar-right">

				<%
				 if("".equals(companyUserName) &&  "".equals(FollowerUserName)){
					 response.sendRedirect("/HaritaUzerindeIsArama/WelcomePage.jsp");
				 }
				
				%>
					
				</ul>
			</div>
		</div>
	</nav>
<div class="bg-1">
<div class="container text-center">
  <h3><%=Name%></h3>
  <p><%=Sector%></p>

 <% //Takip
 int countFollow=0;
 ArrayList<String> followers = new ArrayList<String>();
 while(rs5.next()){	 
		FollowedUserName=rs5.getString("FollowedUserName");	
		followers.add(rs5.getString("FollowedUserName"));
		 if((url.equals(FollowedUserName))){
			 out.print("<div><button class=\"btn btn-success\" type=\"submit\" onmouseover=\"this.innerHTML = 'Takibi Bırak'\" onmouseout=\"this.innerHTML = this.innerHTML = 'Takip Ediyorsun'\"  onclick=\"form.action='unfollowServletFirm';\">Takip Ediyorsun</button></div>");	
	}	
 }

boolean say = false;
 for(int i = 0; i < followers.size(); i++) {
	if(url.equals(followers.get(i))){
	  say = true;
	
	}
}

if(say == false ){
    out.print("<div><button class=\"btn btn-primary\" type=\"submit\" onclick=\"form.action='followServletFirm';\">Takip Et</button></div>");         
}
 
   %>
</div>
		
</div>
	<footer class="text-center">
  </a><br><br>
  <address>
</address>
  <address>
  <strong></strong><br>
  <%=District%>, <%=Town%><br>
  <%=City%><br>

</address>


</footer>
<% 
	
	
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
	</form>
</body>
</html>