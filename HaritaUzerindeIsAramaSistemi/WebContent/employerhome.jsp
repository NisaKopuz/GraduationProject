<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ page import="javax.servlet.http.HttpSession"%>
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
body {
	padding-top: 50px; /* Whatever the height of your navbar is; the
                             default is 50px */
}

#map {
	display: block;
	height: 550px;
}

h3, h5 {
	font-weight: bold;
}

.btn-file {
	position: relative;
	overflow: hidden;
}

.btn-file input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	min-width: 20px;
	min-height: 20px%;
	font-size: 100px;
	text-align: right;
	filter: alpha(opacity = 0);
	opacity: 0;
	outline: none;
	background: white;
	cursor: inherit;
	display: block;
}

.detailBox {

	border: 1px solid #bbb;
}

.titleBox {
	background-color: #fdfdfd;
	padding: 10px;
}

.titleBox label {
	color: #444;
	margin: 0;
	display: inline-block;
}

.commentBox {
	padding: 10px;
	border-top: 1px dotted #bbb;
}

.taskDescription {
	margin-top: 10px 0;
}

.commentList {
	padding: 0;
	list-style: none;
	max-height: 200px;
	overflow: auto;
}

.commentList li {
	margin: 0;
	margin-top: 10px;
}

.commentList li>div {
	display: table-cell;
}

.commenterImage {
	width: 30px;
	margin-right: 5px;
	height: 100%;
	float: left;
}

.commenterImage img {
	width: 100%;
	border-radius: 50%;
}

.commentText p {
	margin: 0;
}

.sub-text {
	color: #aaa;
	font-family: verdana;
	font-size: 11px;
}

.actionBox {
	border-top: 1px dotted #bbb;
	padding: 10px;
}
.nav.nav-center {
    display: inline-block;
    left: 0;
    right: 0;
    margin:0;

}

.navbar-inner{
    text-align:center;
}
</style>
</head>

<body>

	<%
		String username = request.getRemoteUser();
		session.setAttribute("username", username);


	%>

	<script>
		$(document).ready(function() {
			$.get('GetAllDepartmentIdsWithJson', function(responseJson) {
				$.each(responseJson, function(key, value) {

					createMarker(value);
				});
			});
		});
	</script>

	<% if(session.getAttribute("AddPhoto")!=null){
	if((Boolean)session.getAttribute("AddPhoto")){ %>
	<script>

	 $('#myModal').modal('show');
	 </script>
	
<% } }%>

<script>

function getLocation() {
	
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function(position) {
			var pos = {
				lat : position.coords.latitude,
				lng : position.coords.longitude
			};

			var geocoder = new google.maps.Geocoder();
			var latLng = new google.maps.LatLng(pos.lat, pos.lng);

			if (geocoder) {
				geocoder.geocode({
					'latLng' : latLng
				}, function(results, status) {
					if (status == google.maps.GeocoderStatus.OK) {
						document.getElementById("location").value = results[0].address_components[3].long_name;
						document.getElementById("findLocation").disabled = true;
					} else {
						console.log("Geocoding failed: " + status);
					}
				});
			}

		}, function() {
			handleLocationError(true, infoWindow, map.getCenter());
		});
	} else {
		// Browser doesn't support Geolocation
		handleLocationError(false, infoWindow, map.getCenter());
	}
	}

function addComment() {
	
	var adid = document.getElementById("AdId").value;
	var commentText = document.getElementById("commentText").value;
	var location = document.getElementById("location").value;
	
	//if(commentText==""){
//	}else{
	
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			document.getElementById("commentText").value = "";
			document.getElementById("modalList").lastChild.innerHTML = document.getElementById("modalList").lastChild.innerHTML + xhttp.responseText;
		
		}
	};
	xhttp.open("POST", "AddComment", true);
	xhttp.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded");
	xhttp.send("commentText=" + commentText + "&location=" + location +  "&adid=" + adid);	
//}

}
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
					<li><a href="/HaritaUzerindeIsArama/addadvert.jsp"><span
							class="glyphicon glyphicon-pencil"></span> İlan Ver</a></li>
					<li><a href="/HaritaUzerindeIsArama/myadverts.jsp"><span class="glyphicon glyphicon-th-list"></span>
							İlanlarım</a></li>
					<li><a href="/HaritaUzerindeIsArama/myreferencesemployer.jsp"><span class="glyphicon glyphicon-list-alt"></span>
							Başvurular</a></li>

					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"> <span
							class="glyphicon glyphicon-user"></span> <%=request.getRemoteUser()%>
							<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/HaritaUzerindeIsArama/adddepartment.jsp"><span class="glyphicon glyphicon-plus"></span>
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

	<div class="container-fluid">
		<div class="row">
			<div id="map" class="col-md-9"></div>

			<div id="details" class="col-md-3"></div>

		</div>
	</div>

	<script>
		function initMap() {
			map = new google.maps.Map(document.getElementById('map'), {
				center : {
					lat : 41.0055005,
					lng : 28.731986
				},
				zoom : 10
			});

			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(function(position) {
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
						map : map
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
					marker.addListener('click', function() {
						var infowindow = new google.maps.InfoWindow({
							content : xhttp.responseText
						});
						infowindow.open(map, marker);

						infowindow.addListener('closeclick', function() {
							document.getElementById("details").innerHTML = "";
						});

						map.addListener('click', function() {
							infowindow.close();
							document.getElementById("details").innerHTML = "";
						});

					});

				}
			};
			xhttp.open("POST", "GetMarkerContent", true);
			xhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xhttp.send("deptId=" + departmentId);
		}

		function getDetailWindow(adId) {
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					document.getElementById("details").innerHTML = xhttp.responseText;
				}
			};
			xhttp.open("POST", "GetDetail", true);
			xhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xhttp.send("adId=" + adId);
		}
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGhDi7ORrjolFUGwq9-SksQl5D1MZuohI&signed_in=true&callback=initMap"
		async defer>
		
	</script>
</body>
</html>