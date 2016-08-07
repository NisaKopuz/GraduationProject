<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html lang="tr">
<head>
<title>İşveren Şube Kayıt</title>
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

#map {
	display: block;
	height: 300px;
	width: 100%;
}
</style>
</head>

<body>
	
	<%
			
			String username=(String) session.getAttribute("username");
			if(username == null)
			{
			
		
				response.sendRedirect("/HaritaUzerindeIsArama/WelcomePage.jsp");
			}
				
	%>
	
	<script>
	$(document).ready(function(){
	    $('[data-toggle="tooltip"]').tooltip(); 
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

				<a class="navbar-brand" href="/HaritaUzerindeIsArama/employerhome.jsp">
					<img alt="İşBurada" src="/HaritaUzerindeIsArama/images/logo.png"
					width="25" height="25">
				</a>

			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="/HaritaUzerindeIsArama/employerhome.jsp">İşBurada</a></li>
				</ul>


				<ul class="nav navbar-nav navbar-right">
					<li><a href="/HaritaUzerindeIsArama/addadvert.jsp"><span class="glyphicon glyphicon-pencil"></span>
							İlan Ver</a></li>
					<li><a href="/HaritaUzerindeIsArama/myadverts.jsp"><span class="glyphicon glyphicon-th-list"></span>
							İlanlarım</a></li>
					<li><a href="/HaritaUzerindeIsArama/myreferencesemployer.jsp"><span class="glyphicon glyphicon-list-alt"></span>
							Başvurular</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"> <span
							class="glyphicon glyphicon-user"></span> <%=username%>
							<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li class="active"><a href="/HaritaUzerindeIsArama/adddepartment.jsp"><span class="glyphicon glyphicon-plus"></span>
									Şube Ekle</a></li>
							<li><a href="FirmProfile.jsp?companyUserName=<%=request.getRemoteUser()%>"><span class="glyphicon glyphicon-user"></span>
									Profilim</a></li> 
							<li><a href="/HaritaUzerindeIsArama/myaccount.jsp"><span class="glyphicon glyphicon-cog"></span>
									Hesabım</a></li>
						</ul></li>
					<li><a href="/HaritaUzerindeIsArama/logout.jsp"><span
							class="glyphicon glyphicon-log-out"></span> Çıkış Yap</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<h2 class="text-center text-primary">Şube Bilgileri</h2>
	<br>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2"></div>
			<form class="form-horizontal" role="form" action="adddepartment"
				method="POST">
				<div class="col-md-8">

					<div class="form-group">
						<label class="control-label col-sm-2" for="departmentname">Şube
							Adı :</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="departmentname"
								name="departmentname"
								placeholder="örn. Carrefour Kozyatağı Şubesi" required>
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-2" for="enterAddress"> </label>
						<div class="col-sm-8">
							<input class="form-control" id="address" type="text" placeholder="Bir adres girip 'Bul' a basın.. ">
						</div>
						<div class="col-sm-2">
							<input class="form-control" type="button" value="Bul" onclick="codeAddress()">
						</div>
					</div>
					<input type="hidden" id="coords" name="coords"> 
					<input type="hidden" id="town" name="town">
					<input type="hidden" id="city" name="city"><br>
					<div id="map"></div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-8">
							<br>
							<br>
							<button data-toggle="tooltip" title="Hooray!" id="subbutton" name="subbutton" type="submit" class="btn btn-primary btn-block" disabled>Şubeyi
								Kaydet</button>
						</div>
					</div>

				</div>
			</form>



		</div>
	</div>

	<script>
		var map;
		var geocoder;

		/**
		 * The CenterControl adds a control to the map that recenters the map on Chicago.
		 * This constructor takes the control DIV as an argument.
		 * @constructor
		 */
		function CenterControl(controlDiv, map) {

			// Set CSS for the control border.
			var controlUI = document.createElement('div');
			controlUI.style.backgroundColor = '#fff';
			controlUI.style.border = '2px solid #fff';
			controlUI.style.borderRadius = '3px';
			controlUI.style.boxShadow = '0 2px 6px rgba(0,0,0,.3)';
			controlUI.style.cursor = 'pointer';
			controlUI.style.marginBottom = '22px';
			controlUI.style.textAlign = 'center';
			controlUI.title = 'Click to recenter the map';
			controlDiv.appendChild(controlUI);

			// Set CSS for the control interior.
			var controlText = document.createElement('div');
			controlText.style.color = 'rgb(25,25,25)';
			controlText.style.fontFamily = 'Roboto,Arial,sans-serif';
			controlText.style.fontSize = '16px';
			controlText.style.lineHeight = '38px';
			controlText.style.paddingLeft = '5px';
			controlText.style.paddingRight = '5px';
			controlText.innerHTML = 'Konumumu Bul';
			controlUI.appendChild(controlText);

			// Setup the click event listeners: simply set the map to Chicago.

			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(function(position) {
					pos = {
						lat : position.coords.latitude,
						lng : position.coords.longitude
					};

					controlUI.addEventListener('click', function() {
						map.setCenter(pos);
						map.setZoom(18);
					});

				}, handleLocationError);
			} else {
				// Browser doesn't support Geolocation
				handleLocationError(error);
			}
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

		function geocodeLatLng(input) {
			var geocoder = new google.maps.Geocoder;
			//  var input = document.getElementById('latlng').value;
				var latlngStr = input.split(',', 2);
			  var latlng = {lat: parseFloat(latlngStr[0]), lng: parseFloat(latlngStr[1])};
			  geocoder.geocode({'location': latlng}, function(results, status) {
			    if (status === google.maps.GeocoderStatus.OK) {
			        results.forEach(function(element){
			          element.address_components.forEach(function(element2){
			            element2.types.forEach(function(element3){
			              switch(element3){
			                case 'postal_code':
			                	document.getElementById("city").value = element2.short_name.substring(0,2);
			                	console.log(element2.short_name.substring(0,2));
			                  break;
			                case 'administrative_area_level_2':
			                	  document.getElementById("town").value = element2.short_name;
			                	  console.log( element2.short_name);
			                  break;
			              }
			            })
			          });
			        });
			        
			      }else {
			      window.alert('Geocoder failed due to: ' + status);
			    }
			  });
			}
		
		function codeAddress() {
		    var address = document.getElementById("address").value;
		    geocoder.geocode( { 'address': address}, function(results, status) {
		      if (status == google.maps.GeocoderStatus.OK) {
		        map.setCenter(results[0].geometry.location);
		        map.setZoom(18);
		        geocodeLatLng();
// 		        var marker = new google.maps.Marker({
// 		            map: map,
// 		            position: results[0].geometry.location
// 		        });
		      } else {
		        alert("Geocode was not successful for the following reason: " + status);
		      }
		    });
		  }
		
		function initMap() {
			geocoder = new google.maps.Geocoder();
			map = new google.maps.Map(document.getElementById('map'), {
				center : {
					lat : 41.0055005,
					lng : 28.731986
				},
				zoom : 10
			});
			
			

			// Create the DIV to hold the control and call the CenterControl() constructor
			// passing in this DIV.
			var centerControlDiv = document.createElement('div');
			var centerControl = new CenterControl(centerControlDiv, map);

			centerControlDiv.index = 1;
			map.controls[google.maps.ControlPosition.TOP_CENTER]
					.push(centerControlDiv);

			var marker;

			function placeMarker(location) {
				document.getElementById("subbutton").disabled = false;
				if (marker) {
					marker.setPosition(location);
				} else {
					marker = new google.maps.Marker({
						position : location,
						map : map
					});
				}
			}

			google.maps.event.addListener(map, 'click', function(event) {
				var markerPosition = event.latLng;
				var mLat = markerPosition.lat();
				var mLng = markerPosition.lng();

				document.getElementById("coords").value = mLat.toString() + ";"
						+ mLng.toString();
				placeMarker(event.latLng);
				geocodeLatLng(mLat.toString()+ ","+ mLng.toString());
				
			});
		}
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGhDi7ORrjolFUGwq9-SksQl5D1MZuohI&signed_in=true&callback=initMap"
		async defer>
		
	</script>
</body>
</html>
