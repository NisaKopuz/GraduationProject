<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="tr">
<head>
<title>İşBurada.com</title>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="docs/css/bootstrap-3.3.2.min.css"
	type="text/css">
<link rel="stylesheet" href="docs/css/bootstrap-example.css"
	type="text/css">
<link rel="stylesheet" href="docs/css/prettify.css" type="text/css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.9/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.9/js/bootstrap-dialog.min.js"></script>


<link rel="stylesheet" href="dist/css/bootstrap-multiselect.css"
	type="text/css">
<script type="text/javascript" src="dist/js/bootstrap-multiselect.js"></script>

<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css">

<script
	src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.5.1/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.5.0/lang/tr.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js"></script>
<script src="//platform.linkedin.com/in.js" type="text/javascript">
	lang: tr_TR
</script>
<style>
body {
	padding-top: 50px; /* Whatever the height of your navbar is; the
                             default is 50px */
}



#map {
	display: block;
	height: 550px;
}

#filterbuttons {
height: 430px;
max-height: 430px;
width: 300px;
max-width: 300px;
}

select {
  
   padding: 0 0 0 20px;
}

#filterheader {
 	background-color: #afd3c9;
 	 border-top-style: inset;
 	  border-right-style: inset;
 text-align: center;
  	border: none;
    margin: 1px;
    width:280px;
    height:80px
    
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

<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();  
});
</script>
<body onload="controlbonusfeature(); ControlErrorMessage();">
	
	<%
		String username = request.getRemoteUser();
		session.setAttribute("username", username);
	%>
	
	<script type="text/javascript">

	function stopRKey(evt) { 
	  var evt = (evt) ? evt : ((event) ? event : null); 
	  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
	  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;} 
	} 

	document.onkeypress = stopRKey; 
	
	
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
	
	
	

