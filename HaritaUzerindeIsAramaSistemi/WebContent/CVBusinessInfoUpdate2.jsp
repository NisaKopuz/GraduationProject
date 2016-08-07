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
<html lang="tr">
<head>
<%
ConnectionHelper conn= new ConnectionHelper();
Connection con = conn.getConnection();

PreparedStatement stmt3 = null;
ResultSet rs3 = null;

String userName=request.getRemoteUser();
String Name = "";
String Surname = "";
String Email = "";


String FirmName = "";
String FirmStartDate = "";
String FirmFinishDate = "";
String	PositionAtFirm = "";
String FirmSector="";
String FirmContiune = "";
String BusinessScope="";
String	Explanation = "";

 String query3 = "SELECT * FROM tblBusinessInformation WHERE UserName=?";

 stmt3 = conn.getStatement(con, query3);

 try {

	 	stmt3.setString(1,userName);
	 	rs3 = stmt3.executeQuery();
		int count=0;
	      
	%>
<title>İşBurada.com</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
    $( "#datepicker" ).datepicker({ dateFormat: "dd-mm-yy" }).val()
  });
  </script>
<script>
  $(function() {
    $( "#datepicker2" ).datepicker({ dateFormat: "dd-mm-yy" }).val()
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
</style>



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

	<form class="form-horizontal" data-toggle="validator" name="sform"
		method="POST" action="CVBusinessInfoUpdateServlet" data-fv-framework="bootstrap"
		data-fv-framework="bootstrap"
		data-fv-icon-valid="glyphicon glyphicon-ok"
		data-fv-icon-invalid="glyphicon glyphicon-remove"
		data-fv-icon-validating="glyphicon glyphicon-refresh">
		<div class="container">
			<p>
				<br> <br>
			</p>
			<ul class="nav nav-pills col-md-offset-2   ">
				<li ><a data-toggle="pill" href="CVContactInformationUpdate.jsp">İletişim Bilgileri</a></li>
				<li><a data-toggle="pill" href="CVPersonalInformationUpdate.jsp">Kişisel Bilgiler</a></li>
				<li><a data-toggle="pill" href="CVEducationalInfoUpdate2.jsp">Eğitim Bilgileri</a></li>
				<li class="active" ><a data-toggle="pill" href="CVBusinessInfoUpdate2.jsp">İş Deneyimi</a></li>
				<li><a data-toggle="pill" href="CVForeignLanguageInfoUpdate2.jsp">Yabancı Dil</a></li>
				<li ><a data-toggle="pill" href="CVReferenceInfoUpdate2.jsp">Referans Bilgileri</a></li>
				<li><a data-toggle="pill" href="CVAdditionalInfoUpdate.jsp">Ek Bilgiler</a></li>
			</ul>


			<div class="tab-content text-center">
				<div id="home" class="tab-pane fade in active">
					<br>
					<div class="container center ">


						<div class="form-group">
							<label class="control-label col-sm-9" for="FirmName">İş Bilginizi Seçin &nbsp;&nbsp;&nbsp;:</label>
							<div class="col-sm-3">
							<% 
							while (rs3.next()) {%>
			
				 				<a href="CVBusinessInfoUpdate.jsp?idBusiness=<%=rs3.getString("idBusiness")%>"><%=rs3.getString("FirmName")%></a><br>
		
						<% } %>
	      				
							

							</div>
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
	conn.closeStatement(stmt3);	
	conn.closeResultSet(rs3);
	conn.closeConnection(con);
	
}
 
%>
</html>