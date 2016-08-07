<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="tr">
<head>

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
  <script>
  $(function() {
    $( "#datepicker3" ).datepicker({ dateFormat: "dd-mm-yy" }).val()
  });
  </script>
  <script>
  $(function() {
    $( "#datepicker4" ).datepicker({ dateFormat: "dd-mm-yy" }).val()
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
<script>
function changeval(){
	var kanSeciniz = document.sform.BloodInfo.value;
	if(kanSeciniz == null || kanSeciniz == "" || kanSeciniz == "0")
		alert("Lütfen Seçenekleri Boş Bırakmayın Seçiniz");

    var sigaraSeciniz = document.sform.CigaretteInfo.value;
    if(sigaraSeciniz == null || sigaraSeciniz == "" || sigaraSeciniz == "0")
		alert("Lütfen Seçenekleri Boş Bırakmayın Seçiniz");
    var maasSeciniz = document.sform.SalaryExpectation.value;
    if(maasSeciniz == null || maasSeciniz == "" || maasSeciniz == "0")
		alert("Lütfen Seçenekleri Boş Bırakmayın Seçiniz");
}
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
		method="POST" action="CVAdditionalServlet" data-fv-framework="bootstrap"
		data-fv-framework="bootstrap"
		data-fv-icon-valid="glyphicon glyphicon-ok"
		data-fv-icon-invalid="glyphicon glyphicon-remove"
		data-fv-icon-validating="glyphicon glyphicon-refresh">
		<div class="container">
		<p><br><br></p>
			<ul class="nav nav-pills  col-md-offset-2   ">
				<li ><a data-toggle="pill"
					href="CVContactInformation.jsp">İletişim Bilgileri</a></li>
				<li><a data-toggle="pill" href="CVPersonalInformation.jsp">Kişisel Bilgiler</a></li>
				<li><a data-toggle="pill" href="CVEducationalInfo.jsp">Eğitim Bilgileri</a></li>
				<li><a data-toggle="pill" href="CVBusinessInfo.jsp">İş Deneyimi</a></li>
				<li><a data-toggle="pill" href="CVForeignLaguageInfo.jsp">Yabancı Dil</a></li>
				<li><a data-toggle="pill" href="CVReferenceInfo.jsp">Referans Bilgileri</a></li>
			<li class="active"><a data-toggle="pill" href="CVAdditionalInfo.jsp">Ek Bilgiler</a></li>
			</ul>

			<div class="tab-content text-center">
				<div id="home" class="tab-pane fade in active">
					<br>
					<div class="container center ">

						
					 <div class="form-group">
      <label class="control-label col-sm-5" for="CertificateName">Sertifika Adı&nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">
        <input type="text" class="form-control" name="CertificateName" placeholder="Sertifika Adı">
      </div>
    </div>
    
			  <div class="form-group">
      <label class="control-label col-sm-5" for="CertificateDate">Sertifikanın Alındığı Tarih&nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">          
        <input type="text" id="datepicker" class="form-control" name="CertificateDate" >
      </div>
    </div>	
     <div class="form-group">
      <label class="control-label col-sm-5" for="CertificatePlace">Sertifikanın Alındığı Kurum&nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">
        <input type="text" class="form-control" name="CertificatePlace" placeholder="Sertifika Kurumu">
      </div>
    </div>	
					 <div class="form-group">
      <label class="control-label col-sm-5" for="CertificateExplanation">Açıklama&nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">
        <textarea type="text" class="form-control" name="CertificateExplanation" placeholder=" Sertifika Açıklaması" maxlength="120"></textarea>
      </div>
    </div>
    <hr>
    <div class="form-group">
      <label class="control-label col-sm-5" for="ExamName">Sınav Adı&nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">
        <input type="text" class="form-control" name="ExamName" placeholder="Sınav Adı">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-5" for="ExamPlace">Sınavı Yapan Kuruluş&nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">
        <input type="text" class="form-control" name="ExamPlace" placeholder="Sınavı Yapan Kuruluş">
      </div>
    </div>
    
			  <div class="form-group">
      <label class="control-label col-sm-5" for="ExamDate">Sınavı yapıldığı Tarih &nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">          
        <input type="text" id="datepicker2" class="form-control" name="ExamDate" >
      </div>
    </div>	
     <div class="form-group">
      <label class="control-label col-sm-5" for="ExamExplanation">Açıklama&nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">
        <textarea type="text" class="form-control" name="ExamExplanation" placeholder=" Sınav ile ilgili Açıklaması" maxlength="120"></textarea>
      </div>
    </div>
    <hr>
 <div class="form-group">
      <label class="control-label col-sm-5" for="Skills">Uzamanlık Alanı Becerileri&nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">
        <textarea type="text" class="form-control" name="Skills" placeholder="Beceriler" maxlength="120"></textarea>
      </div>
    </div>
    
    	 <div class="form-group">
      <label class="control-label col-sm-5" for="SeminarName">Seminer Adı&nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">
        <input type="text" class="form-control" name="SeminarName" placeholder="Seminer Adı">
      </div>
    </div>
    
     <div class="form-group">
      <label class="control-label col-sm-5" for="SeminarPlace">Seminerin Yapıldığı Kurum&nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">
        <input type="text" class="form-control" name="SeminarPlace" placeholder="Seminerin Yapıldığı Kurumu">
      </div>
    </div>
			  <div class="form-group">
      <label class="control-label col-sm-5" for="SeminarStartDate">Seminerin Başlama Tarihi&nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">          
        <input type="text" id="datepicker3" class="form-control" name="SeminarStartDate" >
      </div>
    </div>	
    
    <div class="form-group">
      <label class="control-label col-sm-5" for="SeminarFinishDate">Seminerin Bitiş Tarihi&nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">          
        <input type="text" id="datepicker4" class="form-control" name="SeminarFinishDate" >
      </div>
    </div>	
    
    <hr>
    <div class="form-group">
      <label class="control-label col-sm-5" for="BursaryExplanation">Burs veya Proje Bilgisi&nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">          
        <textarea class="form-control" name="BursaryExplanation" placeholder="Burs veya Proje Açıklaması" maxlength="120"></textarea>
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-5" for="FondationInformation">Burs Bilgileri&nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">          
        <textarea class="form-control"  name="FondationInformation" placeholder="Burs Bilgileri" maxlength="120"></textarea>
      </div>
    </div>
    <hr>
    
     
    
    <div class="form-group">
      <label class="control-label col-sm-5" for="BloodInfo">Kan Grubu&nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">          
        <select name="BloodInfo" class="form-control">
        <option value="">Seçiniz</option>
        <option value="0 Rh(+)">0 Rh(+)</option>
        <option value="0 Rh(-)">0 Rh(-)</option>
        <option value="A Rh(+">A Rh(+)</option>
        <option value="A Rh(-)">A Rh(-)</option>
        <option value="B Rh(+)">B Rh(+)</option>
        <option value="B Rh(-)">B Rh(-)</option>
         <option value="AB Rh(+)">AB Rh(+)</option>
          <option value="AB Rh(-)">AB Rh(-)</option>
        
        </select>
      </div>
    </div>
    
     <div class="form-group">
      <label class="control-label col-sm-5" for="CigaretteInfo">Sigara Kullanımı&nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">          
        <select name="CigaretteInfo" class="form-control">
        <option value="">Seçiniz</option>
        <option value="Sigara Kullanıyorum">Sigara Kullanıyorum</option>
      <option value="Sigara Kullanmıyorum">Sigara Kullanmıyorum</option>
      <option value="Mesai Saatleri İçinde Kullanmıyorum">Mesai Saatleri İçinde Kullanmıyorum</option>
        </select>
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-5" for="SalaryExpectation">Maaş Beklentisi&nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">          
        <select name="SalaryExpectation" class="form-control">
        <option value="">Seçiniz</option>
         <option value="1000 ve altı">1000TL ve Altı</option>
         <option value="1000TL-2000TL">1000TL-2000TL </option>
          <option value="2000TL-3000TL">2000TL-3000TL</option>
           <option value="3000TL-4000TL">3000TL-4000TL</option>
            <option value="4000TL-5000TL">4000TL-5000TL</option>
             <option value="5000TL-6000TL">5000TL-6000TL</option>
              <option value="6000TL-7000TL">6000TL-7000TL</option>
               <option value="7000TL-8000TL">7000TL-8000TL</option>
                <option value="8000TL-9000TL">8000TL-9000TL</option>
                 <option value="9000TL-10000TL">9000TL-10000TL</option>
                 <option value="10000TL ve Üstü">10000TL ve Üstü</option>
        </select>
      </div>
    </div>
   		
					
					

						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-8">

								<button type="submit" class="btn btn-success" onclick="changeval()">DEVAM ET
									>></button>

							</div>
						</div>


					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>