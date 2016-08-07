<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  
<title>Başvurular</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	  
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.9/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.9/js/bootstrap-dialog.min.js"></script>

<style>
body {
	padding-top: 50px; /* Whatever the height of your navbar is; the
                             default is 50px */
}

#map {
	display: block;
	height: 550px;
}
.modal-body {
  height:350px;
  overflow:auto;
}

</style>
</head>

<%
		String username = request.getRemoteUser();
		%>
<body onload="referencesInformation(); ControlErrorMessage(); ">

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
	
	<script type="text/javascript">

	 function ControlErrorMessage()
     {
	
    	   var errormessage = "<%= session.getAttribute("errorMessage") %>"
    	
           if((errormessage.localeCompare(null))!=0)
          	 {
        	
           $(function () 
        		   
        		   {
        	   var $textAndPic = $('<div ></div>');
               $textAndPic.append('Mesajınız başarıyla gönderilmiştir. <br /><br/>');
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
	 
	 function changeStatus(adid)
	 {
		 location.reload(); 
		 $('#'+adid).modal('show');
	 }
function edit(adid,name)
{


var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			
	dcoument.getElementById("closebutton").innerHTML=xhttp.responseText;
			
		}
	};
	xhttp.open("POST", "changeMessageStatusForEmployer", true);
	xhttp.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded");
	xhttp.send("adId=" + encodeURIComponent(adid)+ "&username="+encodeURIComponent(name));
	

}


</script>

	<script>

	function listByBonusFeature(id)
	{
		
	
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
			
				document.getElementById(id).innerHTML = xhttp.responseText;
				
			}
		};
		xhttp.open("POST", "employerReferencesInformationOrderByBonusFeature", true);
		xhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		
		xhttp.send("adid="+id+"&Username=" + '<%=username%>' );
	}

	function referencesEmployerInformation(id) {

	
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
			
			
				document.getElementById(id).innerHTML = xhttp.responseText;
				
			}
		};
		xhttp.open("POST", "employerReferencesInformation", true);
		xhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		
		xhttp.send("adid="+id+"&Username=" + '<%=username%>' );

	}
	function referencesInformation() {

		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
			
				document.getElementById("details").innerHTML = xhttp.responseText;
				
			}
		};
		xhttp.open("POST", "EmployerReferenceAdverts", true);
		xhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		
		xhttp.send("Username=" + '<%=username%>' );

	}
	
	
	function closeModal(id,other)
	{
		$('#'+other).modal('hide');
		referencesEmployerInformation(id);
	
		

	}

	
	
	</script>
	
	
	<script type="text/javascript"
		src="http://js.nicedit.com/nicEdit-latest.js"></script>
	<script type="text/javascript">
		//<![CDATA[
		  function nicedit(k) {
				var string='nick'+k;
			
				
				nicEditors.editors.push(
			        new nicEditor().panelInstance(
			        	
			                document.getElementById(string)
			            )
			        );
       
           }
		//]]>
	</script>
	
	<br/><br/>
	<form method="POST" action="SendMail">
	<div class="container">
	
	<table class="table table-nonfluid" style="margin-left:100px; width: 920px; align:center;">
	
	<thead>
	<tr>
	<th>İlan Yayınlama Tarihi</th>
	<th>Başvuran Sayısı</th>
	<th>İlanın Adı</th>
	
	
	</tr>
	</thead>
	<tbody id="details">
	

	</tbody>
	</table>

	
	</div>
	
	</form>
  

</body>
</html>