<% if(session.getAttribute("AddPhoto")!=null){
	if((Boolean)session.getAttribute("AddPhoto")){ %>
	<script>

	 $('#myModal').modal('show');
	 </script>
	
<% } }%>

	
	
	
	<script>
	
	
	function closeButton() {
		
	}
	
	function fileName(){
	var str =  document.getElementById('file').value;
	var n = str.lastIndexOf('\\');
	var result = str.substring(n + 1);
	document.getElementById('chosenFilePath').innerHTML = result;
	}
	
	 function ControlErrorMessage()
     {
		
    	   var errormessage = "<%= session.getAttribute("errorMessage") %>"
           if((errormessage.localeCompare(null))!=0)
          	 {
        	
           $(function () 
        		   
        		   {
        	   var $textAndPic = $('<div ></div>');
               $textAndPic.append('Başvurunuz başarıyla gerçekleştirilmiştir. <br /><br/>');
               $textAndPic.append('<div style="text-align: center"><img align="middle" src="./images/correct.jpg" /></div>');
                   var dialog = new BootstrapDialog({
                	   title: 'Bilgilendirme Mesajı',
                       message: $textAndPic
                   });
                   dialog.realize();
                   $('#modal-container').append(dialog.getModal());
                   dialog.open();
               });

           <% session.removeAttribute("errorMessage"); %>
     	 }
    	
    	 
     }
	 
	 
	function controlbonusfeature(){
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			
			if(xhttp.responseText=="0") {
		
				 $("#dvBonusFeatureAlert").show();
				
			
			
			}
			
			
		}
	};
	xhttp.open("POST", "BonusFeatureExist", true);
	xhttp.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded");
	xhttp.send("username=" + '<%=username%>');

	}
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
//	}
	}
	
	function geocodeCity(cityid) {
		switch (parseInt(cityid)) {
		case 1:
			map.setCenter(new google.maps.LatLng(37,35.321333));
			break;
		case 2:
			map.setCenter(new google.maps.LatLng(37.764751,38.278561));
			break;
		case 3:
			map.setCenter(new google.maps.LatLng(38.750714,30.556692));
			break;
		case 4:
			map.setCenter(new google.maps.LatLng(39.626922,43021596));
			break;
		case 5:
			map.setCenter(new google.maps.LatLng(40.64991,35.83532));
			break;
		case 6:
			map.setCenter(new google.maps.LatLng(39.92077,32.85411));
			break;
		case 7:
			map.setCenter(new google.maps.LatLng(36.88414,30.70563));
			break;
		case 8:
			map.setCenter(new google.maps.LatLng(41.18277,41.818292));
			break;
		case 9:
			map.setCenter(new google.maps.LatLng(37.856041,27.841631));
			break;
		case 10:
			map.setCenter(new google.maps.LatLng(39.648369,27.88261));
			break;
		case 11:
			map.setCenter(new google.maps.LatLng(40.056656,30.066524));
			break;
		case 12:
			map.setCenter(new google.maps.LatLng(39.062635,40.76961));
			break;
		case 13:
			map.setCenter(new google.maps.LatLng(38.393799,42.12318));
			break;
		case 14:
			map.setCenter(new google.maps.LatLng(40.575977,31.578809));
			break;
		case 15:
			map.setCenter(new google.maps.LatLng(37.461267,30.066524));
			break;
		case 16:
			map.setCenter(new google.maps.LatLng(40.266864,29.063448));
			break;
		case 17:
			map.setCenter(new google.maps.LatLng(40.155312,26.41416));
			break;
		case 18:
			map.setCenter(new google.maps.LatLng(40.601343,33.613421));
			break;
		case 19:
			map.setCenter(new google.maps.LatLng(40.550556,34.955556));
			break;
		case 20:
			map.setCenter(new google.maps.LatLng(37.77652,29.08639));
			break;
		case 21:
			map.setCenter(new google.maps.LatLng(37.91441,40.230629));
			break;
		case 22:
			map.setCenter(new google.maps.LatLng(41.681808,26.562269));
			break;
		case 23:
			map.setCenter(new google.maps.LatLng(38.680969,39.226398));
			break;
		case 24:
			map.setCenter(new google.maps.LatLng(39.75,39.5));
			break;
		case 25:
			map.setCenter(new google.maps.LatLng(39.9,41.27));
			break;
		case 26:
			map.setCenter(new google.maps.LatLng(39.776667,30.520556));
			break;
		case 27:
			map.setCenter(new google.maps.LatLng(37.06622,37.38332));
			break;
		case 28:
			map.setCenter(new google.maps.LatLng(40.912811,38.38953));
			break;
		case 29:
			map.setCenter(new google.maps.LatLng(40.438588,39.508556));
			break;
		case 30:
			map.setCenter(new google.maps.LatLng(37.583333,43.733333));
			break;
		case 31:
			map.setCenter(new google.maps.LatLng(36.401849,36.34981));
			break;
		case 32:
			map.setCenter(new google.maps.LatLng(37.764771,30.556561));
			break;
		case 33:
		case 34:
			map.setCenter(new google.maps.LatLng(41.00527,28.97696));
			break;
		case 35:
			map.setCenter(new google.maps.LatLng(38.41885,27.12872));
			break;
		case 36:
			map.setCenter(new google.maps.LatLng(40.616667,43.1));
			break;
		case 37:
			map.setCenter(new google.maps.LatLng(41.38871,33.78273));
			break;
		case 38:
			map.setCenter(new google.maps.LatLng(38.73122,35.478729));
			break;
		case 39:
			map.setCenter(new google.maps.LatLng(41.733333,27.216667));
			break;
		case 40:
			map.setCenter(new google.maps.LatLng(39.14249,34.17091));
			break;
		case 41:
			map.setCenter(new google.maps.LatLng(40.85327,29.88152));
			break;
		case 42:
			map.setCenter(new google.maps.LatLng(37.866667,32.483333));
			break;
		case 43:
			map.setCenter(new google.maps.LatLng(39.416667,29.983333));
			break;
		case 44:
			map.setCenter(new google.maps.LatLng(38.35519,38.30946));
			break;
		case 45:
			map.setCenter(new google.maps.LatLng(38.619099,27.428921));
			break;
		case 46:
			map.setCenter(new google.maps.LatLng(37.585831,36.937149));
			break;
		case 47:
			map.setCenter(new google.maps.LatLng(37.321163,40.724477));
			break;
		case 48:
			map.setCenter(new google.maps.LatLng(37.215278,28.363611));
			break;
		case 49:
			map.setCenter(new google.maps.LatLng(38.946189,41.753893));
			break;
		case 50:
			map.setCenter(new google.maps.LatLng(38.69394,34.685651));
			break;
		case 51:
			map.setCenter(new google.maps.LatLng(37.966667,34.683333));
			break;
		case 52:
			map.setCenter(new google.maps.LatLng(40.983879,37.876411));
			break;
		case 53:
			map.setCenter(new google.maps.LatLng(41.02005,40.523449));
			break;
		case 54:
			map.setCenter(new google.maps.LatLng(40.693997,30.435763));
			break;
		case 55:
			map.setCenter(new google.maps.LatLng(41.292782,36.33128));
			break;
		case 56:
			map.setCenter(new google.maps.LatLng(37.933333,41.95));
			break;
		case 57:
			map.setCenter(new google.maps.LatLng(42.02314,35.153069));
			break;
		case 58:
			map.setCenter(new google.maps.LatLng(39.747662,37.017879));
			break;
		case 59:
			map.setCenter(new google.maps.LatLng(40.983333,27.516667));
			break;
		case 60:
			map.setCenter(new google.maps.LatLng(40.316667,36.55));
			break;
		case 61:
			map.setCenter(new google.maps.LatLng(41.00145,39.7178));
			break;
		case 62:
			map.setCenter(new google.maps.LatLng(39.307355,39.438778));
			break;
		case 63:
			map.setCenter(new google.maps.LatLng(37.159149,38.796909));
			break;
		case 64:
			map.setCenter(new google.maps.LatLng(38.682301,29.40819));
			break;
		case 65:
			map.setCenter(new google.maps.LatLng(38.48914,43.40889));
			break;
		case 66:
			map.setCenter(new google.maps.LatLng(39.818081,34.81469));
			break;
		case 67:
			map.setCenter(new google.maps.LatLng(41.456409,31.798731));
			break;
		case 68:
			map.setCenter(new google.maps.LatLng(38.36869,34.03698));
			break;
		case 69:
			map.setCenter(new google.maps.LatLng(40.255169,40.22488));
			break;
		case 70:
			map.setCenter(new google.maps.LatLng(37.17593,33.228748));
			break;
		case 71:
			map.setCenter(new google.maps.LatLng(39.846821,33.515251));
			break;
		case 72:
			map.setCenter(new google.maps.LatLng(37.881168,41.13509));
			break;
		case 73:
			map.setCenter(new google.maps.LatLng(37.418748,42.491834));
			break;
		case 74:
			map.setCenter(new google.maps.LatLng(41.581051,32.460979));
			break;
		case 75:
			map.setCenter(new google.maps.LatLng(41.110481,42.702171));
			break;
		case 76:
			map.setCenter(new google.maps.LatLng(39.887984,44.004836));
			break;
		case 77:
			map.setCenter(new google.maps.LatLng(40.65,29.266667));
			break;
		case 78:
			map.setCenter(new google.maps.LatLng(41.2061,32.62035));
			break;
		case 79:
			map.setCenter(new google.maps.LatLng(36.718399,37.12122));
			break;
		case 80:
			map.setCenter(new google.maps.LatLng(37.213026,36.176261));
			break;
		case 81:
			map.setCenter(new google.maps.LatLng(40.843849,31.15654));
			break;

		}
	}
	 function filter(){
	
		 var sectorvalues=[];
		 var jobfieldvalues=[];
		 var cityvalues=[];
		 var positiontypevalues=[];
		 var positionlevelvalues=[];
		 var educationlevelvalues=[];
		 var netsalaryvalues=[];
		 var postingdatevalues=[];
		 var companyvalues;
		 var expvalue;
		 var notexpvalue;
		 var expsamevalue;
		 
		 var sector=document.getElementById("sector-multiple-selected");
		 var jobfield=document.getElementById("jobfield-multiple-selected");
		 var city=document.getElementById("city");
		 var company=document.getElementById("company");
		 var positiontype=document.getElementById("positiontype-multiple-selected");
		 var positionlevel=document.getElementById("positionlevel-multiple-selected");
		 var educationlevel=document.getElementById("educationlevel-multiple-selected");
		 var postingdate=document.getElementById("postingdate");
		 var netsalary=document.getElementById("netsalary");
		 var exp=document.getElementById("exp");
		 var notexp=document.getElementById("notexp");
		 var expsame=document.getElementById("expsame");

		 
		 
		 //Tecrübeli
		 
		 if(exp.checked)
			 {
			 expvalue=exp.value;
			 }
		 
		 //Tecrübesiz
		 
		 if(notexp.checked)
			 {
			 notexpvalue=notexp.value;
			 }
		 
		 //Farketmez
		 	 if(expsame.checked)
			 {
		 		expsamevalue=expsame.value;
			 }
		 
		 //Sector
		
		
		 for (var i = 0; i < sector.options.length; i++) {
		     if(sector.options[i].selected){
		    	 sectorvalues.push(sector.options[i].value);
		      }
		  }
		 
		 
		 ///Jobfield
		 
		
			 for (var i = 0; i < jobfield.options.length; i++) {
			     if(jobfield.options[i].selected){
			    	 jobfieldvalues.push(jobfield.options[i].value);
			      }
			  }
			 
		//City
		 
		 
			 for (var i = 0; i < city.options.length; i++) {
			     if(city.options[i].selected){
			    	 cityvalues.push(city.options[i].value);
			      }
			  }
			 
		//PositionType
			 for (var i = 0; i < positiontype.options.length; i++) {
			     if(positiontype.options[i].selected){
			    	 positiontypevalues.push(positiontype.options[i].value);
			      }
			  }
		
		 //PositionLevel
		 
		 	 for (var i = 0; i < positionlevel.options.length; i++) {
			     if(positionlevel.options[i].selected){
			    	 positionlevelvalues.push(positionlevel.options[i].value);
			      }
			  }
		 
		 //PostingDate
		 
		 
		  	 for (var i = 0; i < postingdate.options.length; i++) {
			     if(postingdate.options[i].selected){
			    	 postingdatevalues.push(postingdate.options[i].value);
			      }
			  }
		 
		 	//EducationLevel
		 	 for (var i = 0; i < educationlevel.options.length; i++) {
			     if(educationlevel.options[i].selected){
			    	 educationlevelvalues.push(educationlevel.options[i].value);
			      }
			  }
		 	
		 	//NetSalary
		 	
		 	 for (var i = 0; i < netsalary.options.length; i++) {
			     if(netsalary.options[i].selected){
			    	 netsalaryvalues.push(netsalary.options[i].value);
			      }
			  }
		 	
		//Company
		
			companyvalues=company.value;
		
	
		 
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					if(Object.keys(xhttp.responseText).length <= 2){
						map.setCenter(new google.maps.LatLng(38.9034838,34.1116001));
						map.setZoom(5);
						$('#filterResult').modal('show');
						document.getElementById("adnumber").innerHTML =  "0  tane ilan bulundu. ";
						clearMarkers();
					}
					else if(xhttp.responseText != "") {
						clearMarkers();
						var i = 0;
					$.each(JSON.parse(xhttp.responseText), function(key, value) {
						createMarker(value);
						i++;
					});
					geocodeCity(cityvalues[0]);
					map.setZoom(10);
					document.getElementById("adnumber").innerHTML = "<strong>" + i + "  tane </strong>ilan bulundu. ";
					}
				}
			};
			xhttp.open("POST", "Filter", true);
			xhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xhttp.send("sector=" + sectorvalues + "&jobfield=" + jobfieldvalues + "&city=" + cityvalues+ "&positiontype=" + positiontypevalues+ "&positionlevel=" + positionlevelvalues + "&educationlevel=" + educationlevelvalues+ "&netsalary=" + netsalaryvalues+ "&company=" + companyvalues+ "&exp=" + expvalue + "&notexp=" + notexpvalue+ "&expsame=" + expsamevalue+ "&postingdate=" + postingdatevalues);
		}
	 
	 function clearMarkers() {
		  setMapOnAll(null);
		}
	 
	 function setMapOnAll(map) {
		  for (var i = 0; i < markers.length; i++) {
		    markers[i].setMap(map);
		  }
		}
	 
	 
	 </script>
	 
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-inner">
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
                    
			 <ul  class="nav nav-center">
			 
			
          <li><div  style="display: none" id="dvBonusFeatureAlert"><a data-toggle="tooltip" data-placement="bottom" data-original-title="Bu özellik sizin başvurularda avantaj kazanmasını sağlar."  style="color:red; background:black" href="/HaritaUzerindeIsArama/bonusfeature.jsp"><span   class="glyphicon glyphicon-exclamation-sign"></span>  Özgeçmişinizi Özetleyin!	 </a></div></li>
				
       		 </ul>
       	
				
				
				
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
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row"  >
			<div class="col-md-3">
				<div class="container-fluid">
				
					<div class="row center-block text-center " >
					
						
						<div class="center-block text-center" id="filterheader"> 
						<h4><strong><br>İlan Filtrele </strong></h4>
						<p id="adnumber"></p> 
						
						</div>
						<div class="form-group center-block text-center ">
						<div class="pre-scrollable" id="filterbuttons">
   			<button  type="button" class="btns" data-toggle="collapse" data-target="#demo">Firma Sektörü</button>
  						<div style="align:center" id="demo" class="collapse">
							<br/>
								<select  class="form-control" multiple="multiple"
											id="sector-multiple-selected" name="sector-multiple-selected">
       										<option value="100">Arşiv Yönetimi ve Saklama</option>
											<option value="200">Atık Yönetimi ve Geri Dönüşüm</option>
											<option value="300">Basım-Yayın</option>
											<option value="301">&nbsp;&nbsp;Elektronik
												Yayıncılık</option>
											<option value="302">&nbsp;&nbsp;Kitabevi</option>
											<option value="303">&nbsp;&nbsp;Matbaacılık</option>
											<option value="304">&nbsp;&nbsp;Dijital Baskı</option>
											<option value="305">&nbsp;&nbsp;Süreli Yayınlar</option>
											<option value="306">&nbsp;&nbsp;Yayıncılık</option>
											<option value="400">Bilişim</option>
											<option value="401">&nbsp;&nbsp;Bilişim Danışmanlığı</option>
											<option value="402">&nbsp;&nbsp;Elektronik Kart
												Sistemleri</option>
											<option value="403">&nbsp;&nbsp;İnternet</option>
											<option value="404">&nbsp;&nbsp;Makine ve Ekipmanlar</option>
											<option value="405">&nbsp;&nbsp;Servisler</option>
											<option value="406">&nbsp;&nbsp;Tüketici Ürünler</option>
											<option value="407">&nbsp;&nbsp;Veri Merkezi</option>
											<option value="408">&nbsp;&nbsp;Yazılım</option>
											<option value="500">Çevre</option>
											<option value="501">&nbsp;&nbsp;Atık Yönetimi</option>
											<option value="502">&nbsp;&nbsp;Çevre Danışmanlığı</option>
											<option value="503">&nbsp;&nbsp;Çevre Düzenleme</option>
											<option value="504">&nbsp;&nbsp;Çevre Laboratuvarı</option>
											<option value="505">&nbsp;&nbsp;İş Sağlığı ve
												Güvenliği</option>
											<option value="600">Danışmanlık</option>
											<option value="601">&nbsp;&nbsp;Avukatlık ve Hukuki
												Danışmanlık</option>
											<option value="602">&nbsp;&nbsp;Bilişim Danışmanlığı</option>
											<option value="603">&nbsp;&nbsp;Çevre Danışmanlığı</option>
											<option value="604">&nbsp;&nbsp;Eğitim Danışmanlığı</option>
											<option value="605">&nbsp;&nbsp;Finans ve Yatırım
												Danışmanlığı</option>
											<option value="606">&nbsp;&nbsp;İnsan Kaynakları
												Danışmanlığı</option>
											<option value="607">&nbsp;&nbsp;Pazarlama
												Danışmanlığı</option>
											<option value="608">&nbsp;&nbsp;Yönetim Danışmanlığı</option>
											<option value="700">Dayanıklı Tüketim Ürünleri</option>
											<option value="800">Denizcilik</option>
											<option value="801">&nbsp;&nbsp;Deniz Taşımacılığı</option>
											<option value="802">&nbsp;&nbsp;Deniz Ürünleri</option>
											<option value="803">&nbsp;&nbsp;Gemi Acentaları</option>
											<option value="804">&nbsp;&nbsp;Liman İşletmeleri ve
												Hizmetleri</option>
											<option value="805">&nbsp;&nbsp;Tersane / Gemi İnşa</option>
											<option>Diğer</option>
											<option value="901">&nbsp;&nbsp; Fotoğrafçılık</option>
											<option value="902">&nbsp;&nbsp; Harita - Planma</option>
											<option value="903">&nbsp;&nbsp; Hediyelik Eşya</option>
											<option value="904">&nbsp;&nbsp; Kamu / Devlet</option>
											<option value="905">&nbsp;&nbsp; Konsolosluk</option>
											<option value="906">&nbsp;&nbsp; Oyuncak - Oyun
												Grupları ve Sistemleri</option>
											<option value="907">&nbsp;&nbsp; Saatçilik</option>
											<option value="908">&nbsp;&nbsp; Spor</option>
											<option value="1000">Eğitim</option>
											<option value="1001">&nbsp;&nbsp; Çocuk Gelişim ve
												Eğitimi</option>
											<option value="1002">&nbsp;&nbsp; Eğitim
												Danışmanlığı</option>
											<option value="1003">&nbsp;&nbsp; Eğitim Kurumları</option>
											<option value="1004">&nbsp;&nbsp;&nbsp;&nbsp;
												Dershane ve Kurslar</option>
											<option value="1005">&nbsp;&nbsp;&nbsp;&nbsp;
												Okullar</option>
											<option value="1006">&nbsp;&nbsp;&nbsp;&nbsp;
												Üniversiteler</option>
											<option value="1007">&nbsp;&nbsp; Öğrenci Yurtları</option>
											<option value="1008">&nbsp;&nbsp; Yurtdışı Eğitim
												Danışmanlığı</option>
											<option value="1100">Eğlence - Kültür - Sanat</option>
											<option value="1101">&nbsp;&nbsp; Eğlence Hizmetleri</option>
											<option value="1102">&nbsp;&nbsp; Eğlence Tesisleri</option>
											<option value="1103">&nbsp;&nbsp;&nbsp;&nbsp;
												Alışveriş Merkezleri</option>
											<option value="1104">&nbsp;&nbsp;&nbsp;&nbsp;
												Restaurant-Bar-Cafe</option>
											<option value="1105">&nbsp;&nbsp; Müzik ve Müzik
												Organizasyon</option>
											<option value="1106">&nbsp;&nbsp; Sinema - Tiyatro</option>
											<option value="1200">Elektrik & Elektronik</option>
											<option value="1201">&nbsp;&nbsp; Akü - Pil -
												Batarya</option>
											<option value="1202">&nbsp;&nbsp; Aydınlatma</option>
											<option value="1203">&nbsp;&nbsp; Barkod</option>
											<option value="1204">&nbsp;&nbsp; Elektrik -
												Elektronik Malzemeleri</option>
											<option value="1205">&nbsp;&nbsp; Elektrik Üretim ve
												Dağıtımı</option>
											<option value="1206">&nbsp;&nbsp; Elektrikli ve
												Elektronik Aletler</option>
											<option value="1207">&nbsp;&nbsp; Isıtma,
												Havalandırma ve Klima</option>
											<option value="1208">&nbsp;&nbsp; Işık,Görüntü ve
												Ses Sistemleri</option>
											<option value="1209">&nbsp;&nbsp; Kablo ve Tel</option>
											<option value="1210">&nbsp;&nbsp; Otomasyon</option>
											<option value="1211">&nbsp;&nbsp; Ölçü ve Kontrol
												Sistemleri</option>
											<option value="1212">&nbsp;&nbsp; Proje Taahhüt</option>
											<option value="1300">Enerji</option>
											<option value="1301">&nbsp;&nbsp; Enerji Üretim ve
												Dağıtım</option>
											<option value="1302">&nbsp;&nbsp; Gaz Sanayi</option>
											<option value="1303">&nbsp;&nbsp;&nbsp;&nbsp;
												Doğalgaz</option>
											<option value="1304">&nbsp;&nbsp; Jeneratör</option>
											<option value="1305">&nbsp;&nbsp; Petrol ve Ürünleri</option>
											<option value="1306">&nbsp;&nbsp; Yenilebilir Enerji</option>
											<option value="1400">Ev Eşyaları</option>
											<option value="1401">&nbsp;&nbsp; Beyaz Eşyalar</option>
											<option value="1402">&nbsp;&nbsp; Elektrikli Ev
												Aletleri</option>
											<option value="1403">&nbsp;&nbsp;Ev Tekstili</option>
											<option value="1404">&nbsp;&nbsp;Halı / Kilim</option>
											<option value="1405">&nbsp;&nbsp;Mutfak Gereçleri</option>
											<option value="1406">&nbsp;&nbsp;Yatak ve Yan
												Ürünleri</option>
											<option value="1407">&nbsp;&nbsp;Züccaciye</option>
											<option value="1500">Finans - Ekonomi</option>
											<option value="1501">&nbsp;&nbsp;Bankacılık</option>
											<option value="1502">&nbsp;&nbsp;Borsa</option>
											<option value="1503">&nbsp;&nbsp;Faktoring</option>
											<option value="1504">&nbsp;&nbsp; Finans ve Yatırım
												Danışmanlığı</option>
											<option value="1505">&nbsp;&nbsp;Leasing / Finansal
												Kiralama</option>
											<option value="1506">&nbsp;&nbsp;Yatırım</option>
											<option value="1600">Gıda</option>
											<option value="1601">&nbsp;&nbsp;Bebek Besinleri</option>
											<option value="1602">&nbsp;&nbsp;Bisküvi, Çikolata
												ve Şekerleme</option>
											<option value="1603">&nbsp;&nbsp;Catering</option>
											<option value="1604">&nbsp;&nbsp;Çay Sanayi</option>
											<option value="1605">&nbsp;&nbsp;Deniz Ürünleri</option>
											<option value="1606">&nbsp;&nbsp;Et ve Et Ürünleri</option>
											<option value="1607">&nbsp;&nbsp;Gıda Hizmetleri</option>
											<option value="1608">&nbsp;&nbsp;Gıda Makine /
												Ekipmanları</option>
											<option value="1609">&nbsp;&nbsp;İçecek</option>
											<option value="1610">&nbsp;&nbsp;&nbsp;&nbsp;
												Alkollü İçecek</option>
											<option value="1611">&nbsp;&nbsp;Kuruyemiş Sektörü</option>
											<option value="1612">&nbsp;&nbsp;Pastane</option>
											<option value="1613">&nbsp;&nbsp;Restaurant - Cafe -
												Bar</option>
											<option value="1614">&nbsp;&nbsp;Su Ürünleri</option>
											<option value="1615">&nbsp;&nbsp;Süt ve Süt Ürünleri</option>
											<option value="1616">&nbsp;&nbsp;Tavukçuluk ve
												Yumurta</option>
											<option value="1617">&nbsp;&nbsp;Un ve Unlu
												Mamülleri</option>
											<option value="1700">Güvenlik</option>
											<option value="1701">&nbsp;&nbsp;Elektronik Güvenlik
												Sistemleri</option>
											<option value="1702">&nbsp;&nbsp;Güvenlik Hizmetleri</option>
											<option value="1703">&nbsp;&nbsp;İş Güvenliği
												Ekipmanları</option>
											<option value="1800">Havacılık</option>
											<option value="1801">&nbsp;&nbsp;Hava Taşımacılığı</option>
											<option value="1802">&nbsp;&nbsp;Uzay Teknolojileri</option>
											<option value="1900">Hayvancılık</option>
											<option value="1901">&nbsp;&nbsp;Arıcılık</option>
											<option value="1902">&nbsp;&nbsp;Balıkçılık</option>
											<option value="1903">&nbsp;&nbsp;Evcil Hayvan</option>
											<option value="1904">&nbsp;&nbsp;Küçükbaş ve
												Büyükbaş Hayvancılık</option>
											<option value="1905">&nbsp;&nbsp;Tavukçuluk ve
												Yumurta</option>
											<option value="1906">&nbsp;&nbsp; Yem Sanayi</option>
											<option value="1907">Hızlı Tüketim Malları</option>
											<option value="2000">Hizmet</option>
											<option value="2001">&nbsp;&nbsp;Araştırma
												Hizmetleri</option>
											<option value="2002">&nbsp;&nbsp;Çağrı Merkezi
												Hizmetleri</option>
											<option value="2003">&nbsp;&nbsp;Çeviri Hizmetleri</option>
											<option value="2004">&nbsp;&nbsp;Dağıtım Hizmetleri</option>
											<option value="2005">&nbsp;&nbsp;Denetim Hizmetleri</option>
											<option value="2006">&nbsp;&nbsp;Eğlence Hizmetleri</option>
											<option value="2007">&nbsp;&nbsp;Gayrımenkul, Emlak
												İşleri</option>
											<option value="2008">&nbsp;&nbsp;&nbsp;&nbsp; Emlak
												Geliştirme</option>
											<option value="2009">&nbsp;&nbsp;&nbsp;&nbsp;
												Gayrımenkul Değerleme</option>
											<option value="2010">&nbsp;&nbsp;Gıda Hizmetleri</option>
											<option value="2011">&nbsp;&nbsp;Gümrük Hizmetleri</option>
											<option value="2012">&nbsp;&nbsp;Mali Müşavirlik -
												Muhasebe</option>
											<option value="2013">&nbsp;&nbsp;Marka - Patent
												Hizmetleri</option>
											<option value="2014">&nbsp;&nbsp;Medya Takip
												Hizmetleri</option>
											<option value="2015">&nbsp;&nbsp;Mühendislik
												Hizmetleri</option>
											<option value="2016">&nbsp;&nbsp;Network Proje
												Hizmetleri</option>
											<option value="2017">&nbsp;&nbsp;Ortak Sağlık
												Güvenlik Birimi</option>
											<option value="2018">&nbsp;&nbsp;Oto Kiralama</option>
											<option value="2019">&nbsp;&nbsp;Sağlık Hizmetleri</option>
											<option value="2020">&nbsp;&nbsp;Temizlik Hizmetleri</option>
											<option value="2100">İletişim Danışmanlığı</option>
											<option value="2200">Kaynak ve Kesme Ekipmanları</option>
											<option value="2300">Kimya</option>
											<option value="2301">&nbsp;&nbsp;Boya Sanayi</option>
											<option value="2302">&nbsp;&nbsp;&nbsp;&nbsp;
												Tekstil Boya ve Kimyasalları</option>
											<option value="2303">&nbsp;&nbsp;Dermokozmetik</option>
											<option value="2304">&nbsp;&nbsp;Kimya Sanayi</option>
											<option value="2305">&nbsp;&nbsp; Kozmetik</option>
											<option value="2306">&nbsp;&nbsp;Lastik / Kauçuk</option>
											<option value="2307">&nbsp;&nbsp;&nbsp;&nbsp; Oto
												Lastiği</option>
											<option value="2308">&nbsp;&nbsp;Plastik ve Ürünleri</option>
											<option value="2309">&nbsp;&nbsp;Temizlik
												Malzemeleri</option>
											<option value="2310">&nbsp;&nbsp;Yapı Kimyasalları</option>
											<option value="2400">Maden ve Metal Sanayi</option>
											<option value="2401">&nbsp;&nbsp;Değerli Madenler ve
												Mamülleri / Kuyumculuk</option>
											<option value="2402">&nbsp;&nbsp;&nbsp;&nbsp;
												Mücevherat</option>
											<option value="2403">&nbsp;&nbsp;Hırdavat Sanayi</option>
											<option value="2404">&nbsp;&nbsp;Madencilik -
												Metalurji</option>
											<option value="2405">&nbsp;&nbsp;Mermer Sanayi</option>
											<option value="2406">&nbsp;&nbsp;Metal Sanayi</option>
											<option value="2407">&nbsp;&nbsp;&nbsp;&nbsp;
												Alüminyum</option>
											<option value="2408">&nbsp;&nbsp;&nbsp;&nbsp;Çelik
												Montaj İmalat</option>
											<option value="2409">&nbsp;&nbsp;&nbsp;&nbsp; Demir-
												Çelik</option>
											<option value="2410">&nbsp;&nbsp;Mineraller</option>
											<option value="2500">Medya</option>
											<option value="2501">&nbsp;&nbsp;Basın ve Haber
												Ajansları</option>
											<option value="2502">&nbsp;&nbsp;Medya Satınalma
												Firmaları</option>
											<option value="2503">&nbsp;&nbsp;Medya Takip
												Hizmetler</option>
											<option value="2504">&nbsp;&nbsp;Prodüksiyon</option>
											<option value="2505">&nbsp;&nbsp;Radyo - TV</option>
											<option value="2506">&nbsp;&nbsp;Reklam Satış
												Firmaları</option>
											<option value="2507">&nbsp;&nbsp;Seri İlan Ajansları</option>
											<option value="2600">Mobilya & Aksesuar</option>
											<option value="2601">&nbsp;&nbsp;Aksesuar</option>
											<option value="2602">&nbsp;&nbsp;Bahçe Mobilyaları</option>
											<option value="2603">&nbsp;&nbsp;Ev Mobilyaları</option>
											<option value="2604">&nbsp;&nbsp;Ofis Mobilyaları</option>
											<option value="2605">&nbsp;&nbsp;Şehir Mobilyaları</option>
											<option value="2700">Ofis / Büro Malzemeleri</option>
											<option value="2701">&nbsp;&nbsp;Büro Makineleri</option>
											<option value="2702">&nbsp;&nbsp;Kırtasiye</option>
											<option value="2703">&nbsp;&nbsp;Ofis Mobilyası ve
												Dekorasyonu</option>
											<option value="2800">Orman Ürünleri</option>
											<option value="2801">&nbsp;&nbsp;Ağaç - Kereste</option>
											<option value="2802">&nbsp;&nbsp;Kağıt ve Selüloz
												Sanayi</option>
											<option value="2900">Otomotiv</option>
											<option value="2901">&nbsp;&nbsp;Bisiklet ve
												Motosiklet</option>
											<option value="2902">&nbsp;&nbsp;Oto Aksesuarları</option>
											<option value="2903">&nbsp;&nbsp;Oto Kiralama</option>
											<option value="2904">&nbsp;&nbsp;Oto Lastiği</option>
											<option value="2905">&nbsp;&nbsp;Oto Yedek Parça ve
												Yan Sanayi</option>
											<option value="2906">&nbsp;&nbsp;Oto Yetkili
												Satıcıları</option>
											<option value="2907">&nbsp;&nbsp;Tamir, Bakım,
												Servis ve Ekipmanları</option>
											<option value="3000">Perakende</option>
											<option value="3100">Reklam ve Tanıtım</option>
											<option value="3101">&nbsp;&nbsp;Açık Hava
												Reklamcılığı</option>
											<option value="3102">&nbsp;&nbsp;Film, Grafik ve
												Renk Ayrım İşleri</option>
											<option value="3103">&nbsp;&nbsp;Fuarcılık</option>
											<option value="3104">&nbsp;&nbsp;Halkla İlişkiler</option>
											<option value="3105">&nbsp;&nbsp;Manken Ajansları</option>
											<option value="3106">&nbsp;&nbsp;Organizasyon ve
												Animasyon Hizmetleri</option>
											<option value="3107">&nbsp;&nbsp;Promosyon Ürünleri</option>
											<option value="3108">&nbsp;&nbsp;Reklamcılık</option>
											<option value="3109">&nbsp;&nbsp;Teşhir Malzemeleri</option>
											<option value="3200">Sağlık</option>
											<option value="3201">&nbsp;&nbsp;Bakım, Diyet ve
												Güzellik Merkezleri</option>
											<option value="3202">&nbsp;&nbsp;Dermokozmetik</option>
											<option value="3203">&nbsp;&nbsp;İlaç Sanayi</option>
											<option value="3204">&nbsp;&nbsp;&nbsp;&nbsp;
												Biyoteknoloji</option>
											<option value="3205">&nbsp;&nbsp;&nbsp;&nbsp; Ecza
												Depoları ve Eczaneler</option>
											<option value="3206">&nbsp;&nbsp;İş Güvenliği ve
												Sağlığı</option>
											<option value="3207">&nbsp;&nbsp;Medikal Ürünler</option>
											<option value="3208">&nbsp;&nbsp;Optik</option>
											<option value="3209">&nbsp;&nbsp;Sağlık Hizmetleri</option>
											<option value="3210">&nbsp;&nbsp;&nbsp;&nbsp;
												Ambulans Servisleri</option>
											<option value="3211">&nbsp;&nbsp;&nbsp;&nbsp; Evde
												Bakım Hizmetleri</option>
											<option value="3212">&nbsp;&nbsp;Sağlık Kuruluşları</option>
											<option value="3213">&nbsp;&nbsp;&nbsp;&nbsp;
												Hastaneler</option>
											<option value="3214">&nbsp;&nbsp;&nbsp;&nbsp;
												Klinikler</option>
											<option value="3215">&nbsp;&nbsp;&nbsp;&nbsp;
												Veterinerler</option>
											<option value="3216">&nbsp;&nbsp;Tıbbi Cihaz ve
												Malzemeler</option>
											<option value="3217">&nbsp;&nbsp;Tıbbi Laboratuarlar</option>
											<option value="3300">Sigortacılık</option>
											<option value="3301">&nbsp;&nbsp;Elementer</option>
											<option value="3302">&nbsp;&nbsp;Hayat ve Emeklilik</option>
											<option value="3303">&nbsp;&nbsp;Sağlık</option>
											<option value="3400">Tarım / Ziraat</option>
											<option value="3401">&nbsp;&nbsp;Bağcılık</option>
											<option value="3402">&nbsp;&nbsp;Bitki Besleme
												Ürünleri Üretimi</option>
											<option value="3403">&nbsp;&nbsp;Çay Sanayi</option>
											<option value="3404">&nbsp;&nbsp;Fidancılık -
												Çiçekçilik</option>
											<option value="3405">&nbsp;&nbsp;Gübre Üretimi</option>
											<option value="3406">&nbsp;&nbsp;Seracılık</option>
											<option value="3407">&nbsp;&nbsp;Tarım Araç ve
												Ekipmanları</option>
											<option value="3408">&nbsp;&nbsp;Tarım İlaçları</option>
											<option value="3409">&nbsp;&nbsp;Tarım Ürünleri</option>
											<option value="3410">&nbsp;&nbsp;Tütün Sanayi</option>
											<option value="3500">Taşımacılık</option>
											<option value="3501">&nbsp;&nbsp;Demiryolu
												Taşımacılığı</option>
											<option value="3502">&nbsp;&nbsp;Deniz Taşımacılığı</option>
											<option value="3503">&nbsp;&nbsp;Depo - Antrepo</option>
											<option value="3504">&nbsp;&nbsp;Gümrük Hizmetleri</option>
											<option value="3505">&nbsp;&nbsp;Hava Taşımacılığı</option>
											<option value="3506">&nbsp;&nbsp;Karayolu
												Taşımacılığı</option>
											<option value="3507">&nbsp;&nbsp;Kargo - Kurye</option>
											<option value="3508">&nbsp;&nbsp;Lojistik</option>
											<option value="3509">&nbsp;&nbsp;Nakliye</option>
											<option value="3510">&nbsp;&nbsp;Otobüs Şirketleri</option>
											<option value="3511">&nbsp;&nbsp;Sevkiyat
												(Forwarding)</option>
											<option value="3512">&nbsp;&nbsp;Uluslararası
												Taşımacılık ve Nakliyat</option>
											<option value="3600">Tekstil</option>
											<option value="3601">&nbsp;&nbsp;Aksesuar</option>
											<option value="3602">&nbsp;&nbsp;Deri</option>
											<option value="3603">&nbsp;&nbsp;Ev Tekstili</option>
											<option value="3604">&nbsp;&nbsp;Giyim</option>
											<option value="3605">&nbsp;&nbsp;&nbsp;&nbsp;
												Ayakkabıcılık</option>
											<option value="3606">&nbsp;&nbsp;&nbsp;&nbsp; Çorap
												Sanayi</option>
											<option value="3607">&nbsp;&nbsp;&nbsp;&nbsp; Hazır
												Giyim</option>
											<option value="3608">&nbsp;&nbsp;&nbsp;&nbsp;
												Mağazacılık (Tekstil)</option>
											<option value="3609">&nbsp;&nbsp;&nbsp;&nbsp; Moda
												Tasarım</option>
											<option value="3610">&nbsp;&nbsp;Kumaş & İplik</option>
											<option value="3611">&nbsp;&nbsp;Tekstil Boya ve
												Kimyasalları</option>
											<option value="3612">&nbsp;&nbsp;Tekstil Makineleri
												ve Parçaları</option>
											<option value="3700">Telekomünikasyon</option>
											<option value="3701">&nbsp;&nbsp;Çağrı Merkezi Ürün
												ve Hizmetleri</option>
											<option value="3702">&nbsp;&nbsp;Makine ve
												Ekipmanlar</option>
											<option value="3703">&nbsp;&nbsp;Network Proje
												Hizmetleri</option>
											<option value="3704">&nbsp;&nbsp;Servis Sağlayıcılar</option>
											<option value="3705">&nbsp;&nbsp;Tüketici Ürünleri</option>
											<option value="3706">&nbsp;&nbsp;Cep Telefonları ve
												Aksesuarları</option>
											<option value="3800">Ticaret</option>
											<option value="3801">&nbsp;&nbsp;Alışveriş Merkezi</option>
											<option value="3802">&nbsp;&nbsp;E-ticaret</option>
											<option value="3803">&nbsp;&nbsp;İç Ticaret</option>
											<option value="3804">&nbsp;&nbsp;İthalat - İhracat</option>
											<option value="3805">&nbsp;&nbsp;Mağazacılık
												(Ticaret)</option>
											<option value="3806">&nbsp;&nbsp;Market</option>
											<option value="3900">Topluluklar</option>
											<option value="3901">&nbsp;&nbsp;Birlikler</option>
											<option value="3902">&nbsp;&nbsp;Dernekler</option>
											<option value="3903">&nbsp;&nbsp;Holding / Şirketler
												Grubu</option>
											<option value="3904">&nbsp;&nbsp;Sivil Toplum
												Kuruluşları</option>
											<option value="3905">&nbsp;&nbsp;Vakıflar</option>
											<option value="4000">Turizm</option>
											<option value="4001">&nbsp;&nbsp;Konaklama ve
												Otelcilik</option>
											<option value="4002">&nbsp;&nbsp;Otel Ekipmanları</option>
											<option value="4003">&nbsp;&nbsp;Seyahat Acentaları</option>
											<option value="4004">&nbsp;&nbsp;Yiyecek Hizmetleri</option>
												
												</select>
											
							</div>
						
							<br/>
						<!-- Departman -->
						
						<button  type="button" class="btns" data-toggle="collapse" data-target="#demo1">Departman</button>
  						<div style="align:center" id="demo1" class="collapse">
							<br/>
								<select  class="form-control" multiple="multiple"
											id="jobfield-multiple-selected" name="jobfield-multiple-selected">

												<option value="1">Satış-Pazarlama</option>
												<option value="2">Eğitim-Öğretim</option>
												<option value="3">Branş Öğretmenliği</option>
												<option value="4">Yiyecek-İçecek Hizmetleri</option>
												<option value="5">Mühendislik</option>
												<option value="6">Mali İşler-Finansman</option>
												<option value="7">Operasyon</option>
												<option value="8">Müşteri İlişkileri-Crm</option>
												<option value="9">Üretim</option>
												<option value="10">Yabancı Dil Öğretmenliği</option>
												<option value="11">Bilgi Teknolojileri</option>
												<option value="12">Satış Danışmanlığı -
													Tezgahtarlık</option>
												<option value="13">Bakım-Servis-Onarım</option>
												<option value="14">Satış-Hizmet Sonrası Destek</option>
												<option value="15">Mutfak</option>
												<option value="16">İnsan Kaynakları</option>
												<option value="17">Şantiye</option>
												<option value="18">Servis</option>
												<option value="19">Araştırma-Geliştirme</option>
												<option value="20">Sağlık Hizmetleri</option>
												<option value="21">Restoran-Bar</option>
												<option value="22">Ön Büro-Resepsiyon-Rezervasyon</option>
												<option value="23">Kasa</option>
												<option value="24">Sekreterya-Ofis Yönetimi</option>
												<option value="25">Kurs-Dershane</option>
												<option value="26">Kat Hizmetleri</option>
												<option value="27">Güvenlik Hizmetleri</option>
												<option value="28">Halkla İlişkiler</option>
												<option value="29">Yazılım Uygulama Ve Geliştirme</option>
												<option value="30">Depo</option>
												<option value="31">Reyon</option>
												<option value="32">Lojistik-Malzeme Yönetimi</option>
												<option value="33">Kafe-Bar</option>
												<option value="34">Proje Yönetimi</option>
												<option value="35">Satınalma</option>
												<option value="36">Kalite Kontrol-Güvence</option>
												<option value="37">Sistem Destek Ve Yönetimi</option>
												<option value="38">İdari İşler</option>
												<option value="39">Doktor - Hekim</option>
												<option value="40">Teknik İşler</option>
												<option value="41">İş Geliştirme</option>
												<option value="42">Genel Yönetim</option>
												<option value="43">Eğitim Danışmanlığı</option>
												<option value="44">Merchandising</option>
												<option value="45">Tanıtım</option>
												<option value="46">Proje Satış</option>
												<option value="47">Reklam</option>
												<option value="48">İş Sağlığı ve Güvenliği</option>
												<option value="49">Tasarım</option>
												<option value="50">Sevkiyat</option>
												<option value="51">Elektrik Tesisat</option>
												<option value="52">Merkez Ofis</option>
												<option value="53">Gizli Müşteri</option>
												<option value="54">Hemşirelik</option>
												<option value="55">Grafik Tasarım - Uygulama</option>
												<option value="56">Zincir Mağazalar Yönetimi</option>
												<option value="57">Anaokulu Öğretmenliği</option>
												<option value="58">Web Tasarımı</option>
												<option value="59">Mimarlık Hizmetleri</option>
												<option value="60">İthalat-İhracat - Dış Ticaret</option>
												<option value="61">Gayrimenkul Danışmanlığı</option>
												<option value="62">Arşiv-Dökümantasyon</option>
												<option value="63">İnce İnşaat</option>
												<option value="64">Medya Planlaması</option>
												<option value="65">Depo-Ambar-Antrepo</option>
												<option value="66">Veri Tabanı Tasarım Ve Yönetimi</option>
												<option value="67">Laboratuvar</option>
												<option value="68">Teknik</option>
												<option value="69">Medya Planlama - Satış</option>
												<option value="70">Nakliye</option>
												<option value="71">Danışmanlık Hizmetleri</option>
												<option value="72">Üretim Planlama</option>
												<option value="73">Mekanik Tesisat</option>
												<option value="74">Proses Kontrol</option>
												<option value="75">Tıbbi Mümessillik</option>
												<option value="76">Sınıf Öğretmenliği</option>
												<option value="77">Etüt Öğretmenliği</option>
												<option value="78">Bayi Takip Ve Geliştirme</option>
												<option value="79">Şoför - Ulaştırma</option>
												<option value="80">Hukuk</option>
												<option value="81">Ağ Yönetimi</option>
												<option value="82">Montaj</option>
												<option value="83">Yazılım Danışmanlığı</option>
												<option value="84">Konuk Ağırlama</option>
												<option value="85">Hisse Senedi Yönetimi</option>
												<option value="86">Bireysel Bankacılık</option>
												<option value="87">Pres</option>
												<option value="88">Harita</option>
												<option value="89">Fon Yönetimi</option>
												<option value="90">Ürün Yönetimi-Geliştirme</option>
												<option value="91">Spor - Antrenman</option>
												<option value="92">Çözüm Satış</option>
												<option value="93">Eczane</option>
												<option value="94">Öğrenci İşleri</option>
												<option value="95">Bölge Ofisi</option>
												<option value="96">Gayrimenkul Değerleme</option>
												<option value="97">Paketleme</option>
												<option value="98">Enjeksiyon</option>
												<option value="99">Kaba İnşaat</option>
												<option value="100">Stratejik Planlama</option>
												<option value="101">Finansal Danışmanlık</option>
												<option value="102">Kişisel Bakım</option>
												<option value="103">Öğretim Görevlisi</option>
												<option value="104">Model Tasarım</option>
												<option value="105">Rehberlik-Psikolojik
													Danışmanlık</option>
												<option value="106">Alternatif Dağıtım Kanalları</option>
												<option value="107">İnşaat-Emlak İşleri</option>
												<option value="108">Hazine</option>
												<option value="109">Haberleşme-İletişim</option>
												<option value="110">Meslek Öğretmenliği</option>
												<option value="111">Yayın</option>
												<option value="112">Kaynak</option>
												<option value="113">Donanım Montaj</option>
												<option value="114">Portföy Yönetimi</option>
												<option value="115">Son Kontrol</option>
												<option value="116">İç Kontrol-Teftiş</option>
												<option value="117">Hakediş-Kesin Hesap</option>
												<option value="118">Test</option>
												<option value="119">Banka-Finans Risk Yönetimi</option>
												<option value="120">Formülasyon</option>
												<option value="121">Anket-Saha Araştırma</option>
												<option value="122">Hamur Hazırlama</option>
												<option value="123">Tedarik Zinciri Yönetimi</option>
												<option value="124">Model Kalıp</option>
												<option value="125">Sigorta Hizmetleri</option>
												<option value="126">Organizasyon</option>
												<option value="127">İhale</option>
												<option value="128">Stabilite</option>
												<option value="129">Veri Girişi</option>
												<option value="130">Kalıp Üretim</option>
												<option value="131">Döküm</option>
												<option value="132">Tasarım Değerlendirme</option>
												<option value="133">Şube İşlemleri</option>
												<option value="134">Kurye Teslimat</option>
												<option value="135">Medikal</option>
												<option value="136">Kara</option>
												<option value="137">Kredi Kartları</option>
												<option value="138">İç Denetim</option>
												<option value="139">Araştırma Görevlisi</option>
												<option value="140">Banket</option>
												<option value="141">Muhabirlik</option>
												<option value="142">Görsel Tasarım</option>
												<option value="143">Editörlük</option>
												<option value="144">Yazı İşleri-Haber</option>
												<option value="145">Kesim</option>
												<option value="146">Kağıt Makinesi</option>
												<option value="147">Baskı</option>
												<option value="148">Konsept Tasarım Geliştirme</option>
												<option value="149">Ürün Müdürü - Yöneticisi</option>
												<option value="150">Revir</option>
												<option value="151">Prodüksiyon Hizmetleri</option>
												<option value="152">Gece Amiri</option>
												<option value="153">Aktivite-Animasyon</option>
												<option value="154">Dağıtım - Tiraj Planlama</option>
												<option value="155">Bayi İlişkileri</option>
												<option value="156">İş Makinesi Operatörlüğü</option>
												<option value="157">Kullanıcı Eğitimi</option>
												<option value="158">Yükleme</option>
												<option value="159">Klinik Araştırmalar</option>
												<option value="160">Web Sitesi İçerik Yönetimi</option>
												<option value="161">Dikim</option>
												<option value="162">Kamera - Fotoğraf</option>
												<option value="163">Görsel-Vitrin Düzenleme</option>
												<option value="164">Sigorta Risk Yönetimi</option>
												<option value="165">Laboratuvar Teknisyenliği</option>
												<option value="166">Diyet - Beslenme</option>
												<option value="167">Biyomedikal Teknisyeni</option>
												<option value="168">Anestezi Teknisyenliği</option>
												<option value="169">Ajans Prodüktörlüğü</option>
												<option value="170">Ölçme Değerlendirme</option>
												<option value="171">Oyunculuk</option>
												<option value="172">Rehberlik-Tur Operatörlüğü</option>
												<option value="173">Krediler Ve İstihbarat</option>
												<option value="174">Hasta Danışma</option>
												<option value="175">Fuar</option>
												<option value="176">Filo Yönetimi</option>
												<option value="177">Masaj</option>
												<option value="178">Gişe-Fuaye-Büfe</option>
												<option value="179">Fason Takip</option>
												<option value="180">Forklift Operatörlüğü</option>
												<option value="181">Cnc Operatörlüğü</option>
												<option value="182">Farmakovijilans</option>
												<option value="183">Yolcu Hizmetleri</option>
												<option value="184">Haber Takip</option>
												<option value="185">Vardiya Şefliği</option>
												<option value="186">Son İşlemler</option>
												<option value="187">İplik Büküm - Çözgü</option>
												<option value="188">Fırınlama</option>
												<option value="189">Boya - Serigrafi</option>
												<option value="190">Ticari Bankacılık</option>
												<option value="191">Ses-Işık-Kamera</option>
												<option value="192">Kurgu - Montaj</option>
												<option value="193">Promosyon - Eşantiyon</option>
												<option value="194">Bölge Müdürlüğü</option>
												<option value="195">Fizyoterapi</option>
												<option value="196">Diş Teknisyenliği</option>
												<option value="197">Diş Hekimliği</option>
												<option value="198">Restorasyon</option>
												<option value="199">Sanat Yönetmenliği</option>
												<option value="200">Grafik Operatörlüğü</option>
												<option value="201">Prova Mankenliği</option>
												<option value="202">Sağlık Memuru (Ön Büro)</option>
												<option value="203">Bilet Satış</option>
												<option value="204">Demiryolu</option>
												<option value="205">Kurumsal Bankacılık</option>
												<option value="206">İlaç Ruhsatlandırma</option>
												<option value="207">Basın Danışmanlığı</option>
												<option value="208">Eczacılık</option>
												<option value="209">Çevre Sistemleri</option>
												<option value="210">Çevirmen-Tercüman</option>
												<option value="211">Baskı</option>
												<option value="212">Yazarlık</option>
												<option value="213">İstihbarat</option>
												<option value="214">Dizgi - Mizanpaj</option>
												<option value="215">Yönetmenlik</option>
												<option value="216">Transmisyon</option>
												<option value="217">Spikerlik</option>
												<option value="218">Reji</option>
												<option value="219">Prodüksiyon - Yapım</option>
												<option value="220">Yapı Ruhsatlandırma</option>
												<option value="221">Sırlama</option>
												<option value="222">Fermentasyon</option>
												<option value="223">Dokuma</option>
												<option value="224">Deri İşleme</option>
												<option value="225">Boya - Terbiye</option>
												<option value="226">Üfleme</option>
												<option value="227">Tütün Eksperliği</option>
												<option value="228">Dublaj-Altyazı</option>
												<option value="229">Ses - Işık Teknisyenliği</option>
												<option value="230">Dublaj - Seslendirme</option>
												<option value="231">Artistik Hizmetler</option>
												<option value="232">Sahne - Dekor - Kostüm</option>
												<option value="233">Ambalaj Tasarımı</option>
												<option value="234">Zemin Güçlendirme</option>
												<option value="235">Sosyal Hizmet</option>
												<option value="236">Senaryo</option>
												<option value="237">Resim-Heykel</option>
												<option value="238">Müzisyenlik</option>
												<option value="239">Fotoğrafçılık</option>
												<option value="240">Bale-Opera</option>
												<option value="241">Sanatsal Faaliyetler</option>
												<option value="242">Radyoloji Teknisyenliği</option>
												<option value="243">Radyasyon Onkoloji Teknisyeni</option>
												<option value="244">Ameliyathane Teknisyenliği</option>
												<option value="245">Trafik</option>
												<option value="246">Metin Yazarlığı</option>
												<option value="247">Kreatif Direktörlük</option>
												<option value="248">Pilotaj Hizmetleri</option>
												<option value="249">Paramedik - Acil Yardım</option>
												<option value="250">Kargo Takip</option>
												<option value="251">Kambiyo</option>
												<option value="252">İade</option>
												<option value="253">Cankurtaran</option>
												<option value="254">Numune</option>
												<option value="255">Mevzuat-Uyum</option>
												<option value="256">Hava</option>
												<option value="257">Deniz</option>
												<option value="258">Koreografi</option>
												<option value="259">Kobi Bankacılığı</option>
												<option value="260">Karikatür</option>
												<option value="261">Metod Geliştirme-Validasyon</option>
												<option value="262">Kalibrasyon</option>
												<option value="263">İstatistik</option>
												<option value="264">Menajerlik</option>
												<option value="265">Gümrük</option>
												<option value="266">Forwarder</option>
												<option value="267">Cad-Cam Operatörlüğü</option>
												<option value="268">Arsa Değerlendirme</option>
						
						</select>
						</div>
							<br/>


						<!-- Şehir -->
						
							<button type="button" class="btns" data-toggle="collapse" data-target="#demo2">Şehir</button>
  									<div id="demo2" class="collapse">
				<br/>
								<div class="input-group-btn">
									<select style="width:200px" class="form-control center-block text-center" id="city">
										<option value="">Bir şehir seçiniz.</option>
											<option value="1">ADANA</option>
											<option value="2">ADIYAMAN</option>
											<option value="3">AFYON</option>
											<option value="4">AĞRI</option>
											<option value="5">AMASYA</option>
											<option value="6">ANKARA</option>
											<option value="7">ANTALYA</option>
											<option value="8">ARTVİN</option>
											<option value="9">AYDIN</option>
											<option value="10">BALIKESİR</option>
											<option value="11">BİLECİK</option>
											<option value="12">BİNGÖL</option>
											<option value="13">BİTLİS</option>
											<option value="14">BOLU</option>
											<option value="15">BURDUR</option>
											<option value="16">BURSA</option>
											<option value="17">ÇANAKKALE</option>
											<option value="18">ÇANKIRI</option>
											<option value="19">ÇORUM</option>
											<option value="20">DENİZLİ</option>
											<option value="21">DİYARBAKIR</option>
											<option value="22">EDİRNE</option>
											<option value="23">ELAZIĞ</option>
											<option value="24">ERZİNCAN</option>
											<option value="25">ERZURUM</option>
											<option value="26">ESKİŞEHİR</option>
											<option value="27">GAZİANTEP</option>
											<option value="28">GİRESUN</option>
											<option value="29">GÜMÜŞHANE</option>
											<option value="30">HAKKARİ</option>
											<option value="31">HATAY</option>
											<option value="32">ISPARTA</option>
											<option value="33">İÇEL</option>
											<option value="34">İSTANBUL</option>
											<option value="35">İZMİR</option>
											<option value="36">KARS</option>
											<option value="37">KASTAMONU</option>
											<option value="38">KAYSERİ</option>
											<option value="39">KIRKLARELİ</option>
											<option value="40">KIRŞEHİR</option>
											<option value="41">KOCAELİ</option>
											<option value="42">KONYA</option>
											<option value="43">KÜTAHYA</option>
											<option value="44">MALATYA</option>
											<option value="45">MANİSA</option>
											<option value="46">KAHRAMANMARAŞ</option>
											<option value="47">MARDİN</option>
											<option value="48">MUĞLA</option>
											<option value="49">MUŞ</option>
											<option value="50">NEVŞEHİR</option>
											<option value="51">NİĞDE</option>
											<option value="52">ORDU</option>
											<option value="53">RİZE</option>
											<option value="54">SAKARYA</option>
											<option value="55">SAMSUN</option>
											<option value="56">SİİRT</option>
											<option value="57">SİNOP</option>
											<option value="58">SİVAS</option>
											<option value="59">TEKİRDAĞ</option>
											<option value="60">TOKAT</option>
											<option value="61">TRABZON</option>
											<option value="62">TUNCELİ</option>
											<option value="63">ŞANLIURFA</option>
											<option value="64">UŞAK</option>
											<option value="65">VAN</option>
											<option value="66">YOZGAT</option>
											<option value="67">ZONGULDAK</option>
											<option value="68">AKSARAY</option>
											<option value="69">BAYBURT</option>
											<option value="70">KARAMAN</option>
											<option value="71">KIRIKKALE</option>
											<option value="72">BATMAN</option>
											<option value="73">ŞIRNAK</option>
											<option value="74">BARTIN</option>
											<option value="75">ARDAHAN</option>
											<option value="76">IĞDIR</option>
											<option value="77">YALOVA</option>
											<option value="78">KARABÜK</option>
											<option value="79">KİLİS</option>
											<option value="80">OSMANİYE</option>
											<option value="81">DÜZCE</option>
									</select>
								</div>
								<br/>
							</div>
					

					<!-- 
						<!-- Semt 
						<div class="form-group">
							<label class="control-label col-sm-4">Semt:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="district">
							</div>
						</div>
						-->
						
					
						<!-- Şirket Adı -->
						
						<button type="button" class="btns" data-toggle="collapse" data-target="#demo3">Şirket Adı</button>
  						
  							<div id="demo3" class="collapse">
							<br/>
								<input style="width:200px" name="company" type="text" class="form-control center-block text-center" id="company">
								<br/>
							</div>
					
						<!-- İş Türü   -->
						
						
								
						<button type="button" class="btns" data-toggle="collapse" data-target="#demo4">Çalışma Şekli</button>
  							<div id="demo4" class="collapse">
							<br/>
					
								<select class="form-control" multiple="multiple"
											id="positiontype-multiple-selected" name="positiontype-multiple-selected">
						
						
									<option value="1">Sürekli/Tam Zamanlı</option>
									<option value="2">Yarı Zamanlı/Part Time</option>
									<option value="3">Dönemsel/Proje Bazlı</option>
									<option value="4">Stajyer</option>
					
								</select>								
							
							</div>
							<br/>
					
						<!-- Pozisyon Seviyesi  -->
								
						<button type="button" class="btns" data-toggle="collapse" data-target="#demo5">Pozisyon Seviyesi</button>
  							<div id="demo5" class="collapse">
							<br/>
					
								<select class="form-control" multiple="multiple"
											id="positionlevel-multiple-selected" name="positionlevel-multiple-selected">
								
										<option value="1">Üst Düzey Yönetici</option>
											<option value="2">Orta Düzey Yönetici</option>
											<option value="3">Yönetici Adayı</option>
											<option value="4">Uzman</option>
											<option value="5">Uzman Yardımcısı</option>
											<option value="6">Yeni Başlayan</option>
											<option value="7">Stajyer</option>
											<option value="8">Eleman</option>
											<option value="9">Hizmet Personeli</option>
											<option value="10">İşçi</option>
											<option value="11">Serbest/Freelancer</option>
					
								</select>								
						
							</div>
						
							<br/>
						<!-- Yayınlanma Tarihi  -->
						
							<button type="button" class="btns" data-toggle="collapse" data-target="#demo6">Yayınlama Tarihi</button>
  								<div id="demo6" class="collapse">
								<br/>
								<div class="input-group-btn">
									<select style="width:200px" class="form-control center-block text-center" id="postingdate" name="postiongdate">
										<option value="">Tarihi seçiniz.</option>
										<option value="0">Herhangi Bir Zaman</option>
										<option value="1">Bugün</option>
										<option value="2">Dün</option>
										<option value="3">Son 3 Gün</option>
										<option value="7">Son 7 Gün</option>
										<option value="14">Son 14 Gün</option>
										<option value="30">Son 30 Gün</option>
									</select>
								</div>
								<br/>
							</div>
					
						
						<!-- Eğitim Seviyesi-->
						
							<button type="button" class="btns" data-toggle="collapse" data-target="#demo7">Eğitim Seviyesi</button>
  								<div id="demo7" class="collapse">
								<br/>
								<div class="input-group-btn">
								
								<select class="form-control" multiple="multiple"
											id="educationlevel-multiple-selected" name="educationlevel-multiple-selected">
										<option value="0">İlköğretim-Öğrenci</option>
										<option value="1">İlköğretim-Mezun</option>
										<option value="2">Lise-Öğrenci</option>
										<option value="3">Lise-Mezun</option>
										<option value="4">Meslek Yüksekokulu-Öğrenci</option>
										<option value="5">Meslek Yüksekokulu-Mezun</option>
										<option value="6">Üniversite-Öğrenci</option>
										<option value="7">Üniversite-Mezun</option>
										<option value="8">YüksekLisans-Öğrenci</option>
										<option value="9">YüksekLisans-Mezun</option>
										<option value="10">Doktora-Öğrenci</option>
										<option value="11">Doktora-Mezun</option>		
									</select>
								</div>
								<br/>
							</div>
				
						
						<!-- Tecrübe -->
							
							<button type="button" class="btns" data-toggle="collapse" data-target="#demo8">İş Tecrübesi</button>
  								<div id="demo8" class="collapse">
								<br/>
								<input type="radio" name="exp" value="1" id="exp" /> Tecrübeli &nbsp;&nbsp;
								<input type="radio" name="notexp" value="1" id="notexp" /> Tecrübesiz &nbsp;&nbsp;
								<input type="radio" name="expsame" value="1" id="expsame" /> Farketmez
								</div>	
						
						<br/>
						<!-- Maaş Aralığı -->
						
							
							<button type="button" class="btns" data-toggle="collapse" data-target="#demo9">Net Maaş Aralığı</button>
  								<div id="demo9" class="collapse">
								<br/>
								<div class="input-group-btn">
									<select style="width:200px" class="form-control center-block text-center" id="netsalary" name="netsalary">
											<option value="">Maaş aralığını seçiniz</option>
											<option value="1">0-1000</option>
											<option value="2">1000-2000</option>
											<option value="3">2000-3000</option>
											<option value="4">3000-4000</option>
											<option value="5">4000-5000</option>
											<option value="6">5000+</option>
										</select>
								
								</div>
							</div>
						
						<br/>
						</div>
						<button type="button" onclick="filter()"
							class="btn btn-primary btn-md pull-right btn-block">Ara</button>
				</div>
				</div>
					</div>	
