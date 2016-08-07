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
<html>
<head>
<title>İşBurada.com</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1h11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script>
	$(function() {
		$("#datepicker").datepicker({ dateFormat: "dd-mm-yy" }).val()
	});
</script>
<script>
	$(function() {
		$("#datepicker2").datepicker({ dateFormat: "dd-mm-yy" }).val()
	});
</script>
<script>
	$(function() {
		$("#datepicker3").datepicker({ dateFormat: "dd-mm-yy" }).val()
	});
</script>
<script>
	$(function() {
		$("#datepicker4").datepicker({ dateFormat: "dd-mm-yy" }).val()
	});
</script>
<style>
.form-control {
	width: 450px;
}

.width-button {
	width: 450px;
}

.btn-file {
	position: relative;
	overflow: hidden;
}

.btn-file input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	min-width: 100%;
	min-height: 100%;
	font-size: 100px;
	text-align: right;
	filter: alpha(opacity = 0);
	opacity: 0;
	outline: none;
	background: white;
	cursor: inherit;
	display: block;
}
</style>

<style>
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

.form-controll {
	width: 300px;
}
</style>
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
String userName=request.getRemoteUser();

String EducationLevel = "";
String StartDate = "";
String FinishDate = "";
String ContinueSituation="";
String DiplomaGradeSystem="";
String DiplomaGrade="";
String	UniversityName = "";
String UniversityTown="";
String FacultyName = "";
String DepartmentName = "";
String EducationType="";
String EducationLanguage="";
String BursaryType="";
String Minortxt="";
String DoubleMajortxt="";
String highSchoolName="";
String highSchoolType="";
String highSchoolTown="";
String highSchoolStartDate="";
String highSchoolFinishDate="";
String highSchoolDegree="";
String educationId ="";

 try {

		 String query4 = "SELECT * FROM tblEducationalInformation WHERE UserName=?";
		    stmt4 = conn.getStatement(con, query4);	
		 	stmt4.setString(1,userName);
		 	rs4 = stmt4.executeQuery();

	      
	
	%>
</head>
<body>
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
					<li><a href="/HaritaUzerindeIsArama/myreferencesuser.jsp"><span class="glyphicon glyphicon-list-alt"></span> Başvurularım</a></li>
					<li><a href="/HaritaUzerindeIsArama/Inbox.jsp"><span class="glyphicon glyphicon-envelope"></span>&nbsp;<span class="badge"></span> </a></li><!-- Didem Kaçmaz Email -->
					<li><a href="userTimeLine.jsp?userName=<%=request.getRemoteUser()%>"><span class="glyphicon glyphicon-user"></span> <%=request.getRemoteUser()%></a></li>
					<li><a href="/HaritaUzerindeIsArama/logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Çıkış Yap</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<form class="form-horizontal" data-toggle="validator" name="sform" method="POST" action="CVEducationalInfoUpdateServlet" data-fv-framework="bootstrap"
		data-fv-framework="bootstrap"
		data-fv-icon-valid="glyphicon glyphicon-ok"
		data-fv-icon-invalid="glyphicon glyphicon-remove"
		data-fv-icon-validating="glyphicon glyphicon-refresh">
		<div class="container">
			<p>
				<br>
				<br>
			</p>
			<ul class="nav nav-pills col-md-offset-2   ">
				<li><a data-toggle="pill" href="CVContactInformationUpdate.jsp">İletişim Bilgileri</a></li>
				<li><a data-toggle="pill" href="CVPersonalInformationUpdate.jsp">Kişisel Bilgiler</a></li>
				<li class="active"><a data-toggle="pill" href="CVEducationalInfoUpdate.jsp">Eğitim Bilgileri</a></li>
				<li><a data-toggle="pill" href="CVBusinessInfoUpdate2.jsp">İş Deneyimi</a></li>
				<li><a data-toggle="pill" href="CVForeignLanguageInfoUpdate2.jsp">Yabancı Dil</a></li>
				<li><a data-toggle="pill" href="CVReferenceInfoUpdate2.jsp">Referans Bilgileri</a></li>
				<li><a data-toggle="pill" href="CVAdditionalInfoUpdate.jsp">Ek Bilgiler</a></li>
			</ul>

			<div class="tab-content text-center">
				<div id="home" class="tab-pane fade in active">
					<p>
						<br>
					</p>
					<div class="container center ">

	      
						<div class="form-group">
							<label class="control-label col-sm-9" for="EducationLevel">Eğitim Bilginizi Seçin &nbsp;&nbsp;&nbsp;:</label>
							<div class="col-sm-3">
						
													
 									<%while (rs4.next()) {%>
							       <a href="CVEducationalInfoUpdate.jsp?educationId=<%=rs4.getString("idEducation")%>"><%=rs4.getString("EducationLevel")%></a><br>
									
									<%} %>
							
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
	conn.closeStatement(stmt4);
	
	conn.closeResultSet(rs4);
	conn.closeConnection(con);
	
}
 
%>
</html>