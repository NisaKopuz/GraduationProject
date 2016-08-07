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
	String companySession	= request.getRemoteUser();
	session.setAttribute("companyUserName",url);
	
	if(request.getRemoteUser() == null){	    
	 	   if(request.getParameter("companyUserName") != null){
	 		   session.setAttribute("companyUserName",request.getParameter("companyUserName"));	 
	 		   response.sendRedirect("FirmProfile.jsp?companyUserName="+request.getParameter("companyUserName"));
	 	   }
	 	   else// url de boş ise giriş sayfasına yönlendiriliyor.
	 	   {
	 		   response.sendRedirect("employerhome.jsp");
	 	   }
	    }
	 if("".equals(url)){
  	   out.println("<script type=\"text/javascript\">");
		   out.println("alert('Böyle Bir Kullanıcı Adı Yok...');");
		   out.println("location='FirmProfile.jsp?companyUserName="+request.getRemoteUser()+"';");
		   out.println("</script>");
  }
  

	%>
</head>
<body>
<form method="POST">
<%
	AdDAOImp addao = new AdDAOImp();
	int companyid = addao.getCompanyId((request.getRemoteUser()));
	String companyname=addao.getCompanyName(companyid);
	session.setAttribute("companyid",companyid);
%>
<% 
ConnectionHelper conn= new ConnectionHelper();
Connection con = conn.getConnection();
 PreparedStatement stmt = null;
 ResultSet rs = null;
 PreparedStatement stmt2 = null;
 ResultSet rs2 = null;
 PreparedStatement stmt5 = null;
 ResultSet rs5 = null;
 String companyUserName = "";
 if(url != null)
		companyUserName=url;

	if(url == null)
		companyUserName=request.getRemoteUser();
	
 String query = "SELECT * FROM tblcompanyinformation WHERE UserName=?";
 String query2 = "SELECT * FROM tblCompanyProfile WHERE CompanyId=?";
 String query5 = "SELECT FollowerUserName,FollowedUserName FROM tblFollow WHERE FollowerUserName=? ";
 stmt = conn.getStatement(con, query);
 stmt2 = conn.getStatement(con, query2);
 stmt5 = conn.getStatement(con, query5);
 String Name ="";
 String Sector="";
 String District="";
 String Town="";
 String City="";
 
 String CompanyHistory ="";
 String CompanyMotto ="";
 String CompanyVision ="";
 String CompanyMission ="";
 String CompanyWebSite ="";
 String FollowerUserName=request.getRemoteUser();
 String FollowedUserName= "";
 try {
 	stmt.setString(1,companyUserName);
 	rs = stmt.executeQuery();
	stmt2.setInt(1,companyid);
 	rs2 = stmt2.executeQuery();
	stmt5.setString(1, FollowerUserName);
 	rs5 = stmt5.executeQuery();
 	if(rs.next()!=false) {
		Name=rs.getString("Name");
		Sector=rs.getString("Sector");
		District=rs.getString("District");
		Town=rs.getString("Town");
		City=rs.getString("City");
	} 
 	while(rs2.next()){
 		CompanyHistory=rs2.getString("CompanyHistory");
 		CompanyMotto=rs2.getString("CompanyMotto");
 	    CompanyVision=rs2.getString("CompanyVision");
 	    CompanyMission=rs2.getString("CompanyMission");	   
 	   CompanyWebSite=rs2.getString("CompanyWebSite");
 		
 		
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
					href="/HaritaUzerindeIsArama/userhome.jsp"> <img
					alt="İşBurada" src="/HaritaUzerindeIsArama/images/logo.png"
					width="25" height="25">
				</a>

			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav">
					<li><a href="/HaritaUzerindeIsArama/userhome.jsp">İşBurada</a></li>
					
				</ul>
			</div>
		</div>
	</nav>
<div class="bg-1">
<div class="container text-center">
  <h3><%=Name%></h3>
  <p><%=Sector%> <%=CompanyMotto %></p>
 <% //Takip
    int countFollow=0;
 ArrayList<String> followers = new ArrayList<String>();
 while(rs5.next()){	 
		FollowedUserName=rs5.getString("FollowedUserName");	
		followers.add(rs5.getString("FollowedUserName"));
		 if((url.equals(FollowedUserName))){
			 out.print("<div><button class=\"btn btn-success\" type=\"submit\" onmouseover=\"this.innerHTML = 'Takibi Bırak'\" onmouseout=\"this.innerHTML = this.innerHTML = 'Takip Ediyorsun'\"  onclick=\"form.action='unfollowServletFirm';\">Takip Ediyorsun</button></div>");	
	}			 
	countFollow++;
 }

boolean say = false;
 for(int i = 0; i < followers.size(); i++) {
	if(url.equals(followers.get(i))){
		say = true;
	}
}

if(say == false && !(companySession.equals(url)) ){
    out.print("<div><button class=\"btn btn-primary\" type=\"submit\" onclick=\"form.action='followServletFirm';\">Takip Et</button></div>");         
}
 
   %>
</div>
		
</div><br><%-- <div class="text-center">
<%=CompanyHistory %>
</div> --%>
	<footer class="text-center">
  </a><br>
  <address> <%=District%>,<%=Town%>/<%=City%></address> 
  <%-- <strong>Vizyonumuz:<%=CompanyVision%><br>
  Misyonumuz:<%=CompanyMission %></strong><br> --%>
 <br>
 <address>
<a href="<%=CompanyWebSite%>"><%=CompanyWebSite%></a>
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