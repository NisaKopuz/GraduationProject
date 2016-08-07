<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="docs/css/bootstrap-3.3.2.min.css"
	type="text/css">
<link rel="stylesheet" href="docs/css/bootstrap-example.css"
	type="text/css">
<link rel="stylesheet" href="docs/css/prettify.css" type="text/css">

<script type="text/javascript" src="docs/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="docs/js/bootstrap-3.3.2.min.js"></script>
<script type="text/javascript" src="docs/js/prettify.js"></script>
<title>işburada.com </title>

<style>
body {
	padding-top: 50px; /* Whatever the height of your navbar is; the
                             default is 50px */
}


</style>
</head>
<body onload="controlbonusfeature();">
	<%
		String username = request.getRemoteUser();
		session.setAttribute("username", username);
	%>
	<script>
	
	function controlbonusfeature(){
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				
				if(xhttp.responseText=="0") {
			
				}else {
					window.location.replace('/HaritaUzerindeIsArama/userhome.jsp');
					
				}
				
				
			}
		};
		xhttp.open("POST", "BonusFeatureExist", true);
		xhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xhttp.send("username=" + '<%=username%>');

		}
	
	
	$(document).ready(function () {
	    $('#wlcModal').modal('show');
	});
	
	// Progress bar variables
	var width = 0;
	var universitiesFlag = 0;
	var languagesFlag = 0;
	var jobsFlag = 0;
	var certificatesFlag = 0;
	var seminarsFlag = 0;
	
		// JSON
		var submitdata = {};
		var submitdatauniversities = {};
		var submitdatalanguages = {};
		var submitdatajobs = {};
		var submitdatacertificate = {};
		var submitdataseminars = {};
		
		
		var universities = [];
		var languages = [];
		var jobs = [];
		var certificates = [];
		var seminars = [];
		
		
		var universitiesarray=[];
		var languagearray=[];
		var jobsarray=[];
		var certificatesarray=[];
		var seminarsarray=[];
		var selectedBirthDate;
		submitdata.universities = universities;
		submitdata.languages = languages;
		submitdata.jobs = jobs;
		submitdata.certificates = certificates;
		submitdata.seminars = seminars;
		
		function showJSON() {

			console.log(submitdata);
		}
		
		function move(value) {
			  var elem = document.getElementById("progress-bar");   
			  if(value>0){
			  var l = width + value;
			  while (width < (l)) {
				  width++;
				  elem.style.width = width + '%';
				  document.getElementById("label").innerHTML = width * 1  + '%';		 
			  } 
			
			 
		} else {
			 var l = width + value;
			  while (l < (width)) {
				  width--;
				  elem.style.width = width + '%';
				  document.getElementById("label").innerHTML = width * 1  + '%';		 
			  } 
			
			
			
		}
			  if(width == 100) {
				  $('#submitData').removeAttr('disabled');
			  }
		}
		
		function sendData() {
			console.log(JSON.stringify(submitdata));
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4
						&& xhttp.status == 200) {
					location.href="/HaritaUzerindeIsArama/userhome.jsp";

				}
			};
			xhttp.open("POST","BonusFeature",true);
			xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xhttp.send("universities="+ universitiesarray+"&language="+languagearray+"&jobs="+jobsarray+"&certificate="+certificatesarray+"&seminar="+seminarsarray+"&birthdaydate="+selectedBirthDate);
			
			
		}
		
		
		function activateStart() {
			document.getElementById("start").disabled = false;
		}
		
		function startButton() {
			var birthDate = document.getElementById("birthdate");
			 selectedBirthDate = birthDate.options[birthDate.selectedIndex].text;
			submitdata.birthdate = selectedBirthDate;
			move(10);
		}
		
		function addUniversity() {
			var university = document.getElementById("university");
			var selectedUniversity = university.options[university.selectedIndex].text;
			var educationType = document.getElementById("educationtype");
			var selectedEducationType = educationType.options[educationType.selectedIndex].text;
			var graduationScore = document.getElementById("graduationscore").value;
			universitiesarray.push(university.options[university.selectedIndex].value);
			universitiesarray.push(educationType.options[educationType.selectedIndex].value);
			universitiesarray.push(graduationScore);
			console.log( universitiesarray );
			var ul = document.getElementById("educationinfo");
			var li = document.createElement("li");
			li.setAttribute("class", "list-group-item");
			li.appendChild(document.createTextNode(selectedUniversity + " ("
					+ selectedEducationType + ") - " + graduationScore));
			ul.appendChild(li);

			
			var data = {
				"university" : selectedUniversity,
				"educationType" : selectedEducationType,
				"graduationScore" : graduationScore
			}

			submitdata.universities.push(data);
			if(universitiesFlag == 0){
				move(20);
				universitiesFlag = 1;
			}
			
			//console.log(submitdata);

			university.selectedIndex = 0;
			educationType.selectedIndex = 0;
			document.getElementById("graduationscore").value = "";
		}

		function addLanguage() {
			var language = document.getElementById("language");
			var selectedLanguage = language.options[language.selectedIndex].text;

			var langReading = document.getElementById("langreading");
			var selectedLangReading = langReading.options[langReading.selectedIndex].text;
			var langWriting = document.getElementById("langwriting");
			var selectedLangWriting = langWriting.options[langWriting.selectedIndex].text;
			var langSpeaking = document.getElementById("langspeaking");
			var selectedLangSpeaking = langSpeaking.options[langSpeaking.selectedIndex].text;
			languagearray.push(language.options[language.selectedIndex].value);
			languagearray.push(langReading.options[langReading.selectedIndex].value);
			languagearray.push(langWriting.options[langWriting.selectedIndex].value);
			languagearray.push(langSpeaking.options[langSpeaking.selectedIndex].value);
			
			var ul = document.getElementById("languageinfo");
			var li = document.createElement("li");
			li.setAttribute("class", "list-group-item");
			li.appendChild(document.createTextNode(selectedLanguage
					+ " (Okuma:" + selectedLangReading + " - Yazma:"
					+ selectedLangWriting + " - Konuşma:"
					+ selectedLangSpeaking + ")"));
			ul.appendChild(li);

			var data = {
				"language" : selectedLanguage,
				"langReading" : selectedLangReading,
				"langWriting" : selectedLangWriting,
				"langSpeaking" : selectedLangSpeaking
			}

			submitdata.languages.push(data);
			if(languagesFlag == 0){
				move(20);
				languagesFlag = 1;
			}
			
			language.selectedIndex = 0;
			langReading.selectedIndex = 0;
			langWriting.selectedIndex = 0;
			langSpeaking.selectedIndex = 0;

		}

		function addJob() {
			var companyName = document.getElementById("companyname").value;
			var position = document.getElementById("position");
			var selectedPosition = position.options[position.selectedIndex].text;

			var startDate = document.getElementById("startdate");
			var selectedStartDate = startDate.options[startDate.selectedIndex].text;
			var endDate = document.getElementById("enddate");
			var selectedEndDate = endDate.options[endDate.selectedIndex].text;

			
			jobsarray.push(companyName);
			jobsarray.push(position.options[position.selectedIndex].value);
			jobsarray.push(selectedStartDate);
			jobsarray.push(selectedEndDate);
			
			var ul = document.getElementById("jobinfo");
			var li = document.createElement("li");
			li.setAttribute("class", "list-group-item");
			li.appendChild(document.createTextNode(companyName + " - "
					+ selectedPosition + " (" + selectedStartDate + "-"
					+ selectedEndDate + ")"));
			ul.appendChild(li);

			var data = {
				"companyName" : companyName,
				"position" : position,
				"startDate" : selectedStartDate,
				"endDate" : selectedEndDate
			}

			submitdata.jobs.push(data);
				
			if(jobsFlag == 0){
				move(20);
				jobsFlag = 1;
			}
			
			document.getElementById("companyname").value = "";
			document.getElementById("position").value = "";
			startDate.selectedIndex = 0;
			endDate.selectedIndex = 0;
		}

		function addCertificate() {
			var certificateName = document.getElementById("certificatename").value;
			var certificateCorporation = document
					.getElementById("certificatecorporation").value;

			var certificateDate = document.getElementById("certificatedate");
			var selectedCertificateDate = certificateDate.options[certificateDate.selectedIndex].text;
			certificatesarray.push(certificateName);
			var ul = document.getElementById("certificateinfo");
			var li = document.createElement("li");
			li.setAttribute("class", "list-group-item");
			li.appendChild(document.createTextNode(certificateName + " - "
					+ certificateCorporation + " (" + selectedCertificateDate
					+ ")"));
			ul.appendChild(li);

			var data = {
				"certificateName" : certificateName,
				"certificateCorporation" : certificateCorporation,
				"certificateDate" : selectedCertificateDate
			}

			submitdata.certificates.push(data);
			
			if(certificatesFlag == 0){
				move(15);
				certificatesFlag = 1;
			}
			
			document.getElementById("certificatename").value = "";
			document.getElementById("certificatecorporation").value = "";
			certificateDate.selectedIndex = 0;
		}

		function addSeminar() {
			var seminarName = document.getElementById("seminarname").value;

			var seminarDate = document.getElementById("seminardate");
			var selectedSeminarDate = seminarDate.options[seminarDate.selectedIndex].text;
			seminarsarray.push(seminarName);
			var ul = document.getElementById("seminarinfo");
			var li = document.createElement("li");
			li.setAttribute("class", "list-group-item");
			li.appendChild(document.createTextNode(seminarName + " ("
					+ selectedSeminarDate + ")"));
			ul.appendChild(li);

			var data = {
				"seminarName" : seminarName,
				"seminarDate" : selectedSeminarDate
			}

			submitdata.seminars.push(data);
			
			if(seminarsFlag == 0){
				move(15);
				seminarsFlag = 1;
			}
			
			document.getElementById("seminarname").value = "";
			seminarDate.selectedIndex = 0;
		}
		function checkStatusForSeminar()
		{
			 if(document.getElementById("seminar").checked){
			 document.getElementById("addseminar").disabled = true;
			 move(15);
			 }
			 else{
				 document.getElementById("addseminar").disabled = false;
				 move(-15);
				
			 }
		}
		function checkStatusForCertificate()
		{
			 if(document.getElementById("certificate").checked){
			 document.getElementById("addcertificate").disabled = true;
			 move(15);
			 }
			 else{
				 document.getElementById("addcertificate").disabled = false;
			 move(-15);
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

	<div class="container-fluid">
		<br>
		<div class="row">
			<div class="col-xs-3"></div>
			<div class="col-xs-6">
				<div class="progress">
					<div class="progress-bar progress-bar-striped active"
						id="progress-bar" role="progressbar" aria-valuenow="0"
						aria-valuemin="0" aria-valuemax="100" style="width: 0%"> <div id="label">0%</div></div>
				</div>
			</div>
			
		</div>
		
		<!-- Centered Tabs -->
		<ul class="nav nav-pills nav-justified">
			<li class="active"><a data-toggle="pill" href="#menu1">
					Eğitim Bilgileri </a></li>
			<li><a data-toggle="pill" href="#menu2">Deneyimler</a></li>
			<li><a data-toggle="pill" href="#menu3">Sertifikalar ve
					Seminerler</a></li>
		</ul>

		<br>

		<div class="tab-content">
		

			<div id="menu1" class="tab-pane fade in active">
				<div class="container-fluid">
					<div class="row">
						<div class="col-xs-6">
							<div class="panel panel-info">
								<div class="panel-heading">
									<div class="text-center">Mezun Olduğun Okullar</div>
								</div>
								<div class="panel-body">
									<ul class="list-group pre-scrollable" style="height: 200px"
										id="educationinfo">

									</ul>
								</div>
								<div class="panel-footer">
									<div class="text-center">
										<button type="button" class="btn ctn-default"
											data-toggle="modal" data-target="#eduModal">Eğitim
											Bilgisi Ekle</button>
									</div>
								</div>
							</div>
						</div>

						<div class="col-xs-6">
							<div class="panel panel-info">
								<div class="panel-heading">
									<div class="text-center">Bildiğin Yabancı Diller</div>
								</div>
								<div class="panel-body">
									<ul class="list-group pre-scrollable" style="height: 200px"
										id="languageinfo">

									</ul>
								</div>
								<div class="panel-footer">
									<div class="text-center">
										<button type="button" class="btn ctn-default"
											data-toggle="modal" data-target="#lngModal">Dil Ekle</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div id="menu2" class="tab-pane fade">
				<div class="container-fluid">
					<div class="row">
						<div class="col-xs-1"></div>
						<div class="col-xs-10">
							<div class="panel panel-info">
								<div class="panel-heading">
									<div class="text-center">İş Deneyimlerin</div>
								</div>
								<div class="panel-body">
									<ul class="list-group pre-scrollable" style="height: 200px"
										id="jobinfo">

									</ul>
								</div>
								<div class="panel-footer">
									<div class="text-center">
										<button type="button" class="btn ctn-default"
											data-toggle="modal" data-target="#jobModal">Deneyim
											Ekle</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div id="menu3" class="tab-pane fade">
				<div class="container-fluid">
					<div class="row">
						<div class="col-xs-6">
							<div class="panel panel-info">
								<div class="panel-heading">
									<div class="text-center">Sertifikaların</div>
								</div>
								<div class="panel-body">
									<ul class="list-group pre-scrollable" style="height: 200px"
										id="certificateinfo">

									</ul>
								</div>
								<div class="panel-footer">
									<div class="text-center">
									<input type="checkbox" name="certificate" id="certificate" onchange="checkStatusForCertificate()">Sertifika eklemek istemiyorum 
										&nbsp;
										<button type="button" class="btn ctn-default"
											data-toggle="modal" data-target="#crtModal" id="addcertificate">Sertifika
											Ekle</button>
									</div>
								</div>
							</div>
						</div>

						<div class="col-xs-6">
							<div class="panel panel-info">
								<div class="panel-heading">
									<div class="text-center">Katıldığın Seminerler</div>
								</div>
								<div class="panel-body">
									<ul class="list-group pre-scrollable" style="height: 200px"
										id="seminarinfo">

									</ul>
								</div>
								<div class="panel-footer">
									
									<div class="text-center">
									<input type="checkbox" name="seminar" id="seminar"  onchange="checkStatusForSeminar()">Seminer eklemek istemiyorum 
										&nbsp;<button type="button" class="btn ctn-default"
											data-toggle="modal" id="addseminar" data-target="#semModal">Seminer
											Ekle</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		
		<div class="row">
		<div class="col-xs-4"></div>
		<div class="col-xs-4"> <button type="button" onclick="sendData()" id="submitData" class="btn btn-success btn-block" disabled> Gönder </button></div>
		</div>
	</div>

	
<div id="wlcModal" data-backdrop="static" data-keyboard="false" class="modal fade" role="dialog">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col-xs-2"></div>
						<div class="col-xs-8 text-center">
						<br><br>
							<h1 class="text-center">Özgeçmişini özetle, adını
								başvuranlar listesinde en üste çıkart!</h1>
							<h4 class="text-center">
								isburada.com
								özel olarak geliştirilmiş algoritması ile bir
								adım öne geç :)
							</h4>
							<br>
							<br>
							
							<div class="row">
							<label class="col-xs-4 control-label" for="birthdate"> Doğum yılın :</label>
							<div class="col-xs-8">
							<select class="form-control text-center" id="birthdate"
									name="birthdate" onclick="activateStart()"></select>
								<script>
									var min = new Date().getFullYear() - 70;
									var max = new Date().getFullYear() - 18;
									var select = document
											.getElementById('birthdate');

									for (var i = max; i >= min; i--) {
										var opt = document
												.createElement('option');
										opt.value = i;
										opt.innerHTML = i;
										select.appendChild(opt);
									}
								</script>
								</div>
								</div>
						<br><br>
						</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
				<div class="text-center">
					<button type="button" onclick="startButton()" class="btn btn-success btn-lg" id="start" data-dismiss="modal" disabled>Başla</button>
				</div></div>
			</div>

		</div>
	</div>


	<div id="eduModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Yeni eğitim bilgisi ekle..</h4>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col-xs-3">
								<p>Üniversite :</p>
							</div>
							<div class="col-xs-9">
								<select class="form-control" name="university" id="university">
									<option value="1">Abant İzzet Baysal
																Üniversitesi</option>
																<option value="178">Abdullah Gül Üniversitesi</option>
															<option value="2">Acıbadem Üniversitesi</option>
															<option value="179">Adana Bilim ve Teknoloji Üniversitesi</option>
															<option value="3">Adıyaman Üniversitesi</option>
															<option value="4">Adnan Menderes Üniversitesi</option>
															<option value="5">Afyon Kocatepe Üniversitesi</option>
															<option value="6">Ağrı İbrahim Çeçen
																Üniversitesi</option>
															<option value="7">Ahi Evran Üniversitesi</option>
									
															<option value="9">Akdeniz Üniversitesi</option>
															<option value="10">Aksaray Üniversitesi</option>													
															<option value="180">Alanya Hamdullah Emin Paşa Üniversitesi</option>
															<option value="11">Amasya Üniversitesi</option>
															<option value="12">Anadolu Üniversitesi</option>
															<option value="181">Ankara Sosyal Bilimler Üniversitesi</option>
															<option value="13">Ankara Üniversitesi</option>
															<option value="194">Antalya Üniversitesi</option>
															<option value="14">Ardahan Üniversitesi</option>
															<option value="15">Artvin Çoruh Üniversitesi</option>
															<option value="182">Atatürk Öğretmen Akademisi</option>
															<option value="16">Atatürk Üniversitesi</option>
															<option value="17">Atılım Üniversitesi</option>
															<option value="18">Avrasya Üniversitesi</option>
															<option value="27">Bahçeşehir Üniversitesi</option>
															<option value="30">Balıkesir Üniversitesi</option>
															<option value="31">Bartın Üniversitesi</option>
															<option value="32">Başkent Üniversitesi</option>
															<option value="183">Başkent Üniversitesi Ankara Hastanesi</option>
															<option value="33">Batman Üniversitesi</option>
															<option value="35">Bayburt Üniversitesi</option>
															<option value="36">Beykent Üniversitesi</option>
															<option value="184">Beykoz Lojistik Meslek Yüksekokulu</option>
															<option value="37">Bezm-i Âlem Vakıf
																Üniversitesi</option>
															<option value="38">Bilecik Üniversitesi</option>
															<option value="39">Bilkent Üniversitesi</option>
															<option value="40">Bingöl Üniversitesi</option>
															<option value="185">Biruni Üniversitesi</option>
															<option value="41">Bitlis Eren Üniversitesi</option>
															<option value="42">Boğaziçi Üniversitesi</option>
															<option value="43">Bozok Üniversitesi</option>
															<option value="44">Bursa Teknik Üniversitesi</option>
															<option value="187">Bursa Orhangazi Üniversitesi</option>
															<option value="188">Canik Başarı Üniversitesi</option>
															<option value="47">Çağ Üniversitesi</option>
															<option value="48">Çanakkale Onsekiz Mart
																Üniversitesi</option>
															<option value="49">Çankaya Üniversitesi</option>
															<option value="50">Çankırı Karatekin
																Üniversitesi</option>
															<option value="45">Celal Bayar Üniversitesi</option>
															<option value="51">Çukurova Üniversitesi</option>
															<option value="46">Cumhuriyet Üniversitesi</option>
															<option value="206">Deniz Harp Okulu</option>
															<option value="52">Dicle Üniversitesi</option>
															<option value="54">Doğuş Üniversitesi</option>
															<option value="55">Dokuz Eylül Üniversitesi</option>
															<option value="56">Dumlupınar Üniversitesi</option>
															<option value="57">Düzce Üniversitesi</option>
															<option value="190">Düzce Üniversitesi Tıp Fakültesi</option>
															<option value="58">Ege Üniversitesi</option>
															<option value="59">Erciyes Üniversitesi</option>
															<option value="60">Erzincan Üniversitesi</option>
															<option value="191">Erzurum Teknik Üniversitesi</option>
															<option value="61">Eskişehir Osmangazi
																Üniversitesi</option>
															<option value="62">Fatih Sultan Mehmet Vakıf
																Üniversitesi</option>
															<option value="63">Fatih Üniversitesi</option>
															<option value="64">Fırat Üniversitesi</option>
															<option value="65">Galatasaray Üniversitesi</option>
															<option value="66">Gazi Üniversitesi</option>
															<option value="67">Gaziantep Üniversitesi</option>
															<option value="69">Gaziosmanpaşa Üniversitesi</option>
															<option value="70">Gebze Yüksek Teknoloji
																Enstitüsü</option>
															<option value="71">Gedik Üniversitesi</option>
															<option value="72">Gediz Üniversitesi</option>
															<option value="74">Giresun Üniversitesi</option>
															<option value="75">Girne Amerikan Üniversitesi</option>
															<option value="76">Gülhane Askeri Tıp Akademisi</option>
															<option value="77">Gümüşhane Üniversitesi</option>
															<option value="78">Hacettepe Üniversitesi</option>
															<option value="79">Hakkari Üniversitesi</option>
															<option value="80">Haliç Üniversitesi</option>
															<option value="81">Harran Üniversitesi</option>
															<option value="193">Hasan Kalyoncu Üniversitesi</option>
															<option value="213">Hava Harp Okulu Komutanlığı</option>
															<option value="211">Hava Teknik Okullar Komutanlığı</option>
															<option value="	82">Hitit Üniversitesi</option>
															<option value="84">Iğdır Üniversitesi</option>
															<option value="87">İnönü Üniversitesi</option>
															<option value="195">İpek Üniversitesi</option>
															<option value="85">Işık Üniversitesi</option>
															<option value="88">İstanbul 29 Mayıs
																Üniversitesi</option>
															<option value="89">İstanbul Arel Üniversitesi</option>
															<option value="90">İstanbul Aydın Üniversitesi</option>
															<option value="91">İstanbul Bilgi Üniversitesi</option>
															<option value="92">İstanbul Bilim Üniversitesi</option>
															<option value="196">İstanbul Esenyurt Üniversitesi</option>
															<option value="192">İstanbul Gelişim Üniversitesi</option>
															<option value="94">İstanbul Kemerburgaz
																Üniversitesi</option>
															<option value="95">İstanbul Kültür Üniversitesi</option>
															<option value="198">İstanbul Medeniyet Üniversitesi</option>
															<option value="199">İstanbul MEF Üniversitesi</option>
															<option value="96">İstanbul Medipol Üniversitesi</option>
															<option value="97">İstanbul Sabahattin Zaim
																Üniversitesi</option>
															<option value="98">İstanbul Şehir Üniversitesi</option>
															<option value="197">İstanbul Üniversitesi</option>
															<option value="99">İstanbul Teknik Üniversitesi</option>
															<option value="100	">İstanbul Ticaret
																Üniversitesi</option>
															<option value="102">İzmir Ekonomi Üniversitesi</option>
															<option value="103">İzmir Katip Çelebi
																Üniversitesi</option>
															<option value="104">İzmir Üniversitesi</option>
															<option value="105">İzmir Yüksek Teknoloji
																Enstitüsü</option>
															<option value="106">Kadir Has Üniversitesi</option>
															<option value="189">Kapadokya Meslek Yüksekokulu</option>
															<option value="107">Kafkas Üniversitesi</option>
															<option value="108">Kahramanmaraş Sütçü İmam
																Üniversitesi</option>
																<option value="200">Kanuni Üniversitesi</option>
																<option value="203">Kara Harp Okulu</option>
															<option value="109">Karabük Üniversitesi</option>
															<option value="110">Karadeniz Teknik
																Üniversitesi</option>
															<option value="111">Karamanoğlu Mehmetbey
																Üniversitesi</option>
															<option value="112">Kastamonu Üniversitesi</option>
															<option value="116">Kilis 7 Aralık Üniversitesi</option>
														<option value="114">Kırıkkale Üniversitesi</option>
															<option value="115">Kırklareli Üniversitesi</option>
															<option value="118">Koç Üniversitesi</option>
															<option value="117">Kocaeli Üniversitesi</option>
															<option value="201">Konya Gıda ve Tarım Üniversitesi</option>
															<option value="202">Konya Necmettin Erbakan Üniversitesi</option>
															<option value="120">Kto Karatay Üniversitesi</option>
															<option value="122">Maltepe Üniversitesi</option>
															<option value="123">Mardin Artuklu Üniversitesi</option>
															<option value="124">Marmara Üniversitesi</option>
															<option value="125">Mehmet Akif Ersoy
																Üniversitesi</option>
															<option value="126">Melikşah Üniversitesi</option>
															<option value="127">Mersin Üniversitesi</option>
															<option value="128">Mevlana Üniversitesi</option>
															<option value="129">Mimar Sinan Güzel Sanatlar
																Üniversitesi</option>
																<option value="204">Muğla Meslek Yüksekokulu</option>
															<option value="130">Muğla Üniversitesi</option>
															<option value="205">Murat Hüdavendigar Üniversitesi</option>
															<option value="132">Muş Alparslan Üniversitesi</option>
															<option value="131">Mustafa Kemal Üniversitesi</option>
															<option value="133">Namık Kemal Üniversitesi</option>
															<option value="134">Nevşehir Üniversitesi</option>
															<option value="135">Niğde Üniversitesi</option>
															<option value="207">Nişantaşı Üniversitesi</option>
															<option value="136">Nuh Naci Yazgan Üniversitesi</option>
															<option value="137">Okan Üniversitesi</option>
															<option value="138">Ondokuz Mayıs Üniversitesi</option>
															<option value="139">Ordu Üniversitesi</option>
															<option value="140">Orta Doğu Teknik
																Üniversitesi</option>
															<option value="141">Osmaniye Korkut Ata
																Üniversitesi</option>
															<option value="142">Özyeğin Üniversitesi</option>
															<option value="143">Pamukkale Üniversitesi</option>
															<option value="144">Piri Reis Üniversitesi</option>
															<option value="212">Polis Akademisi Başkanlığı</option>
															<option value="145">Rize Üniversitesi</option>
															<option value="146">Sabancı Üniversitesi</option>
															<option value="147">Sakarya Üniversitesi</option>
															<option value="208">Sanko Üniversitesi</option>
															<option value="209">Selahaddin Eyyubi Üniversitesi</option>
															<option value="148">Selçuk Üniversitesi</option>
															<option value="155">Şifa Üniversitesi</option>
															<option value="149">Siirt Üniversitesi</option>
															<option value="150">Sinop Üniversitesi</option>
															<option value="154">Şırnak Üniversitesi</option>
															<option value="152">Süleyman Demirel
																Üniversitesi</option>
															<option value="153">Süleyman Şah Üniversitesi</option>
															<option value="210">TED Üniversitesi</option>
															<option value="156">Tobb Ekonomi Ve Teknoloji
																Üniversitesi</option>
															<option value="157">Toros Üniversitesi</option>
															<option value="158">Trakya Üniversitesi</option>
															<option value="159">Tunceli Üniversitesi</option>
															<option value="160">Turgut Özal Üniversitesi</option>
															<option value="214">Türk-Alman Üniversitesi</option>
															<option value="161">Türk Hava Kurumu
																Üniversitesi</option>
															<option value="162">Ufuk Üniversitesi</option>
															<option value="	164">Uludağ Üniversitesi</option>
															<option value="167">Uşak Üniversitesi</option>
															<option value="215">Üsküdar Üniversitesi</option>
															<option value="169">Yalova Üniversitesi</option>
															<option value="170">Yaşar Üniversitesi</option>
															<option value="171">Yeditepe Üniversitesi</option>
															<option value="172">Yeni Yüzyıl Üniversitesi</option>
															<option value="173">Yıldırım Beyazıt
																Üniversitesi</option>
															<option value="174">Yıldız Teknik Üniversitesi</option>
															<option value="175">Yüzüncü Yıl Üniversitesi</option>
															<option value="176">Zirve Üniversitesi</option>
															<option value="177">Zonguldak Karaelmas
																Üniversitesi</option>
								</select>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-xs-3">
								<p>Öğrenim Türü :</p>
							</div>
							<div class="col-xs-3">
								<select class="form-control" name="educationtype"
									id="educationtype">
									<option value="1">Önlisans</option>
									<option value="2">Lisans</option>
									<option value="3">Yüksek Lisans</option>
									<option value="4">Doktora</option>
									
								</select>
							</div>
							<div class="col-xs-3">
								<p>Diploma Notu :</p>
							</div>
							<div class="col-xs-3">
								<input type="text" class="form-control" id="graduationscore">
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success"
						onclick="addUniversity()" data-dismiss="modal">Kaydet</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Vazgeç</button>
				</div>
			</div>

		</div>
	</div>


	<div id="lngModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Yeni dil ekle..</h4>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col-xs-2">
								<p>Dil :</p>
							</div>
							<div class="col-xs-10">
								<select class="form-control" name="language" id="language">
									<option value="1">	Türkçe	</option>
									<option value="2">	 Afrika Dili	</option>
									<option value="3">	 Almanca	</option>
									<option value="4">	 Arapça	</option>
									<option value="5">	 Arnavutça	</option>
									<option value="6">	 Azerice	</option>
									<option value="7">	 Baskça	</option>
									<option value="8">	 Belarusça	</option>
									<option value="9">	 Bengalce	</option>
									<option value="10">	 Boşnakça	</option>
									<option value="11">	 Bulgarca	</option>
									<option value="12">	 Burmaca	</option>
									<option value="13">	 Cava Dili	</option>
									<option value="14">	 Cebuano	</option>
									<option value="15">	 Chicheva	</option>
									<option value="16">	 Çekçe	</option>
									<option value="17">	 Çince	</option>
									<option value="18">	 Danca	</option>
									<option value="19">	 Endonezya Dili	</option>
									<option value="20">	 Ermenice	</option>
									<option value="21">	 Esperantoca	</option>
									<option value="22">	 Estonyaca	</option>
									<option value="23">	 Farsça	</option>
									<option value="24">	 Felemenkçe	</option>
									<option value="25">	 Filipince	</option>
									<option value="26">	 Fince	</option>
									<option value="27">	 Fransızca	</option>
									<option value="28">	 Frizon Dili	</option>
									<option value="29">	 Galce	</option>
									<option value="30">	 Galiçyaca	</option>
									<option value="31">	 Gücerat Dili	</option>
									<option value="32">	 Gürcüce	</option>
									<option value="33">	 Habeşçe	</option>
									<option value="34">	 Haiti Creole Dili	</option>
									<option value="35">	 Hausa Dili	</option>
									<option value="36">	 Havai Dili	</option>
									<option value="37">	 Hırvatça	</option>
									<option value="38">	 Hintçe	</option>
									<option value="39">	 Hmong Dili	</option>
									<option value="40">	 Hosa	</option>
									<option value="41">	 İbranice	</option>
									<option value="42">	 İgbo Dili	</option>
									<option value="43">	 İngilizce	</option>
									<option value="44">	 İrlandaca	</option>
									<option value="45">	 İspanyolca	</option>
									<option value="46">	 İsveççe	</option>
									<option value="47">	 İtalyanca	</option>
									<option value="48">	 İzlandaca	</option>
									<option value="49">	 Japonca	</option>
									<option value="50">	 Kamboçyaca	</option>
									<option value="51">	 Kannada	</option>
									<option value="52">	 Katalanca	</option>
									<option value="53">	 Kazakça	</option>
									<option value="54">	 Kırgızca	</option>
									<option value="55">	 Korece	</option>
									<option value="56">	 Korsika Dili	</option>
									<option value="57">	 Kuzey İskoç Dili	</option>
									<option value="58">	 Kürtçe	</option>
									<option value="59">	 Laoca	</option>
									<option value="60">	 Latince	</option>
									<option value="61">	 Lehçe	</option>
									<option value="62">	 Letonca	</option>
									<option value="63">	 Litvanca	</option>
									<option value="64">	 Lüksemburgca	</option>
									<option value="65">	 Macarca	</option>
									<option value="66">	 Madagaskar Dili	</option>
									<option value="67">	 Makedonca	</option>
									<option value="68">	 Malayalam	</option>
									<option value="69">	 Malezya Dili	</option>
									<option value="70">	 Malta Dili	</option>
									<option value="71">	 Maori Dili	</option>
									<option value="72">	 Marathi	</option>
									<option value="73">	 Moğolca	</option>
									<option value="74">	 Nepalce	</option>
									<option value="75">	 Norveççe	</option>
									<option value="76">	 Özbekçe	</option>
									<option value="77">	 Pencap Dili	</option>
									<option value="78">	 Peştuca	</option>
									<option value="79">	 Portekizce	</option>
									<option value="80">	 Romence	</option>
									<option value="81">	 Rusça	</option>
									<option value="82">	 Samoaca	</option>
									<option value="83">	 Sesotho Dili	</option>
									<option value="84">	 Seylanca	</option>
									<option value="85">	 Shona	</option>
									<option value="86">	 Sırpça	</option>
									<option value="87">	 Sint	</option>
									<option value="88">	 Slovakça	</option>
									<option value="89">	 Slovence	</option>
									<option value="90">	 Somalice	</option>
									<option value="91">	 Sundanizce	</option>
									<option value="92">	 Svahili Dili	</option>
									<option value="93">	 Tacikce	</option>
									<option value="94">	 Tamil	</option>
									<option value="95">	 Tay Dili	</option>
									<option value="96">	 Telugu Dili	</option>
									<option value="97">	 Ukraynaca	</option>
									<option value="98">	 Urduca	</option>
									<option value="99">	 Vietnamca	</option>
									<option value="100">	 Yidce	</option>
									<option value="101">	 Yoruba	</option>
									<option value="102">	 Yunanca	</option>
									<option value="103">	 Zulu	</option>
									
								</select>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="text-center">
								<div class="col-xs-4">
									<p>Okuma</p>
								</div>
								<div class="col-xs-4">
									<p>Yazma</p>
								</div>
								<div class="col-xs-4">
									<p>Konuşma</p>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-4">
								<select class="form-control" name="langreading" id="langreading">
									<option value="1">Orta</option>
									<option value="2">İyi</option>
								</select>
							</div>
							<div class="col-xs-4">
								<select class="form-control" name="langwriting" id="langwriting">
									<option value="1">Orta</option>
									<option value="2">İyi</option>
								</select>
							</div>
							<div class="col-xs-4">
								<select class="form-control" name="langspeaking"
									id="langspeaking">
									<option value="1">Orta</option>
									<option value="2">İyi</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success"
						onclick="addLanguage()" data-dismiss="modal">Kaydet</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Vazgeç</button>
				</div>
			</div>
		</div>
	</div>

	<div id="jobModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Yeni deneyim ekle..</h4>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col-xs-3">
								<p>Firma Adı :</p>
							</div>
							<div class="col-xs-9">
								<input type="text" class="form-control" id="companyname">
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-xs-3">
								<p>Pozisyonu :</p>
							</div>
							<div class="col-xs-9">
								<select class="form-control" name="position" id="position">
											<option value=""></option>
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
						</div>
						<br>
						<div class="row">
							<div class="col-xs-3">
								<p>Çalışma Aralığı :</p>
							</div>
							<div class="col-xs-4">
								<select class="form-control text-center" id="startdate"
									name="startdate"></select>
								<script>
									var min = new Date().getFullYear() - 70;
									var max = new Date().getFullYear();
									var select = document
											.getElementById('startdate');

									for (var i = max; i >= min; i--) {
										var opt = document
												.createElement('option');
										opt.value = i;
										opt.innerHTML = i;
										select.appendChild(opt);
									}
								</script>
							</div>
							<div class="col-xs-1">
								<p class="text-center">
									<strong>&#8212;</strong>
								</p>
							</div>
							<div class="col-xs-4">
								<select class="form-control text-center" id="enddate"
									name="enddate"></select>
								<script>
									var min = new Date().getFullYear() - 70;
									var max = new Date().getFullYear();
									var select = document
											.getElementById('enddate');

									for (var i = max; i >= min; i--) {
										var opt = document
												.createElement('option');
										opt.value = i;
										opt.innerHTML = i;
										select.appendChild(opt);
									}
								</script>

							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" onclick="addJob()"
						data-dismiss="modal">Kaydet</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Vazgeç</button>
				</div>
			</div>
		</div>
	</div>

	<div id="crtModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Yeni sertifika ekle..</h4>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col-xs-3">
								<p>Sertifika Adı :</p>
							</div>
							<div class="col-xs-9">
								<input type="text" class="form-control" id="certificatename">
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-xs-3">
								<p>Alındığı Kurum :</p>
							</div>
							<div class="col-xs-9">
								<input type="text" class="form-control"
									id="certificatecorporation">
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-xs-3">
								<p>Alındığı Tarih :</p>
							</div>
							<div class="col-xs-4">
								<select class="form-control text-center" id="certificatedate"
									name="certificatedate"></select>
								<script>
									var min = new Date().getFullYear() - 70;
									var max = new Date().getFullYear();
									var select = document
											.getElementById('certificatedate');

									for (var i = max; i >= min; i--) {
										var opt = document
												.createElement('option');
										opt.value = i;
										opt.innerHTML = i;
										select.appendChild(opt);
									}
								</script>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success"
						onclick="addCertificate()" data-dismiss="modal">Kaydet</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Vazgeç</button>
				</div>
			</div>
		</div>
	</div>

	<div id="semModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Yeni seminer ekle..</h4>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col-xs-3">
								<p>Seminer Adı :</p>
							</div>
							<div class="col-xs-9">
								<input type="text" class="form-control" id="seminarname">
							</div>
						</div>
						<br> <br>
						<div class="row">
							<div class="col-xs-3">
								<p>Katıldığı Tarih :</p>
							</div>
							<div class="col-xs-4">
								<select class="form-control text-center" id="seminardate"
									name="seminardate"></select>
								<script>
									var min = new Date().getFullYear() - 70;
									var max = new Date().getFullYear();
									var select = document
											.getElementById('seminardate');

									for (var i = max; i >= min; i--) {
										var opt = document
												.createElement('option');
										opt.value = i;
										opt.innerHTML = i;
										select.appendChild(opt);
									}
								</script>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success"
						onclick="addSeminar()" data-dismiss="modal">Kaydet</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Vazgeç</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>