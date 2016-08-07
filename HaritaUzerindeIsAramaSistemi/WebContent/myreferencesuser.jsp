<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="tr">
<head>
<title>Başvurularım</title>
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

	<script>

function getReferencesInformation() {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			document.getElementById("details").innerHTML = xhttp.responseText;
		}
	};
	xhttp.open("POST", "getreferenceinformation", true);
	xhttp.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded");
	xhttp.send();
	
}

	</script>
	
<script type="text/javascript">


function edit()
{
	var adid=document.getElementById("GetAdId").value;
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		
	};
	xhttp.open("POST", "changemessagestatus", true);
	xhttp.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded");
	xhttp.send("adId=" + adid);
	

}

function deleteref()
{

	var adid=document.getElementById("GetAdId").value;
	var http = new XMLHttpRequest();
	http.onreadystatechange = function() {
		if (http.readyState == 4 && http.status == 200) {
		    location.reload();
		}
	};
	http.open("POST", "deleterefr", true);
	http.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded");
	http.send("adId=" + adid);

	
	}
</script>



</head>

<%
String username=request.getRemoteUser();
session.setAttribute("username",username);
%>


<body onload="getReferencesInformation();">

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
	
	<br/><br/><br><br/>
	<div class="container">
	<table class="table table-nonfluid" style="margin-left:100px; width: 920px; align:center;">
	
	<thead>
	<tr>
	<th>Başvuru Tarihi</th>
	<th>Firma Adı</th>
	<th>Başvuru Hareketi</th>
	<th>Mektup</th>
	<th>İşlemler</th>
	</tr>
	</thead>
	<tbody id="details">
	

	</tbody>
	</table>
	</div>

</body>
</html>