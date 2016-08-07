
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
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
<html lang="en">
<head>
  <title>İşBurada.com</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


 <style>
body {
	padding-top: 50px; /* Whatever the height of your navbar is; the
                             default is 50px */
}
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */

    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 200%;
      width : 27%;
    }
  
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
    }
  </style>

<style>


.control-label {
	
	color: #2E9AFE;
	
}

.cntrl-label {
	width: 200px;
}
.jumbotron{
 width:600px;

 margin-left:90px;
}

</style>
</head>
<body>

<%
   //Giriş yapan kullanıcı ve url deki kullanıcının username leri alınıyor.
    String UserNameUrl = request.getParameter("userName");
    String userSession	= request.getRemoteUser();
    session.setAttribute("UserName", UserNameUrl);
    //Giriş yapan kullanıcı null ise url deki kullanıcıya göre işlem yapılıyor
    if(request.getRemoteUser() == null){	    
 	   if(request.getParameter("userName") != null){
 		   session.setAttribute("userName",request.getParameter("userName"));	 
 		   response.sendRedirect("UserProfile.jsp?userName="+request.getParameter("userName"));
 	   }
 	   else// url de boş ise giriş sayfasına yönlendiriliyor.
 	   {
 		   response.sendRedirect("userhome.jsp");
 	   }
    }
    if("".equals(UserNameUrl)){
    	   out.println("<script type=\"text/javascript\">");
		   out.println("alert('Böyle Bir Kullanıcı Adı Yok...');");
		   out.println("location='UserProfile.jsp?userName="+request.getRemoteUser()+"';");
		   out.println("</script>");
    }
    
