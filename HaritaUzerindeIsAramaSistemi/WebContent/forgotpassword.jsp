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
<title>İşBurada.com</title>
<style>
body {
	padding-top: 50px; /* Whatever the height of your navbar is; the
                             default is 50px */
}

#map {
	display: block;
	height: 550px;
}

.loginbox {
	-moz-box-shadow: 0 0 2px black;
    -webkit-box-shadow: 0 0 2px black;
    box-shadow: 0 0 2px black;
    background-color: #eee;
}

#loading { visibility: hidden; height: 0px; width: 0px;}
#error { visibility: hidden; height: 0px; width: 0px;}
#success { visibility: hidden; height: 0px; width: 0px;}
</style>

</head>
<body>
<script>
	function forgotPassword() {
		document.getElementById("error").style.visibility = "hidden";
		document.getElementById("error").style.height = "0px";
		document.getElementById("error").style.width = "0px";
		document.getElementById("success").style.visibility = "hidden";
		document.getElementById("success").style.height = "0px";
		document.getElementById("success").style.width = "0px";
		var username = document.getElementById("unm").value;
		var mail = document.getElementById("email").value;
		
		if((username =! "" )&&(mail == "")) {
			document.getElementById("error").style.visibility = "visible";
			document.getElementById("error").style.height = "50px";
			document.getElementById("error").style.width = "50px";
			document.getElementById("loading").style.visibility = "hidden";
			document.getElementById("loading").style.height = "0px";
			document.getElementById("loading").style.width = "0px";
			document.getElementById("errormessage").innerHTML = "Lütfen bütün alanları doldurup tekrar deneyiniz." 
		
		} else {
			document.getElementById("loading").style.visibility = "visible";
			document.getElementById("loading").style.height = "50px";
			document.getElementById("loading").style.width = "50px";
			document.getElementById("errormessage").innerHTML = "Lütfen bekleyiniz...";
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					if(xhttp.responseText == "1") {
						document.getElementById("error").style.visibility = "visible";
						document.getElementById("error").style.height = "50px";
						document.getElementById("error").style.width = "50px";
						document.getElementById("loading").style.visibility = "hidden";
						document.getElementById("loading").style.height = "0px";
						document.getElementById("loading").style.width = "0px";
						document.getElementById("errormessage").innerHTML = "Girdiğiniz bilgilere ait kullanıcı bulunamadı. Lütfen tekrar deneyiniz." 
					}
					if(xhttp.responseText == "0") {
						document.getElementById("loading").style.visibility = "hidden";
						document.getElementById("loading").style.height = "0px";
						document.getElementById("loading").style.width = "0px";
						document.getElementById("success").style.visibility = "visible";
						document.getElementById("success").style.height = "50px";
						document.getElementById("success").style.width = "50px";
						document.getElementById("errormessage").innerHTML = "Şifreniz epostanıza gönderilmiştir. Lütfen e-postanızı kontrol ediniz." 
					}
				}
			};
			xhttp.open("POST", "ForgotPassword", true);
			xhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xhttp.send("uname=" + document.getElementById("unm").value + "&email=" + document.getElementById("email").value);
		}
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
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<br> <br> <br> 
				<div class="loginbox">
				<br> <br>
					<h3 class="text-center">Lütfen kayıt olurken girdiğiniz kullanıcı adınızı ve e-posta adresinizi giriniz.</h3>

					<div class="text-center">
					<img src="https://cdn4.iconfinder.com/data/icons/simplicio/128x128/notification_error.png" id="error" >
					</div>
					<div class="text-center">
					<img src="https://cdn0.iconfinder.com/data/icons/round-ui-icons/128/tick_green.png" id="success">
					</div>
					<div class="text-center">
					<img src="https://promotions.coca-cola.com/etc/designs/promotions/img/loading.gif" id="loading" >
					 </div>
					<h6 class="text-center" id="errormessage"> </h6>
					<br>
					<div class="form-horizontal" >
						<div class="form-group">
							<label class="control-label col-sm-3" for="uname">Kullanıcı
								Adı:</label>
							<div class="col-sm-7">
									<input type="text" name="unm" id="unm" class="form-control" required> 
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3" for="password">E-Posta:</label>
							<div class="col-sm-7">
								<input type="text" name="email" id="email" class="form-control" required>
							</div>
						</div>
						<div class="form-group">
							<div class="text-center">
								
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-5 col-sm-4">
								<button type="button" onclick="forgotPassword()" class="btn btn-primary">Tamam</button>
							</div>
						</div>
						<br> <br>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>