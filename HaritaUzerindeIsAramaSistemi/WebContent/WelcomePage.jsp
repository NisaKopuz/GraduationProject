<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="tr">
<head>
<title>İşBurada.com</title>
<meta charset="utf-8">
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


#filterheader {
 	background-color: #afd3c9;
 	 border-top-style: inset;
 	  border-right-style: inset;
 text-align: center;
  	border: none;
    margin: 1px;
    width:280px;
    height:50px
    
}

.btns
{
  background-color: #E0EEEA;
 	 border-right-style: inset;

    border: none;
	 border-top-style: inset;
    text-align: center;
    text-decoration: none;
    
    font-size: 13px;
 
    margin: 1px;
	color: black;
    width:280px;
    height:40px

}

#map {
	display: block;
	height: 550px;
}
</style>
</head>

<body>

<script>
		$(document).ready(function() {
			$.get('ControlLastApplyDate', function(responseJson) {
				$.each(responseJson, function(key, value) {

				});
			});
		});
	</script>

	<script>
		$(document).ready(function() {
			$.get('GetAllDepartmentIdsWithJson', function(responseJson) {
				$.each(responseJson, function(key, value) {

					createMarker(value);
				});
			});
		});
	</script>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

				<a class="navbar-brand" href="/HaritaUzerindeIsArama/WelcomePage.jsp"> <img
					alt="İşBurada" src="/HaritaUzerindeIsArama/images/logo.png" width="25"
					height="25">
				</a>

			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="/HaritaUzerindeIsArama/WelcomePage.jsp">İşBurada</a></li>
				</ul>

				<!--  <form class="navbar-form navbar-left" role="search">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Ara"
							name="srch-term" id="srch-term">
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form>-->

				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"> <span
							class="glyphicon glyphicon-user"></span> Üye <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/HaritaUzerindeIsArama/userhome.jsp">Giriş Yap</a></li>
							<li><a href="/HaritaUzerindeIsArama/signupasuser.jsp">Kayıt Ol</a></li>

						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"> <span
							class="glyphicon glyphicon-user"></span> İşveren <span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/HaritaUzerindeIsArama/employerhome.jsp">Giriş
									Yap</a></li>
							<li><a href="/HaritaUzerindeIsArama/signupasemployer.jsp">Kayıt
									Ol</a></li>

						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid">


		<div class="row">
			<div class="col-md-3">
				<div class="container-fluid">
				
					<div class="row center-block text-center " >
					
						
						<div class="center-block text-center" id="filterheader"> 
						<h4><strong><br>İlan Filtrele </strong></h4>
						<p id="adnumber"></p> 
						
						</div>
						<div class="form-group center-block text-center ">
						
   			<button  type="button" class="btns" data-toggle="collapse" data-target="#demo">Firma Sektörü</button>
  					
						
							<br/>
						<!-- Departman -->
						
						<button  type="button" class="btns" data-toggle="collapse" data-target="#demo1">Departman</button>
  						
							<br/>


						<!-- Şehir -->
						
							<button type="button" class="btns" data-toggle="collapse" data-target="#demo2">Şehir</button>
  		
					

						<!-- Şirket Adı -->
						
						<button type="button" class="btns" data-toggle="collapse" data-target="#demo3">Şirket Adı</button>
  						
 					
						<!-- İş Türü   -->
						
						
								
						<button type="button" class="btns" data-toggle="collapse" data-target="#demo4">Çalışma Şekli</button>
  							
							<br/>
					
						<!-- Pozisyon Seviyesi  -->
								
						<button type="button" class="btns" data-toggle="collapse" data-target="#demo5">Pozisyon Seviyesi</button>
  							
							<br/>
						<!-- Yayınlanma Tarihi  -->
						
							<button type="button" class="btns" data-toggle="collapse" data-target="#demo6">Yayınlama Tarihi</button>
  								
								<br/>
							
					
						
						<!-- Eğitim Seviyesi-->
						
							<button type="button" class="btns" data-toggle="collapse" data-target="#demo7">Eğitim Seviyesi</button>
  								
				
						
						<!-- Tecrübe -->
							
							<button type="button" class="btns" data-toggle="collapse" data-target="#demo8">İş Tecrübesi</button>
  								
						
						<br/>
						<!-- Maaş Aralığı -->
						
							
							<button type="button" class="btns" data-toggle="collapse" data-target="#demo9">Net Maaş Aralığı</button>
  								
							</div>
						
						<br/>
						</div>
						<button type="button" 
							class="btn btn-primary btn-md pull-right btn-block">Ara</button>
				</div>
				</div>
				
							
			<div id="map" class="col-md-6">

				<script>
					function initMap() {
						map = new google.maps.Map(document
								.getElementById('map'), {
							center : {
								lat : 41.0055005,
								lng : 28.731986
							},
							zoom : 10
						});

						if (navigator.geolocation) {
							navigator.geolocation.getCurrentPosition(function(
									position) {
								var pos = {
									lat : position.coords.latitude,
									lng : position.coords.longitude
								};

								map.setCenter(pos);
								map.setZoom(18);
							}, handleLocationError);
						} else {
							// Browser doesn't support Geolocation
							handleLocationError(error);
						}

					}

					function createMarker(departmentId) {
						var xhttp = new XMLHttpRequest();
						xhttp.onreadystatechange = function() {
							if (xhttp.readyState == 4 && xhttp.status == 200) {
								var coord = xhttp.responseText.split(";", 2);
								var marker = new google.maps.Marker({
									position : {
										lat : parseFloat(coord[0]),
										lng : parseFloat(coord[1])
									},
									map : map,
									//label : 'H',
									title : 'My Location'
								});
								getHeaderList(departmentId, marker);
							}
						};
						xhttp.open("POST", "GetCoords", true);
						xhttp.setRequestHeader("Content-type",
								"application/x-www-form-urlencoded");
						xhttp.send("deptId=" + departmentId);

					}

					function handleLocationError(error) {
						switch (error.code) {
						case error.PERMISSION_DENIED:
							alert('User denied the request for Geolocation.');
							break;
						case error.POSITION_UNAVAILABLE:
							alert('Location information is unavailable.');
							break;
						case error.TIMEOUT:
							alert('The request to get user location timed out.');
							break;
						case error.UNKNOWN_ERROR:
							alert('An unknown error occurred.');
							break;
						}
					}

					function getHeaderList(departmentId, marker) {
						var xhttp = new XMLHttpRequest();
						xhttp.onreadystatechange = function() {
							if (xhttp.readyState == 4 && xhttp.status == 200) {
								marker
										.addListener(
												'click',
												function() {
													var infowindow = new google.maps.InfoWindow(
															{
																content : xhttp.responseText
															});
													infowindow
															.open(map, marker);
													map
															.addListener(
																	'click',
																	function() {
																		infowindow
																				.close();
																	});

												});
							}
						};
						xhttp.open("POST", "GetMarkerContent", true);
						xhttp.setRequestHeader("Content-type",
								"application/x-www-form-urlencoded");
						xhttp.send("deptId=" + departmentId);
					}
				</script>
				<script
					src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGhDi7ORrjolFUGwq9-SksQl5D1MZuohI&signed_in=true&callback=initMap"
					async defer>
					
				</script>
				</div>
			<div class="col-md-3">
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br>
				<h3 class="text-center">Detayları görüntüleyebilmek için üye
					girişi yapmanız gerekmektedir.</h3>
				<div class="col-md-2"></div>
				<div class="col-md-4">
					<button type="button" class="btn btn-primary pull-left " onclick="location.href='/HaritaUzerindeIsArama/userhome.jsp';">Giriş
						Yap</button>
				</div>

				<div class="col-md-4">
					<button type="button" class="btn btn-primary pull-right" onclick="location.href='/HaritaUzerindeIsArama/signupasuser.jsp';">Üye
						Ol</button>
				</div>
			</div>


		</div>
	</div>



</body>
</html>