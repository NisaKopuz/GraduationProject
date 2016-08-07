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
<title>İşburada.com</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%
		String username = request.getRemoteUser();
		session.setAttribute("username", username);
%>

<style>
body {
	padding-top: 42px; /* Whatever the height of your navbar is; the
                             default is 50px */
}

#map {
	display: block;
	height: 550px;
}

h3, h5 {
	font-weight: bold;
}

#rcorners2 {
    border-radius: 30px;
    border: 5px solid #B0B0B0;
    padding: 20px; 
    width: 850px;
    height: 402px;    
     margin: auto;
}

input[type="submit"] {
    width:auto;
}
.help {
    display:none;
    font-size:90%;
}
input:focus + .help {
    display:inline-block;
}
div.submit {
    margin-left:170px;
    }
    .alert-box {
    color:#555;
    border-radius:10px;
    font-family:Tahoma,Geneva,Arial,sans-serif;
    font-size:11px;
    padding:10px 10px 10px 36px;
    margin:10px;
}
.alert-box span {
    font-weight:bold;
    text-transform:uppercase;
}
.error {
    background:#ffecec url('images/error.png')  no-repeat 10px 50%;
    border:1px solid #f5aca6;
}
</style>
</head>

<body >




	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
					<a class="navbar-brand" href="/HaritaUzerindeIsArama/userhome.jsp">
						<img alt="İşBurada" src="/HaritaUzerindeIsArama/images/logo.png" width="25" height="25">
					</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="/HaritaUzerindeIsArama/userhome.jsp">İşBurada</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/HaritaUzerindeIsArama/MyReferencesUser.jsp"><span class="glyphicon glyphicon-list-alt"></span>
							Başvurularım</a></li>
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> <span class="glyphicon glyphicon-user"></span> <%=request.getRemoteUser()%>
						<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="UserProfile.jsp?userName=<%=request.getRemoteUser()%>"><span class="glyphicon glyphicon-user"></span>Profilim</a></li>
					<li><a href="CVContactInformation.jsp"><span class="glyphicon glyphicon-tasks"></span>Özgeçmiş Bilgilerim</a></li>
					<li><a href=""><span class="glyphicon glyphicon-pencil"></span>Özgeçmiş Bilgilerimi Düzenle</a></li>
					<li><a href=""><span class="glyphicon glyphicon-cog"></span>Hesabım</a></li>
				</ul>
					</li>
					<li><a href="/HaritaUzerindeIsArama/logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Çıkış Yap</a></li>
				</ul>
			</div>
		</div>
	</nav>
<form class="form-horizontal" role="form" action="" method=>
 

	</form>

</body>
</html>