%>
  <%
  ConnectionHelper conn= new ConnectionHelper();
  Connection con = conn.getConnection();
   PreparedStatement stmt = null;
   ResultSet rs = null;
   PreparedStatement stmt1 = null;
   ResultSet rs1 = null;
   PreparedStatement stmt2 = null;
   ResultSet rs2 = null;
   PreparedStatement stmt5 = null;
   ResultSet rs5 = null;
   PreparedStatement stmt10 = null;
   ResultSet rs10 = null;
   PreparedStatement stmt11 = null;
   ResultSet rs11 = null;
   PreparedStatement stmt12 = null;
   ResultSet rs12 = null;
   PreparedStatement stmt13 = null;
   ResultSet rs13 = null;
   PreparedStatement stmt14 = null;
   ResultSet rs14 = null;
 
 
   String userName = "";
   String Name = "";
   String Surname = "";
   String Email = "";
   
   String Title= "";
   String Country = "";
   String City = "";
   String Town = "";
   String District = "";
   String CellPhoneNumber = "";
   
   String MaritalStatus = "";
   String Nationality = "";
   String BirthDate = "";
   String BirthPlace = "";
   String DrivingLicence = "";
   String HomePhoneNumber="";
   
   String PositionAtFirm = "";
   String FirmName = "";
   String FirmStartDate = "";
   String FirmFinishDate = "";
   String FirmContiune = "";
   String Explanation = "";
   
   String UniversityName = "";
   String FacultyName = "";
   String DepartmentName = "";
   String StartDate = "";
   String FinishDate = "";
   String ContinueSituation="";
   
   String ForeignLanguageName = "";
   String Reading = "";
   String Writing = "";
   String Speaking = "";
   
   String referenceName = "";
   String referenceSurname = "";
   String referenceFirmName = "";
   String referenceFirmSector = "";
   String referenceEmail = "";
   
   String sertificateName= "";
   String sertificatePlace = "";
   String skills ="";
   String seminarName="";
   String seminarPlace ="";
   String BursaryInfo ="";
   String FondationInfo="";
   String examName="";
   String examPlace="";
	String EducationLevel = "";
	int messageCount =0;
	
	String Text="";

	

 if(UserNameUrl != null)
	 userName=UserNameUrl;
 
 if(UserNameUrl == null)
	 userName=request.getRemoteUser();
 
 
 if("".equals(userName)){
	 response.sendRedirect("userhome.jsp");
 }
 
 String FollowerUserName=request.getRemoteUser();
 String FollowedUserName= "";
 
 String FollowerUserName1=request.getRemoteUser();
 String FollowedUserName1= "";
 
 String query =  "SELECT * FROM tblUserRegistration WHERE UserName=?";
 String query1 = "SELECT * FROM tblContactInformation WHERE UserName=?";
 String query2 = "SELECT * FROM tblPersonalInformation WHERE UserName=?";
 String query5 = "SELECT FollowerUserName,FollowedUserName FROM tblFollow WHERE FollowerUserName=? ";
 String query10 ="SELECT * FROM tblMessage WHERE UserName=? ";
 String query11 ="SELECT * FROM tblUserRegistration WHERE UserName=?";
 String query12 ="SELECT FollowerUserName,FollowedUserName FROM tblFollow WHERE FollowerUserName=? ";
 String query14	="SELECT *  FROM tblProfileImage WHERE UserName=?";

 
 stmt = conn.getStatement(con, query);
 stmt1 = conn.getStatement(con, query1);
 stmt2 = conn.getStatement(con, query2);
 stmt5 = conn.getStatement(con, query5);
 stmt10 = conn.getStatement(con, query10);
 stmt11 = conn.getStatement(con, query11);
 stmt12 = conn.getStatement(con, query12);
 stmt14 = conn.getStatement(con, query14);

 
 try {
 	stmt.setString(1,userName);
 	rs = stmt.executeQuery();
 	
 	stmt1.setString(1,userName);
 	rs1 = stmt1.executeQuery();
 			
 	stmt2.setString(1,userName);
 	rs2 = stmt2.executeQuery();
 	 	
 	stmt5.setString(1, FollowerUserName);
 	rs5 = stmt5.executeQuery();

	stmt10.setString(1,userName);
 	rs10 = stmt10.executeQuery();
 	
	stmt11.setString(1,UserNameUrl);
	rs11 = stmt11.executeQuery();
	
	stmt12.setString(1, FollowerUserName1);
 	rs12 = stmt12.executeQuery();
 	

	stmt14.setString(1,userName);
 	rs14 = stmt14.executeQuery();
 	
 	
 	int count=0;
	int count2=0;

	while (rs.next()) {
		Name = rs.getString("Name");
		Surname = rs.getString("Surname");
		Email = rs.getString("Email");
	} 
	while (rs1.next()) {
		Title = rs1.getString("Title");
		Country = rs1.getString("Country");
		City = rs1.getString("City");
		Town = rs1.getString("Town");
		District = rs1.getString("District");
		CellPhoneNumber = rs1.getString("CellPhoneNumber");
	} 
	while(rs2.next()) {
		MaritalStatus = rs2.getString("MaritalStatus");
		Nationality = rs2.getString("Nationality");
		BirthDate = rs2.getString("BirthDate");
		BirthPlace = rs2.getString("BirthPlace");
		DrivingLicence = rs2.getString("DrivingLicence");
	} 
	
	while (rs10.next()) {
		rs10.getString("UserName");
		messageCount = rs10.getInt("messageCount");
		count++;
	} 
  
   
	while (rs11.next()) {
		rs11.getString("UserName");
		count2++;

	}
	if(count2 < 1){
			 out.println("<script type=\"text/javascript\">");
			 out.println("alert('Böyle Bir Kullanıcı Adı Yok...');");
			 out.println("location='UserProfile.jsp?userName="+request.getRemoteUser()+"';");
			 out.println("</script>");
	}
	int countImage=0;

%>
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
                           <input type="text" name="userName" class="form-control" placeholder="Kullanıcı ara..">
                        </div>
                        <button type="submit" class="btn btn-default" onclick="form.action='userSearch'"><span class="glyphicon glyphicon-search"></span></button>
                    </form>
				<ul class="nav navbar-nav navbar-right">
				<li><a href="/HaritaUzerindeIsArama/myreferencesuser.jsp"><span class="glyphicon glyphicon-list-alt"></span>
							Başvurularım</a></li>
					  <li><a href="/HaritaUzerindeIsArama/Inbox.jsp"><span class="glyphicon glyphicon-envelope"></span>&nbsp;<span class="badge"></span> </a></li><!-- Didem Kaçmaz Email -->
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"> <span
							class="glyphicon glyphicon-user"></span> <%=request.getRemoteUser()%>
							<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="userTimeLine.jsp?userName=<%=request.getRemoteUser()%>"><span class="glyphicon glyphicon-user"></span>Profilim</a></li>
							<li><a href="CVContactInformation.jsp"><span class="glyphicon glyphicon-user"></span>Özgeçmiş Bilgilerim</a></li><!-- Didem Kaçmaz Özgeçmiş -->
							<li><a href="CVContactInformationUpdate.jsp"><span class="glyphicon glyphicon-user"></span> Özgeçmiş Bilgilerimi Güncelle</a></li><!-- Özgeçmiş Güncelle -->
							<li><a href="/HaritaUzerindeIsArama/myaccountuser.jsp"><span class="glyphicon glyphicon-cog"></span>
									Hesabım</a></li>
						</ul></li>

					<li><a href="/HaritaUzerindeIsArama/logout.jsp"><span
							class="glyphicon glyphicon-log-out"></span> Çıkış Yap</a></li>
				</ul>
			</div>
		</div>
	</nav>
<form class="form-horizontal " method="POST" action="CurriculumVitaeImage" data-fv-framework="bootstrap" enctype="multipart/form-data">
	<div class="container-fluid text-center"><br>
  		<div class="row content">
      				<div class="col-sm-2  ">
      					<div class="well">
      					<!--  -->
      					<%while(rs14.next()){
      						String imageUserName= rs14.getString("UserName");
      						countImage++;
      					}
      					if(countImage == 0){
      						%>
      						<img src="http://vignette3.wikia.nocookie.net/glee-new-beginnings/images/f/fd/Unknown.gif/revision/latest?cb=20130205144914" class="avatar img-thumbnail" alt="Photo">
      					
      					<%} %>
      						 	<% if(countImage > 0){ %>
      						 	<img src="ProfileImage.jsp" class="avatar img-thumbnail" alt="Photo">
      						 	<%} %>
      						 
     		    		</div>
     		    		<br>
    <div class="text-center">
     <div class="pw-widget pw-size-large">
	<a class="pw-button-facebook"></a>
	<a class="pw-button-twitter"></a>
	<a class="pw-button-googleplus"></a>
	<a class="pw-button-pinterest"></a>
	<a class="pw-button-tumblr"></a>
</div>
<script src="http://i.po.st/static/v3/post-widget.js#publisherKey=ree2tvdnq33tbm2u2lfh" type="text/javascript"></script>
</div>	<br>
     		    		
    
  <% //Takip
 ArrayList<String> followers = new ArrayList<String>();
 while(rs5.next() != false){ 
  FollowedUserName=rs5.getString("FollowedUserName");	
   followers.add(rs5.getString("FollowedUserName"));
		 if((UserNameUrl.equals(FollowedUserName))){
			 out.print("<div><button class=\"btn btn-success\" type=\"submit\" onmouseover=\"this.innerHTML = 'Takibi Bırak'\" onmouseout=\"this.innerHTML = this.innerHTML = 'Takip Ediyorsun'\"  onclick=\"form.action='unfollowServlet';\">Takip Ediyorsun</button></div>");   
		 }			 
	
 }

boolean say = false;
 for(int i = 0; i < followers.size(); i++) {
	if(UserNameUrl.equals(followers.get(i))){
		say = true;
	}
}
 
if(say == false && !(userSession.equals(UserNameUrl)) ){
	out.print("<div><button class=\"btn btn-primary\" type=\"submit\" onclick=\"form.action='followServlet';\">Takip Et</button></div>");
}
 
 //giriş yapan kişinin profilinde ise fotoğraf düzenle kısmı gözüksün

   %>
 <div>   					
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="vertical-alignment-helper">
		<div class="modal-dialog vertical-align-center">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
						<h4 class="modal-title" id="myModalLabel">Resim Güncelle</h4>
				</div>
					<div class="modal-body col-sm-12 ">
						<div class="col-sm-4" >
						<% 
						if(countImage == 0){
      						%>
      						<img src="http://vignette3.wikia.nocookie.net/glee-new-beginnings/images/f/fd/Unknown.gif/revision/latest?cb=20130205144914" class="avatar img-thumbnail" alt="Photo">
      					
      					<%} %>
      						 	<% if(countImage > 0){ %>
      						 	<img src="ProfileImage.jsp" class="avatar img-thumbnail" alt="Photo">
      						 	<%} %>
						</div>
							<div class="col-sm-8">												
								<input type="file" value="ImagePath" name="ImagePath">
							</div>
							
								<br><br>
					</div>
						<div class="modal-footer">
							<div class="modal-body col-sm-12">
										<button type="submit" class="btn btn-success" onclick="form.action='CurriculumVitaeImage'">YÜKLE</button>
										<button type="submit" class="btn btn-danger" onclick="form.action='CurriculumVitaeImageSecond';">SİL</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="col-sm-8 text-left">   
	 <h1><%=Name%> <%=Surname%></h1>
	 <h3><%=Title%></h3>
<br>
	 <div class="container">
  <ul class="nav nav-tabs">
  	<li class="active"><a href="">PROFİL</a></li>
    <li ><a href="UserProfile.jsp?userName=<%=UserNameUrl%>">ÖZGEÇMİŞ BİLGİLERİ</a></li>
    
  </ul>

  <br><br>
<%
String query13 = "select * from tblcomment where username IN (select FollowedUserName from tblfollow where  FollowerUserName = ?) ORDER BY CommentDate DESC";

stmt13 = conn.getStatement(con, query13);

	 stmt13.setString(1,userName);
	 rs13 = stmt13.executeQuery();

	 ArrayList<Integer> adid= new ArrayList<Integer>();
	
	 int i=0;

	while (rs13.next()) {
	
				out.print("<div class= \"container\">");
		        out.print("<div class= \"jumbotron\">");
		        out.print("<p><label class=\"control-label\">"+rs13.getString("UserName")+" bir ilana yorum yaptı</label></p>");
		        out.print("<p>"+rs13.getString("Text")+"</p>");
		        if(("" != (rs13.getString("Location"))) && (null != (rs13.getString("Location")))){
		        	//System.out.println(rs13.getString("Location"));
		        out.print("<label>"+rs13.getString("Location")+" yakınlarında"+" <span class=\"glyphicon glyphicon-globe\">"+"</label>");out.print("<br>");
		        }
		        out.print("<a href=\"http://localhost:8080/HaritaUzerindeIsArama/showadvert.jsp?advertId="+ rs13.getInt("AdId")+"\" >İlanı Görüntülemek İçin Tıklayın</a>");
		        out.print("<br>");
		        if(rs13.getBlob("Photo") != null){
		        out.print("<img src=\"commentImage.jsp?CommentId="+ rs13.getInt("CommentId")+"\" alt=\"Photo\">");
		        }
		        out.print("</div>");
		        out.print("</div>");
		        out.print("<br><br>");
		        i++;
			 } 	
%>

 
  				</div>
			</div>
		</div>
	</div>

</form>

</body>
<%  
} catch (SQLException e){
	response.getOutputStream().flush();
	response.getOutputStream().close();
	e.printStackTrace();
} finally {
	conn.closeStatement(stmt);
	
	conn.closeResultSet(rs);
	conn.closeStatement(stmt1);
	conn.closeResultSet(rs1);
    conn.closeStatement(stmt2);
	conn.closeResultSet(rs2);
	conn.closeStatement(stmt5);
	conn.closeResultSet(rs5);	
    conn.closeStatement(stmt10);
	conn.closeResultSet(rs10);
    conn.closeStatement(stmt11);
	conn.closeResultSet(rs11);
    conn.closeStatement(stmt12);
	conn.closeResultSet(rs12);
	conn.closeStatement(stmt14);
	conn.closeResultSet(rs14);
	conn.closeConnection(con);
 
 	
}
 
%>
</html>