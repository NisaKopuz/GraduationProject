<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="tr">
<head>
<title>Üye Kayıt</title>
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

div.submit {
    margin-left:170px;
    }
    .alert-box {
    color:#555;
    border-radius:10px;
    font-family:Tahoma,Geneva,Arial,sans-serif;font-size:11px;
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
input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    margin: 0; 
}

</style>

</head>

<script>


function ControlErrorMessage()
{
	   var errormessage = "<%= session.getAttribute("errorMessage") %>"
	  
      if((errormessage.localeCompare(null))!=0)
     	 {
    	 
     		 $("#dvErrorMessage").show();
     		document.getElementById('username').focus();
     
     	
     	 
     	 }
     
	 
}

function isNumber(number)
{
	var phoneRegex =/\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/;
	if (phoneRegex.test(number.value)== false)
	  			number.setCustomValidity('Lütfen sayı giriniz.');
	  
	
}


$(function(){
	  $('#cellphone').keypress(function(e){
	    if(e.which != 69 && e.which != 101 && e.which != 45 && e.which != 46 && e.which != 44 && e.which != 43){
	    } else {
	      return false;
	    }
	  });
	});


</script>

<body onload="ControlErrorMessage()">

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

				<a class="navbar-brand" href="/HaritaUzerindeIsArama/WelcomePage.jsp"> <img alt="İşBurada"
					src="/HaritaUzerindeIsArama/images/logo.png" width="25" height="25">
				</a>

			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="/HaritaUzerindeIsArama/WelcomePage.jsp">İşBurada</a></li>
				</ul>


				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown  active"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"> <span
							class="glyphicon glyphicon-user"></span> Üye <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/HaritaUzerindeIsArama/userhome.jsp">Giriş Yap</a></li>
							<li  class="active"><a href="/HaritaUzerindeIsArama/signupasuser.jsp">Kayıt Ol</a></li>

						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"> <span
							class="glyphicon glyphicon-user"></span> İşveren <span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/HaritaUzerindeIsArama/employerhome.jsp">Giriş
									Yap</a></li>
							<li ><a href="/HaritaUzerindeIsArama/signupasemployer.jsp">Kayıt
									Ol</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<form class="form-horizontal" role="form" action="adduser"
				method="POST">
				<div class="col-md-10">
					<br>
					<h2 class="text-center text-primary">Kullanıcı Bilgileri</h2>
					<br>
					<div class="form-group">
						<label class="control-label col-sm-4" for="name">Ad :</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="name" name="name" placeholder="Ad" required pattern="\w+"  value="${param.name}"/>
						
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-4" for="surname">Soyad
							:</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="surname" name="surname"
								placeholder="Soyad" required pattern="\w+" value="${param.surname}">
								 
								
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-4" for="email">E-Posta
							Adresi :</label>
						<div class="col-sm-6">
							<input type="email" class="form-control" id="email" name="email" value="${param.email}"
								placeholder="E-posta Adresi" data-toggle="tooltip" title="İşverenlerin sizinle kolayca iletişime geçebilmesi için, sürekli kullandığınız bir mail adresi girebilirsiniz."
								  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required>
						</div>
					</div>
					
					
				<input type="hidden" name="viewid" value="signupasuser.jsp">
					
					<div class="form-group">
						<label class="control-label col-sm-4" for="cellphone">Cep
							Telefon No :</label>
						<div class="col-sm-6">
							<input type="number" class="form-control" id="cellphone" name="cellphone"
								placeholder="Cep Telefonu" value="${param.cellphone}"   required />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-4" for="username">Kullanıcı
							Adı :</label>
						<div class="col-sm-6" >
							<input type="text" class="form-control" id="username"
								name="username" placeholder="Kullanıcı Adı"  required/>
						
								<div  style="display: none" id="dvErrorMessage" class="alert-box error"><span>error: </span><%= session.getAttribute("errorMessage") %></div>
					
						</div>
					</div>
						<% session.removeAttribute("errorMessage"); %>
					
					<div class="form-group">
						<label class="control-label col-sm-4" for="password">Şifre
							:</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="password" name="password"
								placeholder="Şifre" data-toggle="tooltip" title="En az 6 karakter içermelidir.Büyük,küçük harf ve numara içermelidir."  required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" onchange="form.pwd2.pattern = this.value;">
						
						</div>
					</div>

				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-8">
						<br> <br> <br> <br>
						<button type="submit" class="btn btn-success btn-block">Kayıt
							Ol</button>
					</div>
				</div>
		
					</form>
				</div>
		</div>
		
		<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});
</script>


</body>
</html>