</div>

			 <div id="map" class="col-md-6"> 

  				
  				
			<script>
  $('#sector-multiple-selected').multiselect({
           enableFiltering: true,
           buttonWidth: '200px',
           nonSelectedText: "Seçiniz",
           numberDisplayed : 0,
           enableCaseInsensitiveFiltering: true,
       
                			});
  
  
  
  $('#positiontype-multiple-selected').multiselect({
      enableFiltering: true,
      buttonWidth: '200px',
      nonSelectedText: "Seçiniz",
      numberDisplayed : 0,
      enableCaseInsensitiveFiltering: true,
     
           			});
  
  
  $('#positionlevel-multiple-selected').multiselect({
      enableFiltering: true,
      buttonWidth: '200px',
      nonSelectedText: "Seçiniz",
      numberDisplayed : 0,
      enableCaseInsensitiveFiltering: true,
      
           			});
  
  $('#educationlevel-multiple-selected').multiselect({
      enableFiltering: true,
      buttonWidth: '200px',
      nonSelectedText: "Seçiniz",
      numberDisplayed : 0,
      enableCaseInsensitiveFiltering: true,

           			});
  $('#jobfield-multiple-selected').multiselect({
      enableFiltering: true,
      buttonWidth: '200px',
      nonSelectedText: "Seçiniz",
      numberDisplayed : 0,
      enableCaseInsensitiveFiltering: true,
      
           			});
       
  </script>

				<script>
		var map;
		var markers = [];
		var modal;
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
		
		function submitReference(adId){
			
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					modal = document.getElementById("myModal").innerHTML;
					document.getElementById("myModal").innerHTML = xhttp.responseText;		
				}
			};
			xhttp.open("POST", "GetSubmitModal", true);
			xhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xhttp.send("adId=" + adId);
		}
		
		function cancelReference() {
			document.getElementById("myModal").innerHTML = modal;	
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
					markers.push(marker);
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
		
	
		
		function commitReference(adId, companyName) {
			var messageUser = document.getElementById("message").value;
			
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					if("1" == xhttp.responseText.toString())
					{
						document.getElementById("details").innerHTML = "";
					}
				}
			};
			xhttp.open("POST", "CommitReference", true);
			xhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xhttp.send("adId=" + adId + "&messageUser=" + messageUser + "&companyName=" + companyName);
		}
		
		function enable_text(status)
		{
			if(status == true) {
				document.getElementById("message").disabled = false;
			} else {
				document.getElementById("message").disabled = true;
			}
		
		}
		function enable_cv(status)
		{
			if(status == true) {
				document.getElementById("file").disabled = false;
			} else {
				document.getElementById("file").disabled = true;
			}
		
		}
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGhDi7ORrjolFUGwq9-SksQl5D1MZuohI&signed_in=true&callback=initMap"
		async defer>
		
	</script>
			</div>
			
			<div id="details" class="col-md-3"></div>
		</div>
	</div>


 <div class="modal fade" id="filterResult" role="dialog">
  <br><br><br>
   <br><br><br>
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
     
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title text-center"><strong>İlan Bulunamadı :(</strong></h4>
        </div>
        <div class="modal-body">
          <p class="text-center">Aradığınız kriterlere uygun ilan bulunamadı.</p>
        </div>
      </div>
    </div>
  </div>

</body>
</html>