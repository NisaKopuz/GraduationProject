<%@page import="com.huia.service.db.ConnectionHelper"%>
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

.labelWidth{
width: 250px;
}
.control-label {
		width: 220px;
	color: #2E9AFE;
	font-size: 150%;
}

.cntrl-label {
	width: 200px;
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
   PreparedStatement stmt3 = null;
   ResultSet rs3 = null;
   PreparedStatement stmt4 = null;
   ResultSet rs4 = null;
   PreparedStatement stmt5 = null;
   ResultSet rs5 = null;
   PreparedStatement stmt6 = null;
   ResultSet rs6 = null;
   PreparedStatement stmt7 = null;
   ResultSet rs7 = null;
   PreparedStatement stmt8 = null;
   ResultSet rs8 = null;
   PreparedStatement stmt9 = null;
   ResultSet rs9 = null;
   PreparedStatement stmt10 = null;
   ResultSet rs10 = null;
   PreparedStatement stmt11 = null;
   ResultSet rs11 = null;
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
   
   String	MaritalStatus = "";
   String Nationality = "";
   String BirthDate = "";
   String BirthPlace = "";
   String	DrivingLicence = "";
   String HomePhoneNumber="";
   
   String	PositionAtFirm = "";
   String FirmName = "";
   String FirmStartDate = "";
   String FirmFinishDate = "";
   String FirmContiune = "";
   String	Explanation = "";
   
   String	UniversityName = "";
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

 if(UserNameUrl != null)
	 userName=UserNameUrl;
 
 if(UserNameUrl == null)
	 userName=request.getRemoteUser();
 
 if("".equals(userName)){
	 response.sendRedirect("userhome.jsp");
 }
 
 
 String FollowerUserName=request.getRemoteUser();
 String FollowedUserName= "";
 
 String query =  "SELECT * FROM tblUserRegistration WHERE UserName=?";
 String query1 = "SELECT * FROM tblContactInformation WHERE UserName=?";
 String query2 = "SELECT * FROM tblPersonalInformation WHERE UserName=?";
 String query3 = "SELECT * FROM tblBusinessInformation WHERE UserName=?";
 String query5 = "SELECT FollowerUserName,FollowedUserName FROM tblFollow WHERE FollowerUserName=? ";
 String query6 = "SELECT * FROM tblForeignLanguage WHERE UserName=? ";
 String query7 = "SELECT * FROM tblReferenceInformation WHERE UserName=? ";
 String query8 = "SELECT * FROM tblAdditionalInformation WHERE UserName=? ";
 String query10 = "SELECT * FROM tblMessage WHERE UserName=? ";
 String query11 = "SELECT * FROM tblUserRegistration WHERE UserName=?";
 String query14	="SELECT *  FROM tblProfileImage WHERE UserName=?";
 
 stmt = conn.getStatement(con, query);
 stmt1 = conn.getStatement(con, query1);
 stmt2 = conn.getStatement(con, query2);
 stmt3 = conn.getStatement(con, query3);
 stmt5 = conn.getStatement(con, query5);
 stmt6 = conn.getStatement(con, query6);
 stmt7 = conn.getStatement(con, query7);
 stmt8 = conn.getStatement(con, query8);
 stmt10 = conn.getStatement(con, query10);
 stmt11 = conn.getStatement(con, query11);
 stmt14 = conn.getStatement(con, query14);
 
 try {
 	stmt.setString(1,userName);
 	rs = stmt.executeQuery();
 	
 	stmt1.setString(1,userName);
 	rs1 = stmt1.executeQuery();
 			
 	stmt2.setString(1,userName);
 	rs2 = stmt2.executeQuery();
 	
 	stmt3.setString(1,userName);
 	rs3 = stmt3.executeQuery();
 	
 	stmt5.setString(1, FollowerUserName);
 	rs5 = stmt5.executeQuery();
 	
 	stmt6.setString(1,userName);
 	rs6 = stmt6.executeQuery();
 	stmt7.setString(1,userName);
 	rs7 = stmt7.executeQuery();
 	stmt8.setString(1,userName);
 	rs8 = stmt8.executeQuery();
 	
 	stmt8.setString(1,userName);
 	rs8 = stmt8.executeQuery();
 	
 
	stmt10.setString(1,userName);
 	rs10 = stmt10.executeQuery();
 	
	stmt11.setString(1,UserNameUrl);
	rs11 = stmt11.executeQuery();

	stmt14.setString(1,userName);
 	rs14 = stmt14.executeQuery();
	
 	int count=0;
	int count2=0;
	int countFollow=0;

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
	
	while (rs10.next()) {
		rs10.getString("UserName");
		messageCount = rs10.getInt("messageCount");
		count++;
	} 
	if (rs2.next() != false) {
		MaritalStatus = rs2.getString("MaritalStatus");
		Nationality = rs2.getString("Nationality");
		BirthDate = rs2.getString("BirthDate");
		BirthPlace = rs2.getString("BirthPlace");
		DrivingLicence = rs2.getString("DrivingLicence");
	}   
   
	while (rs11.next()) {
		rs11.getString("UserName");
		count2++;

	}
	if(count2<1){
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
 					<div>   
 <% //Takip
 ArrayList<String> followers = new ArrayList<String>();
 while(rs5.next() != false){ 
  FollowedUserName=rs5.getString("FollowedUserName");	
   followers.add(rs5.getString("FollowedUserName"));
		 if((UserNameUrl.equals(FollowedUserName))){
			 out.print("<div><button class=\"btn btn-success\" type=\"submit\" onmouseover=\"this.innerHTML = 'Takibi Bırak'\" onmouseout=\"this.innerHTML = this.innerHTML = 'Takip Ediyorsun'\"  onclick=\"form.action='unfollowServlet';\">Takip Ediyorsun</button></div>");   
		 }			 
		 countFollow++;
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
 if(userSession.equals(UserNameUrl)){
	  out.print("<a data-toggle=\"modal\" data-target=\"#myModal\">Düzenle</a>");
 }
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
</div>
<div class="col-sm-8 text-left">   
	 <h1><%=Name%> <%=Surname%></h1>
	 <h3><%=Title%></h3>
<br>
	 <div class="container">
  <ul class="nav nav-tabs">
      <li><a href="userTimeLine.jsp?userName=<%=UserNameUrl%>">PROFİL</a></li>
    <li class="active"><a href="#">ÖZGEÇMİŞ BİLGİLERİ</a></li>
  </ul>
  <br>
    <div class="form-group">
    	<label class="control-label"><span class="glyphicon glyphicon-phone"></span>İletişim Bilgileri&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
    </div>
    <br>
    <div class="form-group">
    	<label class="labelWidth">&nbsp;&nbsp;Eposta</label><%=Email%>	
     </div>
     <div class="form-group">
     	<label class="labelWidth" >&nbsp;&nbsp;Adres Bilgileri </label><%=Country%>-<%=City%>-<%=Town%>-<%=District%>
     </div>
 	 <div class="form-group">
    	<label class="control-label"><span class="glyphicon glyphicon-user"></span>Kişisel Bilgiler&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
    	
     </div>
     <br>
 	 <div class="form-group">
    	<label class="labelWidth">&nbsp;&nbsp;Medeni Durumu</label><%=MaritalStatus%>	
     </div>
     <div class="form-group">
    	<label class="labelWidth" >&nbsp;&nbsp;Uyruk</label><%=Nationality%>	
     </div>
     <div class="form-group">
    	<label class="labelWidth" >&nbsp;&nbsp;Doğum Tarihi</label><%=BirthDate%>	
     </div>
     <div class="form-group">
    	<label class="labelWidth" >&nbsp;&nbsp;Doğum Yeri</label><%=BirthPlace%>	
     </div><br><br>
     <div class="form-group">
    	<label class="labelWidth" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sürücü Belgesi&nbsp;&nbsp;&nbsp;&nbsp;</label><%=DrivingLicence%>	
     </div>

		<div class="form-group">			
    		<label class="control-label"><span class="glyphicon glyphicon-briefcase"></span>İş Deneyimleri&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
       		</div>
       		<br>
		 <div class="container">       
			
	 <%	 
		while (rs3.next()) {
			PositionAtFirm = rs3.getString("PositionAtFirm");
			FirmName = rs3.getString("FirmName");
			FirmStartDate = rs3.getString("FirmStartDate");
			FirmFinishDate = rs3.getString("FirmFinishDate");
			Explanation = rs3.getString("Explanation");
			

		
	 
	 %>	
	 
	   <div class="form-group">
    	<label class="labelWidth">Firmadaki Pozisyon</label><%=PositionAtFirm%>	
       </div>
       <div class="form-group">
    	<label class="labelWidth" >Firma Adı</label><%=FirmName%>	
       </div>
       <div class="form-group">
    	<label class="labelWidth" >İşe Başlangıç Tarihi</label><%=FirmStartDate%>	
       </div>
       <div class="form-group ">
    	<label class="labelWidth" >İşten Ayrılış Tarihi(Veya Devam Durumu)</label><%=FirmFinishDate%><%=FirmContiune%>	
       </div>
       <div class="form-group">
    	<label class="labelWidth" >Ek Açıklama</label><%=Explanation%>
    	</div>
    	 
    <%
    out.print("<p>----------------------</p>");
  		 }
     %>
     </div>
            <div class="form-group">
    	<label class="control-label"><span class="glyphicon glyphicon-education"></span>Eğitim Bilgileri&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
      </div><br>
	   <div class="container">       
 			 <table class="table" id="table">
    			<thead>
     				 <tr>
     				  
       					 <th>Üniversite Adı</th>
        				 <th>Fakülte Adı</th>
       					 <th>Bölüm</th>
       					 <th>Başlangıç Ve Bitiş Tarihi(Durumu)</th>
     				 </tr>
   				 </thead>
	 <%
	    String query4 = "SELECT * FROM tblEducationalInformation WHERE UserName=?";
	    stmt4 = conn.getStatement(con, query4);	
	 	stmt4.setString(1,userName);
	 	rs4 = stmt4.executeQuery();

       while (rs4.next()) {
	 
	    EducationLevel = rs4.getString("EducationLevel");	
		UniversityName = rs4.getString("UniversityName");
		FacultyName = rs4.getString("FacultyName");
		DepartmentName = rs4.getString("DepartmentName");
		StartDate = rs4.getString("StartDate");
		FinishDate = rs4.getString("FinishDate");
		ContinueSituation=rs4.getString("ContinueSituation");

	 %> 

	 			 <tbody>   
     			 	<tr onclick="myFunction(this)">
     			 
       			 		<td><%=UniversityName%>(<%=EducationLevel %>)</td>
       			 		<td><%=FacultyName%></td>
        				<td><%=DepartmentName%></td>
        				<td><%=StartDate%>-<%=FinishDate%></td>
        			
      				</tr> 

       <%} %>
        </tbody>
 		 	</table>
		</div><br>
			
       						 <%
       						String query9 = "SELECT * FROM tblEducationalInformation WHERE UserName=?";
       						stmt9 = conn.getStatement(con, query9);
       						stmt9.setString(1,userName);
       						rs9 = stmt9.executeQuery();
       						String EducationLevel1="";
       						String UniversityName1="";
       						String FacultyName1="";
       						String DepartmentName1="";
       						String StartDate1="";
       						String FinishDate1="";
       						String ContinueSituation1="";
       						
       						while (rs9.next()) {
       						 
       						    EducationLevel1 = rs9.getString("EducationLevel");	
       							UniversityName1 = rs9.getString("UniversityName");
       							FacultyName1 = rs9.getString("FacultyName");
       							DepartmentName1 = rs9.getString("DepartmentName");
       							StartDate1= rs9.getString("StartDate");
       							FinishDate1= rs9.getString("FinishDate");
       							ContinueSituation1=rs9.getString("ContinueSituation");
       							
       								 
       					 %>
       				<%} %>
       				
       		<div class="form-group">
    			
    			<label class="control-label"><span class="glyphicon glyphicon-info-sign"></span>Yabancı Dil Bilgisi</label>
       		</div><br>
	 	 <div class="container">       
 			 <table class="table">
    			<thead>
     				 <tr>
       					 <th>Yabancı Dil Adı</th>
        				 <th>Okuma Seviyesi</th>
       					 <th>Yazma Seviyesi</th>
       					 <th>Konuşma Seviyesi</th>
     				 </tr>
   				 </thead>
    			
	  <%     
       while (rs6.next()) {
   		ForeignLanguageName = rs6.getString("Language");
   		Reading = rs6.getString("Reading");
   		Writing = rs6.getString("Writing");
   		Speaking = rs6.getString("Speaking");
       
       %>
      	 			<tbody>
     			 		<tr>
       			 			<td><%=ForeignLanguageName%></td>
       			 			<td><%=Reading%></td>
        					<td><%=Writing%></td>
        					<td><%=Speaking%></td>
      					</tr> 
    <%
		}
    %>	 
   	 			</tbody>
 			</table>
		</div>
     <div class="form-group">
    		<label class="control-label"><span class="glyphicon glyphicon-duplicate"></span>Referans Bilgileri</label>
        	</div><br>
    <%
    while (rs7.next()) {
		 referenceName = rs7.getString("ReferenceName");
		 referenceSurname =rs7.getString("ReferenceSurname");
		 referenceFirmName = rs7.getString("ReferenceFirmName");
		 referenceFirmSector = rs7.getString("ReferenceFirmSector");
		 referenceEmail = rs7.getString("ReferenceEmail");
		 
    %>
       <div class="form-group">
    	<label class="labelWidth">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Referans Adı</label><%=referenceName%><%=referenceSurname%>	
       </div>
       <div class="form-group">
    	<label class="labelWidth">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Çalıştığı Firma</label><%=referenceFirmName%>	
       </div>
       <div class="form-group">
    	<label class="labelWidth">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Firmanın Sektörü</label><%=referenceFirmSector%>	
       </div>
       <div class="form-group">
    	<label class="labelWidth">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email</label><%=referenceEmail%>	
       </div> 
       <%
       out.print("<p>----------------------</p>");
       %>
  
    <%
   
		}
    %><hr> 
    	<div class="form-group">
    		<label class="control-label"><span class="glyphicon glyphicon-plus-sign"></span>Ek Bilgiler&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        </div><br><br>

   <div class="container">       
    <%
    while (rs8.next()) {
    	 sertificateName= rs8.getString("CertificateName");
    	 sertificatePlace = rs8.getString("CertificatePlace");
    	 skills = rs8.getString("Skills");
    	 seminarName = rs8.getString("SeminarName");
    	 seminarPlace = rs8.getString("SeminarPlace");
    	 BursaryInfo = rs8.getString("BursaryExplanation");
    	 examName = rs8.getString("ExamName");
    	 examPlace = rs8.getString("ExamPlace");
    }
    %>
     <div class="form-group">
    	<label class="labelWidth">&nbsp;&nbsp;&nbsp;&nbsp;Beceriler</label><%=skills%>
       </div>
        <div class="form-group">
    	<label class="labelWidth">&nbsp;&nbsp;&nbsp;&nbsp;Sertifika Adi</label><%=sertificateName%>	
       </div>
        <div class="form-group">
    	<label class="labelWidth">&nbsp;&nbsp;&nbsp;&nbsp;Sertifikanın Alındığı Kurum</label><%=sertificatePlace%>	
       </div>
       <div class="form-group">
    	<label class="labelWidth">&nbsp;&nbsp;&nbsp;&nbsp;Seminer Adı</label><%=seminarName%>
       </div>
        <div class="form-group">
    	<label class="labelWidth">&nbsp;&nbsp;&nbsp;&nbsp;Semineri Veren Kurum</label><%=seminarPlace%>
       </div>
        <div class="form-group">
    	<label class="labelWidth">&nbsp;&nbsp;&nbsp;&nbsp;Burs Bilgisi</label><%=BursaryInfo%>
       </div>
        <div class="form-group">
    	<label class="labelWidth">&nbsp;&nbsp;&nbsp;&nbsp;Sınav Adı</label><%=examName%>	
       </div>
        <div class="form-group">
    	<label class="labelWidth">&nbsp;&nbsp;&nbsp;&nbsp;Sınavı Düzenleyen Kurum</label><%=examPlace%>
       </div><hr>

  				</div>
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
	conn.closeStatement(stmt3);
	conn.closeResultSet(rs3);
	conn.closeStatement(stmt4);
	conn.closeResultSet(rs4);
	conn.closeStatement(stmt5);
	conn.closeResultSet(rs5);
	conn.closeStatement(stmt6);
	conn.closeResultSet(rs6);
	conn.closeStatement(stmt7);
	conn.closeResultSet(rs7);
	conn.closeStatement(stmt8);
	conn.closeResultSet(rs8);
	conn.closeStatement(stmt9);
	conn.closeResultSet(rs9);
	conn.closeStatement(stmt10);
	conn.closeResultSet(rs10);
	conn.closeStatement(stmt11);
	conn.closeResultSet(rs11);
	conn.closeStatement(stmt14);
	conn.closeResultSet(rs14);
	conn.closeConnection(con);
}
 
%>
</html>