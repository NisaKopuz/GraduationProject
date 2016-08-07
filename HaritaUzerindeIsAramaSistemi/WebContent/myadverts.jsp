<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.huia.service.dao.ad.AdDAOImp"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="tr">
<head>
<title>İlanlarım</title>
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
<style>
body {
	padding-top: 50px; /* Whatever the height of your navbar is; the
                             default is 50px */
}

#table {
  width: 700px ;
  margin-left: auto ;
  margin-right: auto ;
  border: none;
}

table, tr, td {border-style:hidden;}


.borderless tbody tr td, .borderless tbody tr th, .borderless thead tr th
	{
	border: none;
}
</style>

</head>
<%
	AdDAOImp addao = new AdDAOImp();
	int companyid = addao.getCompanyId((request.getRemoteUser()));
	session.setAttribute("companyid",companyid);
%>

<body onload="getAdverts('<%=companyid%>')">

	<%
		String username = request.getRemoteUser();
		session.setAttribute("username", username);


	%>

	<script>
	

		function getAdverts(companyId) {
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					document.getElementById("table").innerHTML = xhttp.responseText;
				}
			};
			xhttp.open("POST", "GetAdverts", true);
			xhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xhttp.send("companyId=" + companyId);
		}
		
		function deleteAdvert(adId) {
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4 && xhttp.status == 200) {
						location.reload(true);
				}
			};
			xhttp.open("POST", "DeleteAdvert", true);
			xhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xhttp.send("adId=" + adId);
		}
		
		
		
		

		function getAdvert(adId) {
			var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4 && xhttp.status == 200) {
					var obj = JSON.parse(xhttp.responseText);
					getCompanyName();
					$('#adid').val(adId);
					$('#title').val(obj.title);
					$('#jobfield-multiple-selected').multiselect('select', [obj.jobfield1, obj.jobfield2, obj.jobfield3, obj.jobfield4,obj.jobfield5 ]);
					$('#positiontype').val(obj.positiontype);
					nicEditors.findEditor('qualifications').setContent(obj.qualifications);		
					$('#sector-multiple-selected').multiselect('select', [obj.sector1, obj.sector2, obj.sector3, obj.sector4,obj.sector5 ]);
					$('#positionlevel').val(obj.positionlevel);
					$('#numberofpersonnel').val(obj.numberofpersonnel);
					$('#province').val(obj.city);
					$('#dlicence').val(obj.drivinglicence);
					
					
					if(obj.shownumberofpersonnel.toString() == "true")
						$('#numberofpersonnelcheckbox').prop("checked", true);
					else
						$('#numberofpersonnelcheckbox').prop("checked", false);
					
					$('#netsalary').val(obj.netsalary);
					
					if(obj.shownetsalary.toString() == "true")
						$('#netsalarycheckbox').prop("checked", true);
					else
						$('#netsalarycheckbox').prop("checked", false);
					
					if(obj.educationallevel.charAt(0) == "1")
						$('#psstudent').prop("checked", true);
					else
						$('#psstudent').prop("checked", false);
					
					if(obj.educationallevel.charAt(1) == "1")
						$('#psgraduated').prop("checked", true);
					else
						$('#psgraduated').prop("checked", false);
					
					if(obj.educationallevel.charAt(2) == "1")
						$('#hsstudent').prop("checked", true);
					else
						$('#hsstudent').prop("checked", false);
					
					if(obj.educationallevel.charAt(3) == "1")
						$('#hsgraduated').prop("checked", true);
					else
						$('#hsgraduated').prop("checked", false);
					
					if(obj.educationallevel.charAt(4) == "1")
						$('#vsstudent').prop("checked", true);
					else
						$('#vsstudent').prop("checked", false);
					
					if(obj.educationallevel.charAt(5) == "1")
						$('#vsgraduated').prop("checked", true);
					else
						$('#vsgraduated').prop("checked", false);
					
					if(obj.educationallevel.charAt(6) == "1")
						$('#ugstudent').prop("checked", true);
					else
						$('#ugstudent').prop("checked", false);
					
					if(obj.educationallevel.charAt(7) == "1")
						$('#uggraduated').prop("checked", true);
					else
						$('#uggraduated').prop("checked", false);
					
					if(obj.educationallevel.charAt(8) == "1")
						$('#pgstudent').prop("checked", true);
					else
						$('#pgstudent').prop("checked", false);
					
					if(obj.educationallevel.charAt(9) == "1")
						$('#pggraduated').prop("checked", true);
					else
						$('#pggraduated').prop("checked", false);
					
					if(obj.educationallevel.charAt(10) == "1")
						$('#phstudent').prop("checked", true);
					else
						$('#phstudent').prop("checked", false);
					
					if(obj.educationallevel.charAt(11) == "1")
						$('#phgraduated').prop("checked", true);
					else
						$('#phgraduated').prop("checked", false);
					
					if(obj.educationallevel.charAt(12) == "1")
						$('#upperph').prop("checked", true);
					else
						$('#upperph').prop("checked", false);
					
					if(obj.MilitaryStatus.charAt(0) == "1")
						$('#msperformed').prop("checked", true);
					else
						$('#msperformed').prop("checked", false);
					
					if(obj.MilitaryStatus.charAt(1) == "1")
						$('#msprivileged').prop("checked", true);
					else
						$('#msprivileged').prop("checked", false);
					
					if(obj.MilitaryStatus.charAt(2) == "1")
						$('#msnotperformed').prop("checked", true);
					else
						$('#msnotperformed').prop("checked", false);
					
					if(obj.MilitaryStatus.charAt(3) == "1")
						$('#msprobated').prop("checked", true);
					else
						$('#msprobated').prop("checked", false);
					
					$('#pastpositions-multiple-selected').multiselect('select', [obj.lastposition1, obj.lastposition2, obj.lastposition3, obj.lastposition4,obj.lastposition5 ]);
					$('#pastsectors-multiple-selected').multiselect('select', [obj.lastsector1, obj.lastsector2, obj.lastsector3, obj.lastsector4,obj.lastsector5 ]);
					$('#university-multiple-selected').multiselect('select', [obj.University1, obj.University2, obj.University3, obj.University4,obj.University5 ]);
					$('#universitysection-multiple-selected').multiselect('select', [obj.UniversitySection1, obj.UniversitySection2, obj.UniversitySection3, obj.UniversitySection4,obj.UniversitySection5 ]);
					$('#lang-multiple-selected').multiselect('select', [obj.foreignlanguage1, obj.foreignlanguage2, obj.foreignlanguage3, obj.foreignlanguage4,obj.foreignlanguage5 ]);
					$('#minage').val(obj.minage);
					$('#maxage').val(obj.maxage);
					
					if (obj.gender == "Erkek") {
						$('#genderman').prop("checked", true);
						$('#genderwoman').prop("checked", false);
						$('#gendersame').prop("checked", false);
					} else if (obj.gender == "Kadın") {
						$('#genderman').prop("checked", false);
						$('#genderwoman').prop("checked", true);
						$('#gendersame').prop("checked", false);
					} else {
						$('#genderman').prop("checked", false);
						$('#genderwoman').prop("checked", false);
						$('#gendersame').prop("checked", true);
					}
					
					if (obj.experience == "Tecrübeli") {
						$('#exp').prop("checked", true);
						$('#notexp').prop("checked", false);
						$('#expsame').prop("checked", false);
					} else if (obj.experience == "Tecrübesiz") {
						$('#exp').prop("checked", false);
						$('#notexp').prop("checked", true);
						$('#expsame').prop("checked", false);
					} else {
						$('#exp').prop("checked", false);
						$('#notexp').prop("checked", false);
						$('#expsame').prop("checked", true);
					}
					//document.getElementById("expandModal").innerHTML = xhttp.responseText;
				}
			};
			xhttp.open("POST", "GetAdvertModal", true);
			xhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xhttp.send("adId=" + adId);
		}
		
		function disableReadOnly() {

		
			 $("#dvdate").show();
			document.getElementById("title").readOnly = false;
			$('#jobfield-multiple-selected').multiselect('enable');
			$('#sector-multiple-selected').multiselect('enable');
			$('#pastpositions-multiple-selected').multiselect('enable');
			$('#pastsectors-multiple-selected').multiselect('enable');
			$('#university-multiple-selected').multiselect('enable');
			$('#universitysection-multiple-selected').multiselect('enable');
			$('#lang-multiple-selected').multiselect('enable');
			document.getElementById("footerButton").disabled = true;
			document.getElementById("submitButton").disabled = false;
			document.getElementById("numberofpersonnelcheckbox").disabled = false;
			document.getElementById("netsalarycheckbox").disabled = false;
			document.getElementById("psstudent").disabled = false;
			document.getElementById("psgraduated").disabled = false;
			document.getElementById("hsstudent").disabled = false;
			document.getElementById("hsgraduated").disabled = false;
			document.getElementById("vsstudent").disabled = false;
			document.getElementById("vsgraduated").disabled = false;
			document.getElementById("ugstudent").disabled = false;
			document.getElementById("uggraduated").disabled = false;
			document.getElementById("pgstudent").disabled = false;
			document.getElementById("pggraduated").disabled = false;
			document.getElementById("phstudent").disabled = false;
			document.getElementById("phgraduated").disabled = false;
			document.getElementById("upperph").disabled = false;
			document.getElementById("msperformed").disabled = false;
			document.getElementById("msprivileged").disabled = false;
			document.getElementById("msnotperformed").disabled = false;
			document.getElementById("msprobated").disabled = false;
			document.getElementById("expsame").disabled = false;
			document.getElementById("notexp").disabled = false;
			document.getElementById("exp").disabled = false;
			document.getElementById("gendersame").disabled = false;
			document.getElementById("genderwoman").disabled = false;
			document.getElementById("genderman").disabled = false;
			document.getElementById("positiontype").disabled = false;
			document.getElementById("qualifications").disabled = false;
			document.getElementById("positionlevel").disabled = false;
			document.getElementById("numberofpersonnel").readOnly = false;
			document.getElementById("netsalary").disabled = false;
			document.getElementById("province").disabled = false;
			document.getElementById("minage").readOnly = false;
			document.getElementById("maxage").readOnly = false;
			document.getElementById("dlicence").disabled = false;
			document.getElementById("city").disabled = false;
			 document.getElementById("lastapplydate").disabled = false;
			
			
		}
		
		function closeModal() {
		
			document.getElementById("title").readOnly = true;
			 $("#dvdate").hide();
			 document.getElementById("lastapplydate").disabled = true;
			 nicEditors.findEditor("qualifications").disable(true);
		        
			$('#jobfield-multiple-selected').multiselect('disable');
			$('#jobfield-multiple-selected').multiselect('deselectAll',false);
			$('#sector-multiple-selected').multiselect('disable');
			$('#sector-multiple-selected').multiselect('deselectAll',false);
			$('#pastpositions-multiple-selected').multiselect('disable');
			$('#pastpositions-multiple-selected').multiselect('deselectAll',false);
			$('#pastsectors-multiple-selected').multiselect('disable');
			$('#pastsectors-multiple-selected').multiselect('deselectAll',false);
			$('#university-multiple-selected').multiselect('disable');
			$('#university-multiple-selected').multiselect('deselectAll',false);
			$('#universitysection-multiple-selected').multiselect('disable');
			$('#universitysection-multiple-selected').multiselect('deselectAll',false);
			$('#lang-multiple-selected').multiselect('disable');
			$('#lang-multiple-selected').multiselect('deselectAll',false);
		
			document.getElementById("numberofpersonnelcheckbox").disabled = true;
		
			document.getElementById("netsalarycheckbox").disabled = true;
		
			
			document.getElementById("psstudent").disabled = true;
			document.getElementById("psgraduated").disabled = true;
			document.getElementById("hsstudent").disabled = true;
			document.getElementById("hsgraduated").disabled = true;
			document.getElementById("vsstudent").disabled = true;
			document.getElementById("vsgraduated").disabled = true;
			document.getElementById("ugstudent").disabled = true;
			document.getElementById("uggraduated").disabled = true;
			document.getElementById("pgstudent").disabled = true;
			document.getElementById("pggraduated").disabled = true;
			document.getElementById("phstudent").disabled = true;
			document.getElementById("phgraduated").disabled = true;
			document.getElementById("upperph").disabled = true;
			
			
		
			document.getElementById("msperformed").disabled = true;
			document.getElementById("msprivileged").disabled = true;
			document.getElementById("msnotperformed").disabled = true;
			document.getElementById("msprobated").disabled = true;
			document.getElementById("expsame").disabled = true;
			
			
			document.getElementById("notexp").disabled = true;
			document.getElementById("exp").disabled = true;
			document.getElementById("gendersame").disabled = true;
			document.getElementById("genderwoman").disabled = true;
			document.getElementById("genderman").disabled = true;
			document.getElementById("positiontype").disabled = true;
			document.getElementById("qualifications").disabled = true;
			
		
			document.getElementById("positionlevel").disabled = true;
			document.getElementById("numberofpersonnel").readOnly = true;
			document.getElementById("netsalary").disabled = true;
			document.getElementById("province").disabled = true;
			document.getElementById("minage").readOnly = true;
			document.getElementById("maxage").readOnly = true;
			document.getElementById("dlicence").disabled = true;
			
			///Eklenenler---->
			
			
			document.getElementById("footerButton").disabled = false;
			document.getElementById("submitButton").disabled = true;
			document.getElementById("city").disabled = true;
		
			//$('#lastapplydate').removeAttr("disabled");
	
			
		}
		
		$(function() {  
			   var window_height = $(window).height(),
			   content_height = window_height - 200;
			   $('.table').height(content_height);
			});

			$( window ).resize(function() {
			   var window_height = $(window).height(),
			   content_height = window_height - 200;
			   $('.table').height(content_height);
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

				<a class="navbar-brand"
					href="/HaritaUzerindeIsArama/employerhome.jsp"> <img
					alt="İşBurada" src="/HaritaUzerindeIsArama/images/logo.png"
					width="25" height="25">
				</a>

			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="/HaritaUzerindeIsArama/employerhome.jsp">İşBurada</a></li>
				</ul>


				<ul class="nav navbar-nav navbar-right">

					<li><a
						href="/HaritaUzerindeIsArama/addadvert.jsp"><span
							class="glyphicon glyphicon-pencil"></span> İlan Ver</a></li>
					<li class="active"><a href="/HaritaUzerindeIsArama/myadverts.jsp"><span class="glyphicon glyphicon-th-list"></span>
							İlanlarım</a></li>
					<li><a href="/HaritaUzerindeIsArama/myreferencesemployer.jsp"><span class="glyphicon glyphicon-list-alt"></span>
							Başvurular</a></li>


					<li class="dropdown"><a class="dropdown-toggle btn"
						data-toggle="dropdown" href="#"> <span
							class="glyphicon glyphicon-user"></span> <%=request.getRemoteUser()%>
							<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/HaritaUzerindeIsArama/adddepartment.jsp"><span
									class="glyphicon glyphicon-plus"></span> Şube Ekle</a></li>
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
		<br><br>
		<h1 class="text-center text-primary">İlanlarım </h1>
		<br><br>
		<div id="table"></div>
		<div id="details"></div>
	</div>


	<div class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="gridSystemModalLabel" id="myModal" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
			<form role="form" action="updateadvert" method="POST">
				<div class="modal-header">
					<button type="button" class="close" onclick="closeModal()" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">
							<br>
							<ul class="nav nav-pills nav-justified">
								<li role="presentation" class="active"><a
									data-toggle="pill" href="#menu1">İlan Bilgileri</a></li>
								<li role="presentation"><a data-toggle="pill" href="#menu2">Aday
										Bilgileri</a></li>
								<li role="presentation"><a data-toggle="pill" href="#menu3 "  onclick="showDepartment()">Yayınlama
										Bilgileri</a></li>
							</ul>
						</h4>
				</div>
				<div class="modal-body" id="expandModal">
					<div class="container-fluid">
						

						
							<div class="tab-content">

								<div id="menu1" class="tab-pane fade in active">
									<div class="row">
										<div class="col-xs-6">
											<div class="form-group">
												<div class="row">
													<div class="form-group">
														<label class="control-label col-xs-4" for="companyname">Firma
															Adı </label>
														<div class="col-xs-8">
															<input type="text" class="form-control" id="companyname"
																name="companyname"  readonly>
														</div>
													</div>
												</div>
											</div>
											<div class="form-group">
												<br>
												<div class="row">
													<div class="form-group">
														<label class="control-label col-xs-4" for="title">Duyuru
															Başlığı </label>
														<div class="col-xs-8">
															<input type="text" class="form-control" id="title"
																name="title" value="haha" readonly>
														</div>
													</div>
												</div>
												<div class="row">
													<br>
													<div class="form-group">
														<label class="control-label col-xs-4" for="jobfield">İş
															Alanı </label>
														<div class="col-xs-8 text-center">
															<select class="form-control"
																name="jobfield-multiple-selected" multiple="multiple"
																id="jobfield-multiple-selected" disabled>
																<option value="1" >Satış-Pazarlama</option>
																<option value="2" >Eğitim-Öğretim</option>
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
																<option value="22">Ön
																	Büro-Resepsiyon-Rezervasyon</option>
																<option value="23">Kasa</option>
																<option value="24">Sekreterya-Ofis Yönetimi</option>
																<option value="25">Kurs-Dershane</option>
																<option value="26">Kat Hizmetleri</option>
																<option value="27">Güvenlik Hizmetleri</option>
																<option value="28">Halkla İlişkiler</option>
																<option value="29">Yazılım Uygulama Ve
																	Geliştirme</option>
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
																<option value="60">İthalat-İhracat - Dış
																	Ticaret</option>
																<option value="61">Gayrimenkul Danışmanlığı</option>
																<option value="62">Arşiv-Dökümantasyon</option>
																<option value="63">İnce İnşaat</option>
																<option value="64">Medya Planlaması</option>
																<option value="65">Depo-Ambar-Antrepo</option>
																<option value="66">Veri Tabanı Tasarım Ve
																	Yönetimi</option>
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
																<option value="106">Alternatif Dağıtım
																	Kanalları</option>
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
																<option value="243">Radyasyon Onkoloji
																	Teknisyeni</option>
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
													</div>
												</div>
												<div class="row">
													<br>
													<div class="form-group">
														<label class="control-label col-xs-4" for="positiontype">Pozisyon
															Tipi</label>
														<div class="col-xs-8 text-center">
															<select class="form-control"
																name="positiontype"
															 id="positiontype" disabled>
																<option value="1">Sürekli/Tam Zamanlı</option>
																<option value="2">Yarı Zamanlı/Part Time</option>
																<option value="3">Dönemsel/Proje Bazlı</option>
																<option value="4">Stajyer</option>
															</select>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xs-6">
											<div class="row">
												<div class="form-group">
													<label class="control-label col-xs-4" for="sectors">Firma
														Sektörü</label>
													<div class="col-xs-8 text-center">
														<select class="form-control" multiple="multiple"
															id="sector-multiple-selected"
															name="sector-multiple-selected" disabled>
															<option value="100">Arşiv Yönetimi ve Saklama</option>
															<option value="200">Atık Yönetimi ve Geri
																Dönüşüm</option>
															<option value="300">Basım-Yayın</option>
															<option value="301">&nbsp;&nbsp;Elektronik
																Yayıncılık</option>
															<option value="302">&nbsp;&nbsp;Kitabevi</option>
															<option value="303">&nbsp;&nbsp;Matbaacılık</option>
															<option value="304">&nbsp;&nbsp;Dijital Baskı</option>
															<option value="305">&nbsp;&nbsp;Süreli Yayınlar</option>
															<option value="306">&nbsp;&nbsp;Yayıncılık</option>
															<option value="400">Bilişim</option>
															<option value="401">&nbsp;&nbsp;Bilişim
																Danışmanlığı</option>
															<option value="402">&nbsp;&nbsp;Elektronik Kart
																Sistemleri</option>
															<option value="403">&nbsp;&nbsp;İnternet</option>
															<option value="404">&nbsp;&nbsp;Makine ve
																Ekipmanlar</option>
															<option value="405">&nbsp;&nbsp;Servisler</option>
															<option value="406">&nbsp;&nbsp;Tüketici Ürünler</option>
															<option value="407">&nbsp;&nbsp;Veri Merkezi</option>
															<option value="408">&nbsp;&nbsp;Yazılım</option>
															<option value="500">Çevre</option>
															<option value="501">&nbsp;&nbsp;Atık Yönetimi</option>
															<option value="502">&nbsp;&nbsp;Çevre
																Danışmanlığı</option>
															<option value="503">&nbsp;&nbsp;Çevre Düzenleme</option>
															<option value="504">&nbsp;&nbsp;Çevre
																Laboratuvarı</option>
															<option value="505">&nbsp;&nbsp;İş Sağlığı ve
																Güvenliği</option>
															<option value="600">Danışmanlık</option>
															<option value="601">&nbsp;&nbsp;Avukatlık ve
																Hukuki Danışmanlık</option>
															<option value="602">&nbsp;&nbsp;Bilişim
																Danışmanlığı</option>
															<option value="603">&nbsp;&nbsp;Çevre
																Danışmanlığı</option>
															<option value="604">&nbsp;&nbsp;Eğitim
																Danışmanlığı</option>
															<option value="605">&nbsp;&nbsp;Finans ve
																Yatırım Danışmanlığı</option>
															<option value="606">&nbsp;&nbsp;İnsan Kaynakları
																Danışmanlığı</option>
															<option value="607">&nbsp;&nbsp;Pazarlama
																Danışmanlığı</option>
															<option value="608">&nbsp;&nbsp;Yönetim
																Danışmanlığı</option>
															<option value="700">Dayanıklı Tüketim Ürünleri</option>
															<option value="800">Denizcilik</option>
															<option value="801">&nbsp;&nbsp;Deniz
																Taşımacılığı</option>
															<option value="802">&nbsp;&nbsp;Deniz Ürünleri</option>
															<option value="803">&nbsp;&nbsp;Gemi Acentaları</option>
															<option value="804">&nbsp;&nbsp;Liman
																İşletmeleri ve Hizmetleri</option>
															<option value="805">&nbsp;&nbsp;Tersane / Gemi
																İnşa</option>
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
															<option value="1001">&nbsp;&nbsp; Çocuk Gelişim
																ve Eğitimi</option>
															<option value="1002">&nbsp;&nbsp; Eğitim
																Danışmanlığı</option>
															<option value="1003">&nbsp;&nbsp; Eğitim
																Kurumları</option>
															<option value="1004">&nbsp;&nbsp;&nbsp;&nbsp;
																Dershane ve Kurslar</option>
															<option value="1005">&nbsp;&nbsp;&nbsp;&nbsp;
																Okullar</option>
															<option value="1006">&nbsp;&nbsp;&nbsp;&nbsp;
																Üniversiteler</option>
															<option value="1007">&nbsp;&nbsp; Öğrenci
																Yurtları</option>
															<option value="1008">&nbsp;&nbsp; Yurtdışı
																Eğitim Danışmanlığı</option>
															<option value="1100">Eğlence - Kültür - Sanat</option>
															<option value="1101">&nbsp;&nbsp; Eğlence
																Hizmetleri</option>
															<option value="1102">&nbsp;&nbsp; Eğlence
																Tesisleri</option>
															<option value="1103">&nbsp;&nbsp;&nbsp;&nbsp;
																Alışveriş Merkezleri</option>
															<option value="1104">&nbsp;&nbsp;&nbsp;&nbsp;
																Restaurant-Bar-Cafe</option>
															<option value="1105">&nbsp;&nbsp; Müzik ve Müzik
																Organizasyon</option>
															<option value="1106">&nbsp;&nbsp; Sinema -
																Tiyatro</option>
															<option value="1200">Elektrik & Elektronik</option>
															<option value="1201">&nbsp;&nbsp; Akü - Pil -
																Batarya</option>
															<option value="1202">&nbsp;&nbsp; Aydınlatma</option>
															<option value="1203">&nbsp;&nbsp; Barkod</option>
															<option value="1204">&nbsp;&nbsp; Elektrik -
																Elektronik Malzemeleri</option>
															<option value="1205">&nbsp;&nbsp; Elektrik
																Üretim ve Dağıtımı</option>
															<option value="1206">&nbsp;&nbsp; Elektrikli ve
																Elektronik Aletler</option>
															<option value="1207">&nbsp;&nbsp; Isıtma,
																Havalandırma ve Klima</option>
															<option value="1208">&nbsp;&nbsp; Işık,Görüntü
																ve Ses Sistemleri</option>
															<option value="1209">&nbsp;&nbsp; Kablo ve Tel</option>
															<option value="1210">&nbsp;&nbsp; Otomasyon</option>
															<option value="1211">&nbsp;&nbsp; Ölçü ve
																Kontrol Sistemleri</option>
															<option value="1212">&nbsp;&nbsp; Proje Taahhüt</option>
															<option value="1300">Enerji</option>
															<option value="1301">&nbsp;&nbsp; Enerji Üretim
																ve Dağıtım</option>
															<option value="1302">&nbsp;&nbsp; Gaz Sanayi</option>
															<option value="1303">&nbsp;&nbsp;&nbsp;&nbsp;
																Doğalgaz</option>
															<option value="1304">&nbsp;&nbsp; Jeneratör</option>
															<option value="1305">&nbsp;&nbsp; Petrol ve
																Ürünleri</option>
															<option value="1306">&nbsp;&nbsp; Yenilebilir
																Enerji</option>
															<option value="1400">Ev Eşyaları</option>
															<option value="1401">&nbsp;&nbsp; Beyaz Eşyalar</option>
															<option value="1402">&nbsp;&nbsp; Elektrikli Ev
																Aletleri</option>
															<option value="1403">&nbsp;&nbsp;Ev Tekstili</option>
															<option value="1404">&nbsp;&nbsp;Halı / Kilim</option>
															<option value="1405">&nbsp;&nbsp;Mutfak
																Gereçleri</option>
															<option value="1406">&nbsp;&nbsp;Yatak ve Yan
																Ürünleri</option>
															<option value="1407">&nbsp;&nbsp;Züccaciye</option>
															<option value="1500">Finans - Ekonomi</option>
															<option value="1501">&nbsp;&nbsp;Bankacılık</option>
															<option value="1502">&nbsp;&nbsp;Borsa</option>
															<option value="1503">&nbsp;&nbsp;Faktoring</option>
															<option value="1504">&nbsp;&nbsp; Finans ve
																Yatırım Danışmanlığı</option>
															<option value="1505">&nbsp;&nbsp;Leasing /
																Finansal Kiralama</option>
															<option value="1506">&nbsp;&nbsp;Yatırım</option>
															<option value="1600">Gıda</option>
															<option value="1601">&nbsp;&nbsp;Bebek Besinleri</option>
															<option value="1602">&nbsp;&nbsp;Bisküvi,
																Çikolata ve Şekerleme</option>
															<option value="1603">&nbsp;&nbsp;Catering</option>
															<option value="1604">&nbsp;&nbsp;Çay Sanayi</option>
															<option value="1605">&nbsp;&nbsp;Deniz Ürünleri</option>
															<option value="1606">&nbsp;&nbsp;Et ve Et
																Ürünleri</option>
															<option value="1607">&nbsp;&nbsp;Gıda Hizmetleri</option>
															<option value="1608">&nbsp;&nbsp;Gıda Makine /
																Ekipmanları</option>
															<option value="1609">&nbsp;&nbsp;İçecek</option>
															<option value="1610">&nbsp;&nbsp;&nbsp;&nbsp;
																Alkollü İçecek</option>
															<option value="1611">&nbsp;&nbsp;Kuruyemiş
																Sektörü</option>
															<option value="1612">&nbsp;&nbsp;Pastane</option>
															<option value="1613">&nbsp;&nbsp;Restaurant -
																Cafe - Bar</option>
															<option value="1614">&nbsp;&nbsp;Su Ürünleri</option>
															<option value="1615">&nbsp;&nbsp;Süt ve Süt
																Ürünleri</option>
															<option value="1616">&nbsp;&nbsp;Tavukçuluk ve
																Yumurta</option>
															<option value="1617">&nbsp;&nbsp;Un ve Unlu
																Mamülleri</option>
															<option value="1700">Güvenlik</option>
															<option value="1701">&nbsp;&nbsp;Elektronik
																Güvenlik Sistemleri</option>
															<option value="1702">&nbsp;&nbsp;Güvenlik
																Hizmetleri</option>
															<option value="1703">&nbsp;&nbsp;İş Güvenliği
																Ekipmanları</option>
															<option value="1800">Havacılık</option>
															<option value="1801">&nbsp;&nbsp;Hava
																Taşımacılığı</option>
															<option value="1802">&nbsp;&nbsp;Uzay
																Teknolojileri</option>
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
															<option value="2003">&nbsp;&nbsp;Çeviri
																Hizmetleri</option>
															<option value="2004">&nbsp;&nbsp;Dağıtım
																Hizmetleri</option>
															<option value="2005">&nbsp;&nbsp;Denetim
																Hizmetleri</option>
															<option value="2006">&nbsp;&nbsp;Eğlence
																Hizmetleri</option>
															<option value="2007">&nbsp;&nbsp;Gayrımenkul,
																Emlak İşleri</option>
															<option value="2008">&nbsp;&nbsp;&nbsp;&nbsp;
																Emlak Geliştirme</option>
															<option value="2009">&nbsp;&nbsp;&nbsp;&nbsp;
																Gayrımenkul Değerleme</option>
															<option value="2010">&nbsp;&nbsp;Gıda Hizmetleri</option>
															<option value="2011">&nbsp;&nbsp;Gümrük
																Hizmetleri</option>
															<option value="2012">&nbsp;&nbsp;Mali Müşavirlik
																- Muhasebe</option>
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
															<option value="2019">&nbsp;&nbsp;Sağlık
																Hizmetleri</option>
															<option value="2020">&nbsp;&nbsp;Temizlik
																Hizmetleri</option>
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
															<option value="2307">&nbsp;&nbsp;&nbsp;&nbsp;
																Oto Lastiği</option>
															<option value="2308">&nbsp;&nbsp;Plastik ve
																Ürünleri</option>
															<option value="2309">&nbsp;&nbsp;Temizlik
																Malzemeleri</option>
															<option value="2310">&nbsp;&nbsp;Yapı
																Kimyasalları</option>
															<option value="2400">Maden ve Metal Sanayi</option>
															<option value="2401">&nbsp;&nbsp;Değerli
																Madenler ve Mamülleri / Kuyumculuk</option>
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
															<option value="2409">&nbsp;&nbsp;&nbsp;&nbsp;
																Demir- Çelik</option>
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
															<option value="2507">&nbsp;&nbsp;Seri İlan
																Ajansları</option>
															<option value="2600">Mobilya & Aksesuar</option>
															<option value="2601">&nbsp;&nbsp;Aksesuar</option>
															<option value="2602">&nbsp;&nbsp;Bahçe
																Mobilyaları</option>
															<option value="2603">&nbsp;&nbsp;Ev Mobilyaları</option>
															<option value="2604">&nbsp;&nbsp;Ofis
																Mobilyaları</option>
															<option value="2605">&nbsp;&nbsp;Şehir
																Mobilyaları</option>
															<option value="2700">Ofis / Büro Malzemeleri</option>
															<option value="2701">&nbsp;&nbsp;Büro Makineleri</option>
															<option value="2702">&nbsp;&nbsp;Kırtasiye</option>
															<option value="2703">&nbsp;&nbsp;Ofis Mobilyası
																ve Dekorasyonu</option>
															<option value="2800">Orman Ürünleri</option>
															<option value="2801">&nbsp;&nbsp;Ağaç - Kereste</option>
															<option value="2802">&nbsp;&nbsp;Kağıt ve
																Selüloz Sanayi</option>
															<option value="2900">Otomotiv</option>
															<option value="2901">&nbsp;&nbsp;Bisiklet ve
																Motosiklet</option>
															<option value="2902">&nbsp;&nbsp;Oto
																Aksesuarları</option>
															<option value="2903">&nbsp;&nbsp;Oto Kiralama</option>
															<option value="2904">&nbsp;&nbsp;Oto Lastiği</option>
															<option value="2905">&nbsp;&nbsp;Oto Yedek Parça
																ve Yan Sanayi</option>
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
															<option value="3104">&nbsp;&nbsp;Halkla
																İlişkiler</option>
															<option value="3105">&nbsp;&nbsp;Manken
																Ajansları</option>
															<option value="3106">&nbsp;&nbsp;Organizasyon ve
																Animasyon Hizmetleri</option>
															<option value="3107">&nbsp;&nbsp;Promosyon
																Ürünleri</option>
															<option value="3108">&nbsp;&nbsp;Reklamcılık</option>
															<option value="3109">&nbsp;&nbsp;Teşhir
																Malzemeleri</option>
															<option value="3200">Sağlık</option>
															<option value="3201">&nbsp;&nbsp;Bakım, Diyet ve
																Güzellik Merkezleri</option>
															<option value="3202">&nbsp;&nbsp;Dermokozmetik</option>
															<option value="3203">&nbsp;&nbsp;İlaç Sanayi</option>
															<option value="3204">&nbsp;&nbsp;&nbsp;&nbsp;
																Biyoteknoloji</option>
															<option value="3205">&nbsp;&nbsp;&nbsp;&nbsp;
																Ecza Depoları ve Eczaneler</option>
															<option value="3206">&nbsp;&nbsp;İş Güvenliği ve
																Sağlığı</option>
															<option value="3207">&nbsp;&nbsp;Medikal Ürünler</option>
															<option value="3208">&nbsp;&nbsp;Optik</option>
															<option value="3209">&nbsp;&nbsp;Sağlık
																Hizmetleri</option>
															<option value="3210">&nbsp;&nbsp;&nbsp;&nbsp;
																Ambulans Servisleri</option>
															<option value="3211">&nbsp;&nbsp;&nbsp;&nbsp;
																Evde Bakım Hizmetleri</option>
															<option value="3212">&nbsp;&nbsp;Sağlık
																Kuruluşları</option>
															<option value="3213">&nbsp;&nbsp;&nbsp;&nbsp;
																Hastaneler</option>
															<option value="3214">&nbsp;&nbsp;&nbsp;&nbsp;
																Klinikler</option>
															<option value="3215">&nbsp;&nbsp;&nbsp;&nbsp;
																Veterinerler</option>
															<option value="3216">&nbsp;&nbsp;Tıbbi Cihaz ve
																Malzemeler</option>
															<option value="3217">&nbsp;&nbsp;Tıbbi
																Laboratuarlar</option>
															<option value="3300">Sigortacılık</option>
															<option value="3301">&nbsp;&nbsp;Elementer</option>
															<option value="3302">&nbsp;&nbsp;Hayat ve
																Emeklilik</option>
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
															<option value="3502">&nbsp;&nbsp;Deniz
																Taşımacılığı</option>
															<option value="3503">&nbsp;&nbsp;Depo - Antrepo</option>
															<option value="3504">&nbsp;&nbsp;Gümrük
																Hizmetleri</option>
															<option value="3505">&nbsp;&nbsp;Hava
																Taşımacılığı</option>
															<option value="3506">&nbsp;&nbsp;Karayolu
																Taşımacılığı</option>
															<option value="3507">&nbsp;&nbsp;Kargo - Kurye</option>
															<option value="3508">&nbsp;&nbsp;Lojistik</option>
															<option value="3509">&nbsp;&nbsp;Nakliye</option>
															<option value="3510">&nbsp;&nbsp;Otobüs
																Şirketleri</option>
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
															<option value="3606">&nbsp;&nbsp;&nbsp;&nbsp;
																Çorap Sanayi</option>
															<option value="3607">&nbsp;&nbsp;&nbsp;&nbsp;
																Hazır Giyim</option>
															<option value="3608">&nbsp;&nbsp;&nbsp;&nbsp;
																Mağazacılık (Tekstil)</option>
															<option value="3609">&nbsp;&nbsp;&nbsp;&nbsp;
																Moda Tasarım</option>
															<option value="3610">&nbsp;&nbsp;Kumaş & İplik</option>
															<option value="3611">&nbsp;&nbsp;Tekstil Boya ve
																Kimyasalları</option>
															<option value="3612">&nbsp;&nbsp;Tekstil
																Makineleri ve Parçaları</option>
															<option value="3700">Telekomünikasyon</option>
															<option value="3701">&nbsp;&nbsp;Çağrı Merkezi
																Ürün ve Hizmetleri</option>
															<option value="3702">&nbsp;&nbsp;Makine ve
																Ekipmanlar</option>
															<option value="3703">&nbsp;&nbsp;Network Proje
																Hizmetleri</option>
															<option value="3704">&nbsp;&nbsp;Servis
																Sağlayıcılar</option>
															<option value="3705">&nbsp;&nbsp;Tüketici
																Ürünleri</option>
															<option value="3706">&nbsp;&nbsp;Cep Telefonları
																ve Aksesuarları</option>
															<option value="3800">Ticaret</option>
															<option value="3801">&nbsp;&nbsp;Alışveriş
																Merkezi</option>
															<option value="3802">&nbsp;&nbsp;E-ticaret</option>
															<option value="3803">&nbsp;&nbsp;İç Ticaret</option>
															<option value="3804">&nbsp;&nbsp;İthalat -
																İhracat</option>
															<option value="3805">&nbsp;&nbsp;Mağazacılık
																(Ticaret)</option>
															<option value="3806">&nbsp;&nbsp;Market</option>
															<option value="3900">Topluluklar</option>
															<option value="3901">&nbsp;&nbsp;Birlikler</option>
															<option value="3902">&nbsp;&nbsp;Dernekler</option>
															<option value="3903">&nbsp;&nbsp;Holding /
																Şirketler Grubu</option>
															<option value="3904">&nbsp;&nbsp;Sivil Toplum
																Kuruluşları</option>
															<option value="3905">&nbsp;&nbsp;Vakıflar</option>
															<option value="4000">Turizm</option>
															<option value="4001">&nbsp;&nbsp;Konaklama ve
																Otelcilik</option>
															<option value="4002">&nbsp;&nbsp;Otel
																Ekipmanları</option>
															<option value="4003">&nbsp;&nbsp;Seyahat
																Acentaları</option>
															<option value="4004">&nbsp;&nbsp;Yiyecek
																Hizmetleri</option>
														</select> <span id="msg"></span>
													</div>
												</div>
											</div>
											<div class="row">
												<br>
												<div class="form-group">
													<label class="control-label col-xs-4" for="positionlevel">Pozisyon
														Seviyesi</label>
													<div class="col-xs-8">
														<select class="form-control" id='positionlevel'
															name="positionlevel" disabled>
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
											</div>
											<div class="row">
												<br>
												<div class="form-group">
													<label class="control-label col-xs-4"
														for="numberofpersonnel"> İşe Alınacak Personel
														Sayısı</label>
													<div class="col-xs-4">
														<input type="text" class="form-control"
															id="numberofpersonnel" name="numberofpersonnel" readonly>
													</div>
													<div class="col-xs-4">
														<input type="checkbox" name="numberofpersonnelcheckbox"
															id="numberofpersonnelcheckbox" value="numberofpersonnelcheckbox" disabled>
														&nbsp; Aday Görebilsin
													</div>
												</div>
											</div>
											<div class="row">
												<br>
												<div class="form-group">
													<label class="control-label col-xs-4" for="netsalary">
														Net Maaş Aralığı</label>
													<div class="col-xs-4">
														<select class="form-control" id='netsalary'
															name="netsalary" disabled>
															<option value="1">0-1000</option>
															<option value="2">1000-2000</option>
															<option value="3">2000-3000</option>
															<option value="4">3000-4000</option>
															<option value="5">4000-5000</option>
															<option value="6">5000+</option>
														</select>
													</div>
													<div class="col-xs-4">
														<label class="checkbox-inline"> <input
															type="checkbox" id="netsalarycheckbox"
															name="netsalarycheckbox" value="netsalarycheckbox" disabled>
															Aday Görebilsin
														</label>
													</div>
												</div>
											</div>
											<div class="row"></div>
										</div>

									</div>

									<div class="row">
										<br>
										<div class="form-group">
											<label class="control-label col-xs-4" for="qualifications">
												Genel Nitelikler</label>
											<div class="col-xs-8" >
												<textarea  name="qualifications" id="qualifications"
													style="width: 500px; height: 100%;" ></textarea>
											</div>
										</div>
									</div>
								</div>
								<div id="menu2" class="tab-pane fade">
									<div class="row">
										<div class="col-xs-6">
											<div class="form-group">
												<div class="row">
													<div class="col-xs-4">
														<h5>
															<b>Eğitim Durumu</b>
														</h5>
													</div>
													<div class="col-xs-3 text-center">
														<h5>Öğrenci</h5>
													</div>
													<div class="col-xs-3 text-center">
														<h5>Mezun</h5>
													</div>
												</div>
												<div class="row">
													<div class="col-xs-4">İlköğretim</div>
													<div class="col-xs-3 text-center">
														<input name="psstudent" id="psstudent" type="checkbox"
															value="1" disabled>
													</div>
													<div class="col-xs-3 text-center">
														<input name="psgraduated" id="psgraduated" type="checkbox"
															value="1" disabled>
													</div>
												</div>
												<div class="row">
													<div class="col-xs-4">Lise</div>
													<div class="col-xs-3 text-center">
														<input name="hsstudent" id="hsstudent" type="checkbox"
															value="1" disabled>
													</div>
													<div class="col-xs-3 text-center">
														<input name="hsgraduated" id="hsgraduated" type="checkbox"
															value="1" disabled>
													</div>
												</div>
												<div class="row">
													<div class="col-xs-4">M.Y.O.</div>
													<div class="col-xs-3 text-center">
														<input name="vsstudent" id="vsstudent" type="checkbox"
															value="1" disabled>
													</div>
													<div class="col-xs-3 text-center">
														<input name="vsgraduated" id="vsgraduated" type="checkbox"
															value="1" disabled>
													</div>
												</div>
												<div class="row">
													<div class="col-xs-4">Üniversite</div>
													<div class="col-xs-3 text-center">
														<input name="ugstudent" id="ugstudent" type="checkbox"
															value="1" disabled>
													</div>
													<div class="col-xs-3 text-center">
														<input name="uggraduated" id="uggraduated" type="checkbox"
															value="1" disabled>
													</div>
												</div>
												<div class="row">
													<div class="col-xs-4">Yüksek Lisans</div>
													<div class="col-xs-3 text-center">
														<input name="pgstudent" id="pgstudent" type="checkbox"
															value="1" disabled>
													</div>
													<div class="col-xs-3 text-center">
														<input name="pggraduated" id="pggraduated" type="checkbox"
															value="1" disabled>
													</div>
												</div>
												<div class="row">
													<div class="col-xs-4">Doktora</div>
													<div class="col-xs-3 text-center">
														<input name="phstudent" id="phstudent" type="checkbox"
															value="1" disabled>
													</div>
													<div class="col-xs-3 text-center">
														<input name="phgraduated" id="phgraduated" type="checkbox"
															value="1" disabled>
													</div>
													<div class="col-xs-2 pull-left">
														<input name="upperph" id="upperph" type="checkbox"
															value="1" disabled> ve üstü
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="row">
													<br>
													<div class="col-xs-4">
														<h5>
															<b>İş Tecrübesindeki Pozisyon (Geçmiş)</b>
														</h5>
													</div>
													<div class="col-xs-8 text-center">
														<select class="form-control"
															name="pastpositions-multiple-selected"
															id="pastpositions-multiple-selected" multiple="multiple" disabled>
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
												<div class="row">
													<br>
													<div class="col-xs-4">
														<h5>
															<b>İş Tecrübesindeki Sektör (Geçmiş)</b>
														</h5>
													</div>
													<div class="col-xs-8 text-center">
														<select class="form-control"
															name="pastsectors-multiple-selected"
															id="pastsectors-multiple-selected" multiple="multiple" disabled>
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
												</div>
												<div class="row">
													<br>
													<div class="col-xs-4">
														<h5>
															<b>Üniversite</b>
														</h5>
													</div>
													<div class="col-xs-8 text-center">
														<select class="form-control"
															name="university-multiple-selected"
															id="university-multiple-selected" multiple="multiple" disabled>
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
												<div class="row">
													<br>
													<div class="col-xs-4">
														<h5>
															<b>Üniversite Bölüm</b>
														</h5>
													</div>
													<div class="col-xs-8 text-center">
														<select class="form-control"
															name="universitysection-multiple-selected"
															id="universitysection-multiple-selected"
															multiple="multiple" disabled>
															<option value="156">Aile ve Tüketici Bilimleri</option>
															<option value="158">Aktüerya Bilimleri</option>
															<option value="76">Alman Dili ve Edebiyatı</option>
															<option value="68">Almanca Öğretmenliği</option>
															<option value="104">Amerikan Kültürü ve
																Edebiyatı</option>
															<option value="82">Antropoloji</option>
															<option value="77">Arap Dili ve Edebiyatı</option>
															<option value="150">Arapça Öğretmenliği</option>
															<option value="27">Arkeoloji</option>
															<option value="192">Arnavutça</option>
															<option value="98">Astronomi ve Uzay Bilimleri</option>
															<option value="235">Avrupa Birliği İlişkileri</option>
															<option value="180">Azerbaycan Türkçesi ve
																Edebiyatı</option>
															<option value="38">Bahçe Bitkileri</option>
															<option value="183">Balıkçılık Teknolojisi
																Mühendisliği</option>
															<option value="71">Basın ve Yayın</option>
															<option value="91">Bilgi ve Belge Yönetimi</option>
															<option value="106">Bilgisayar Mühendisliği</option>
															<option value="237">Bilgisayar ve Enformasyon
																Sistemleri</option>
															<option value="18">Bilgisayar ve Öğretim
																Teknolojileri Öğretmenliği</option>
															<option value="166">Bilim Tarihi</option>
															<option value="189">Bilişim Sistemleri
																Mühendisliği</option>
															<option value="39">Bitki Koruma</option>
															<option value="240">Bitkisel Üretim ve
																Teknolojileri</option>
															<option value="138">Biyokimya</option>
															<option value="26">Biyoloji</option>
															<option value="114">Biyoloji Öğretmenliği</option>
															<option value="143">Biyomedikal Mühendisliği</option>
															<option value="140">Biyomühendislik</option>
															<option value="154">Biyosistem Mühendisliği</option>
															<option value="191">Boşnakça</option>
															<option value="78">Bulgar Dili ve Edebiyatı</option>
															<option value="49">Çağdaş Türk Lehçeleri ve
																Edebiyatları</option>
															<option value="79">Çağdaş Yunan Dili ve
																Edebiyatı</option>
															<option value="64">Çalışma Ekonomisi ve Endüstri
																İlişkileri</option>
															<option value="177">Cevher Hazırlama
																Mühendisliği</option>
															<option value="126">Çeviribilim</option>
															<option value="21">Çevre Mühendisliği</option>
															<option value="142">Çin Dili ve Edebiyatı</option>
															<option value="45">Coğrafya</option>
															<option value="115">Coğrafya Öğretmenliği</option>
															<option value="139">Deri Mühendisliği</option>
															<option value="80">Dilbilim</option>
															<option value="165">Dilbilimi</option>
															<option value="25">Diş Hekimliği</option>
															<option value="109">Dünya Dinleri</option>
															<option value="67">Eczacılık</option>
															<option value="65">Ekonometri</option>
															<option value="208">Ekonomi</option>
															<option value="207">Ekonomi ve Finans</option>
															<option value="169">Elektrik Mühendisliği</option>
															<option value="24">Elektrik-Elektronik
																Mühendisliği</option>
															<option value="99">Elektronik Mühendisliği</option>
															<option value="178">Elektronik ve Haberleşme
																Mühendisliği</option>
															<option value="74">Endüstri Mühendisliği</option>
															<option value="225">Endüstri Sistemleri
																Mühendisliği</option>
															<option value="152">Endüstri Ürünleri Tasarımı</option>
															<option value="72">Endüstriyel Tasarım</option>
															<option value="146">Enerji Sistemleri
																Mühendisliği</option>
															<option value="161">Ergoterapi</option>
															<option value="144">Ermeni Dili ve Edebiyatı</option>
															<option value="199">Eşit Ağırlıklı Programlar</option>
															<option value="59">Eski Yunan Dili ve Edebiyatı</option>
															<option value="81">Fars Dili ve Edebiyatı</option>
															<option value="33">Felsefe</option>
															<option value="116">Felsefe Grubu Öğretmenliği</option>
															<option value="1">Fen Bilgisi Öğretmenliği</option>
															<option value="34">Fizik</option>
															<option value="100">Fizik Mühendisliği</option>
															<option value="117">Fizik Öğretmenliği</option>
															<option value="32">Fransız Dili ve Edebiyatı</option>
															<option value="69">Fransızca Öğretmenliği</option>
															<option value="153">Gastronomi ve Mutfak
																Sanatları</option>
															<option value="63">Gazetecilik</option>
															<option value="176">Gemi İnşaatı ve Gemi
																Makineleri Mühendisliği</option>
															<option value="168">Gemi Makineleri İşletme
																Mühendisliği</option>
															<option value="179">Gemi ve Deniz Teknolojisi
																Mühendisliği</option>
															<option value="214">Gemi ve Yat Tasarımı</option>
															<option value="219">Genetik ve Biyomühendislik</option>
															<option value="129">Geomatik Mühendisliği</option>
															<option value="66">Gerontoloji</option>
															<option value="17">Gıda Mühendisliği</option>
															<option value="151">Görme Engelliler
																Öğretmenliği</option>
															<option value="204">Görsel İletişim</option>
															<option value="226">Görsel İletişim Tasarımı</option>
															<option value="132">Grafik</option>
															<option value="181">Gürcü Dili ve Edebiyatı</option>
															<option value="83">Halkbilim</option>
															<option value="228">Halkla İlişkiler</option>
															<option value="55">Halkla İlişkiler ve Tanıtım</option>
															<option value="53">Harita Mühendisliği</option>
															<option value="186">Havacılık ve Uzay
																Mühendisliği</option>
															<option value="221">Hemşirelik ve Sağlık
																Hizmetleri</option>
															<option value="157">Hidrojeoloji Mühendisliği</option>
															<option value="84">Hindoloji</option>
															<option value="85">Hititoloji</option>
															<option value="56">Hukuk</option>
															<option value="86">Hungaroloji</option>
															<option value="145">İbrani Dili ve Edebiyatı</option>
															<option value="133">İç Mimarlık</option>
															<option value="159">İç Mimarlık ve Çevre
																Tasarımı</option>
															<option value="9">İktisat</option>
															<option value="102">İlahiyat</option>
															<option value="148">İletişim</option>
															<option value="210">İletişim Sanatları</option>
															<option value="201">İletişim Tasarımı</option>
															<option value="73">İletişim Tasarımı ve Yönetimi</option>
															<option value="206">İletişim ve Tasarım</option>
															<option value="103">İlköğretim Din Kültürü ve
																Ahlak Bilgisi Öğretmenliği</option>
															<option value="2">İlköğretim Matematik
																Öğretmenliği</option>
															<option value="175">İmalat Mühendisliği</option>
															<option value="155">İngiliz Dil Bilimi</option>
															<option value="87">İngiliz Dili ve Edebiyatı</option>
															<option value="213">İngiliz Dili ve
																Karşılaştırmalı Edebiyat</option>
															<option value="3">İngilizce Öğretmenliği</option>
															<option value="54">İnşaat Mühendisliği</option>
															<option value="70">İşitme Engelliler
																Öğretmenliği</option>
															<option value="10">İşletme</option>
															<option value="209">İşletme Enformatiği</option>
															<option value="171">İşletme Mühendisliği</option>
															<option value="88">İspanyol Dili ve Edebiyatı</option>
															<option value="47">İstatistik</option>
															<option value="182">İstatistik ve Bilgisayar
																Bilimleri</option>
															<option value="89">İtalyan Dili ve Edebiyatı</option>
															<option value="105">Japon Dili ve Edebiyatı</option>
															<option value="130">Japonca Öğretmenliği</option>
															<option value="195">Jeodezi ve Fotogrametri
																Mühendisliği</option>
															<option value="101">Jeofizik Mühendisliği</option>
															<option value="57">Jeoloji Mühendisliği</option>
															<option value="11">Kamu Yönetimi</option>
															<option value="187">Karşılaştırmalı Edebiyat</option>
															<option value="230">Kentsel Tasarım ve Peyzaj
																Mimarisi</option>
															<option value="30">Kimya</option>
															<option value="52">Kimya Mühendisliği</option>
															<option value="118">Kimya Öğretmenliği</option>
															<option value="197">Kimya ve Süreç Mühendisliği</option>
															<option value="110">Klasik Arkeoloji</option>
															<option value="174">Kontrol Mühendisliği</option>
															<option value="194">Kontrol ve Otomasyon
																Mühendisliği</option>
															<option value="90">Kore Dili ve Edebiyatı</option>
															<option value="92">Latin Dili ve Edebiyatı</option>
															<option value="93">Leh Dili ve Edebiyatı</option>
															<option value="223">Lojistik Yönetimi</option>
															<option value="46">Maden Mühendisliği</option>
															<option value="22">Makine Mühendisliği</option>
															<option value="198">Makine ve İmalat
																Mühendisliği</option>
															<option value="29">Maliye</option>
															<option value="50">Malzeme Bilimi ve
																Mühendisliği</option>
															<option value="127">Malzeme Mühendisliği</option>
															<option value="31">Matematik</option>
															<option value="170">Matematik Mühendisliği</option>
															<option value="119">Matematik Öğretmenliği</option>
															<option value="188">Matematik ve Bilgisayar
																Bilimleri</option>
															<option value="202">Matematik-Bilgisayar</option>
															<option value="224">Medya ve İletişim</option>
															<option value="227">Medya ve İletişim Sistemleri</option>
															<option value="147">Mekatronik Mühendisliği</option>
															<option value="123">Metalurji ve Malzeme
																Mühendisliği</option>
															<option value="172">Meteoroloji Mühendisliği</option>
															<option value="23">Mimarlık</option>
															<option value="122">Moleküler Biyoloji ve
																Genetik</option>
															<option value="232">Muhasebe ve Finans Yönetimi</option>
															<option value="215">Mühendislik ve Doğa
																Bilimleri Programları</option>
															<option value="167">Odyoloji</option>
															<option value="4">Okul Öncesi Öğretmenliği</option>
															<option value="162">Orman Endüstrisi
																Mühendisliği</option>
															<option value="163">Orman Mühendisliği</option>
															<option value="190">Otomotiv Mühendisliği</option>
															<option value="184">Özel Eğitim Öğretmenliği</option>
															<option value="185">Petrol ve Doğalgaz
																Mühendisliği</option>
															<option value="58">Peyzaj Mimarlığı</option>
															<option value="234">Pilotaj</option>
															<option value="200">Polimer Mühendisliği</option>
															<option value="111">Prehistorya</option>
															<option value="112">Protohistorya ve Ön Asya
																Arkeolojisi</option>
															<option value="14">Psikoloji</option>
															<option value="239">Radyo ve Televizyon</option>
															<option value="60">Radyo, Televizyon ve Sinema</option>
															<option value="196">Raylı Sistemler Mühendisliği</option>
															<option value="12">Rehberlik ve Psikolojik
																Danışmanlık</option>
															<option value="220">Reklam Tasarımı ve İletişimi</option>
															<option value="141">Reklamcılık</option>
															<option value="238">Reklamcılık ve Halkla
																İlişkiler</option>
															<option value="61">Rekreasyon</option>
															<option value="75">Rus Dili ve Edebiyatı</option>
															<option value="160">Sağlık İdaresi</option>
															<option value="37">Sanat Tarihi</option>
															<option value="216">Sanat ve Sosyal Bilimler
																Programları</option>
															<option value="231">Sanat ve Tasarım Yönetimi</option>
															<option value="211">Sanat Yönetimi</option>
															<option value="136">Şehir ve Bölge Planlama</option>
															<option value="134">Seramik</option>
															<option value="137">Seramik Mühendisliği</option>
															<option value="51">Sinema ve Televizyon</option>
															<option value="5">Sınıf Öğretmenliği</option>
															<option value="94">Sinoloji</option>
															<option value="218">Sistem Mühendisliği</option>
															<option value="149">Siyaset Bilimi</option>
															<option value="107">Siyaset Bilimi ve Kamu
																Yönetimi</option>
															<option value="125">Siyaset Bilimi ve
																Uluslararası İlişkiler</option>
															<option value="6">Sosyal Bilgiler Öğretmenliği</option>
															<option value="20">Sosyoloji</option>
															<option value="62">Su Ürünleri Mühendisliği</option>
															<option value="95">Sümeroloji</option>
															<option value="113">Süt Teknolojisi</option>
															<option value="16">Tarih</option>
															<option value="120">Tarih Öğretmenliği</option>
															<option value="36">Tarım Ekonomisi</option>
															<option value="40">Tarım Makineleri</option>
															<option value="124">Tarımsal Biyoteknoloji</option>
															<option value="41">Tarımsal Yapılar ve Sulama</option>
															<option value="42">Tarla Bitkileri</option>
															<option value="131">Tekstil Mühendisliği</option>
															<option value="135">Tekstil Tasarım</option>
															<option value="205">Televizyon Haberciliği ve
																Programcılığı</option>
															<option value="15">Tıp</option>
															<option value="43">Toprak Bilimi ve Bitki
																Besleme</option>
															<option value="35">Turizm Rehberliği</option>
															<option value="19">Türk Dili ve Edebiyatı</option>
															<option value="121">Türk Dili ve Edebiyatı
																Öğretmenliği</option>
															<option value="128">Türk Halkbilimi</option>
															<option value="7">Türkçe Öğretmenliği</option>
															<option value="173">Uçak Mühendisliği</option>
															<option value="233">Uluslararası Girişimcilik</option>
															<option value="13">Uluslararası İlişkiler</option>
															<option value="222">Uluslararası İlişkiler ve
																Avrupa Birliği</option>
															<option value="236">Uluslararası İşletmecilik</option>
															<option value="229">Uluslararası Lojistik</option>
															<option value="212">Uluslararası Ticaret ve
																Finans</option>
															<option value="48">Uluslararası Ticaret ve
																Finansman</option>
															<option value="96">Urdu Dili ve Edebiyatı</option>
															<option value="164">Üstün Zekalılar Öğretmenliği</option>
															<option value="28">Veterinerlik</option>
															<option value="108">Yaygın Din Öğretimi ve
																Uygulamaları</option>
															<option value="203">Yazılım Mühendisliği</option>
															<option value="217">Yönetim Bilimleri
																Programları</option>
															<option value="97">Yunan Dili ve Edebiyatı</option>
															<option value="193">Yunanca</option>
															<option value="8">Zihin Engelliler Öğretmenliği</option>
															<option value="44">Zootekni</option>

														</select>
													</div>
												</div>

											</div>
										</div>
										<div class="col-xs-6">
											<div class="row">
												<br>
												<div class="col-xs-4">
													<h5>
														<b>Askerlik Durumu</b>
													</h5>
												</div>
												<div class="col-xs-4">
													<label> <input name="msperformed" id="msperformed"
														type="checkbox" value="1" disabled> Yapıldı
													</label>
												</div>
												<div class="col-xs-4">
													<label> <input name="msprivileged"
														id="msprivileged" type="checkbox" value="1" disabled> Muaf
													</label>
												</div>
											</div>
											<div class="row">
												<div class="col-xs-4"></div>
												<div class="col-xs-4">
													<label> <input name="msnotperformed"
														id="msnotperformed" type="checkbox" value="1" disabled>
														Yapılmadı
													</label>
												</div>
												<div class="col-xs-4">
													<label> <input name="msprobated" id="msprobated"
														type="checkbox" value="1" disabled> Tecilli
													</label>
												</div>
											</div>

											<div class="row">
												<br>
												<div class="col-xs-4">
													<h5>
														<b>Tecrübe</b>
													</h5>
												</div>
												<div class="col-xs-8">
													<label class="radio-inline"> <input type="radio"
														name="exp" id="expsame" value="expsame" disabled> Farketmez
													</label> <label class="radio-inline"> <input type="radio"
														name="exp" id="notexp" value="notexp" disabled> Tecrübesiz
													</label> <label class="radio-inline"> <input type="radio"
														name="exp" id="exp" value="exp" disabled> Tecrübeli
													</label>
												</div>
											</div>
											<div class="row">
												<div class="col-xs-4">
													<h5>
														<b>Cinsiyet</b>
													</h5>
												</div>
												<div class="col-xs-8">
													<label class="radio-inline"> <input type="radio"
														name="gender" id="gendersame" value="gendersame" disabled> Farketmez
													</label> <label class="radio-inline"> <input type="radio"
														name="gender" id="genderwoman" value="genderwoman" disabled> Kadın
													</label> <label class="radio-inline"> <input type="radio"
														name="gender" id="genderman" value="genderman" disabled> Erkek
													</label>
												</div>
											</div>
											<div class="row">
												<br>
												<div class="col-xs-4">
													<h5>
														<b>Yaşadığı Yer</b>
													</h5>
												</div>
												<div class="col-xs-8 text-center">
													<select name="province" class="form-control" id="province" disabled>
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
											</div>
											<div class="row">
												<br>
												<div class="col-xs-4">
													<h5>
														<b>Yaş Aralığı</b>
													</h5>
												</div>
												<div class="col-xs-2 text-center">
													<input type="text" class="form-control" id="minage"
														name="minage" readonly>
												</div>
												<div class="col-xs-2 text-center">ile</div>
												<div class="col-xs-2 text-center">
													<input type="text" class="form-control" id="maxage"
														name="maxage" readonly>
												</div>
												<div class="col-xs-2 text-center">arasında</div>
											</div>
											<div class="row">
												<br>
												<div class="col-xs-4">
													<h5>
														<b>Ehliyet</b>
													</h5>
												</div>
												<div class="col-xs-8 text-center">
													<select name="dlicence" class="form-control" id="dlicence" disabled>
														<option value="1">A1 Sınıfı</option>
														<option value="2">A2 Sınıfı</option>
														<option value="3">B Sınıfı</option>
														<option value="4">C Sınıfı</option>
														<option value="5">D Sınıfı</option>
														<option value="6">E Sınıfı</option>
														<option value="7">F Sınıfı</option>
														<option value="8">G Sınıfı</option>
														<option value="9">H Sınıfı</option>
														<option value="10">Uluslararası Sürücü Belgesi</option>
													</select>
												</div>
											</div>
											<div class="row">
												<br>
												<div class="col-xs-4">
													<h5>
														<b>Yabancı Dil</b>
													</h5>
												</div>
												<div class="col-xs-8 text-center">
													<select class="form-control" name="lang-multiple-selected"
														id="lang-multiple-selected" multiple="multiple" disabled>
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




										</div>

									</div>
								</div>
								<div id="menu3" class="tab-pane fade">

									<div class="col-xs-2"></div>
									<div class="col-xs-6">
										<br>
										<br>
										<br>
										<br>
										<br>
										<br>
										<br>
										<br>
										<div class="row">
										<div class="form-group">
											<label class="control-label col-sm-5" for="lstapplydate">İlan
												Kaldırılış Tarihi :</label>
											<div class="col-sm-7">
												<div class='input-group date' id='datetimepicker1' >
													<input id="lastapplydate" name="lastapplydate" type='text'
														class="form-control" /> <div id="dvdate" style="display: none">
														<span style="width:200px" class="input-group-addon">
														<span class="glyphicon glyphicon-calendar"></span>
													</span>
													</div>
												</div>
												<script type="text/javascript">
													$(function() {
														$('#datetimepicker1').datetimepicker({
																			defaultDate : new Date(),
																			format : 'DD/MM/YYYY',
																			language : 'tr',
																			locale : 'tr',
																			inline: true
																		});
													});
												</script>
											</div>
										</div>
										</div>
										<div class="row"> <br>
										<input type="hidden" name="adid" id="adid" value="0">
										<div class="form-group">
											<label class="control-label col-sm-5">Şube :</label>
											<div class="col-sm-7">
												<div id="list" class="input-group-btn"></div>
											</div>
										</div>
										</div>


										<script>
											function showDepartment() {
									
											var deptid=document.getElementById("departmentId").value;
												var xhttp = new XMLHttpRequest();
												xhttp.onreadystatechange = function() {
													if (xhttp.readyState == 4
															&& xhttp.status == 200) {
														document.getElementById("list").innerHTML = xhttp.responseText;
														 document.getElementById("departments").disabled = false;
														
													}
												};
												xhttp.open("POST","showdepartmentwithselected",true);
												xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
												xhttp.send("deptid="+ deptid);
											}
											
											function getCompanyName()
											{
												
												var deptid=document.getElementById("departmentId").value;
												var xhttp = new XMLHttpRequest();
												xhttp.onreadystatechange = function() {
													if (xhttp.readyState == 4
															&& xhttp.status == 200) {
													
														document.getElementById("companyname").value = xhttp.responseText;

													}
												};
												xhttp.open("POST","getcompanyname",true);
												xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
												xhttp.send("deptId="+ deptid);
											}
												
											

											function getMap(value) {
												var xhttp = new XMLHttpRequest();
												xhttp.onreadystatechange = function() {
													if (xhttp.readyState == 4
															&& xhttp.status == 200) {
														var coord = xhttp.responseText.split(";", 2);
														document.getElementById("map").innerHTML = "<img src=\"https://maps.googleapis.com/maps/api/staticmap?center="
																+ coord[0]
																+ ","
																+ coord[1]
																+ "&zoom=15&size=400x150"
																+ "&markers=color:red%7C"
																+ coord[0]
																+ ","
																+ coord[1]
																+ "&key=AIzaSyAGhDi7ORrjolFUGwq9-SksQl5D1MZuohI\" class=\"img-thumbnail\">";

													}
												};
												xhttp.open("POST", "GetCoords",true);
												xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
												xhttp.send("deptId=" + value);
											}
										</script>


										<div style="height: 150px; width: 400px;" id="map"></div>


									</div>

								</div>

							</div>
						
					</div>


				</div>
				 <div class="modal-footer">
        		<div class="row">
        			<div class="col-xs-6">
        			<button id="footerButton" type="button" class="btn btn-primary btn-block" onclick="disableReadOnly()">Güncelle</button>
        			</div>
        			<div class="col-xs-6">
        			<button id="submitButton" type="button" data-target="#modalcontrol" data-toggle="modal" class="btn btn-primary btn-block" disabled>Kaydet</button>
        			
        			  
					<div class="modal fade" id="modalcontrol" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				        <div class="modal-dialog">
				            <div class="modal-content">
				            
				                <div class="modal-header">
				                    <button type="button" class="close" data-dismiss="modalcontrol" aria-hidden="true">&times;</button>
				                   
				                </div>
				            
				                <div class="modal-body">Kaydetmek istediğinize emin misiniz?
				      
				                    <p class="debug-url"></p>
				                </div>
				                
				                <div class="modal-footer">
				                    <button type="submit" class="btn btn-default" >Evet</button>
				                   <button  class="btn btn-default" data-dismiss="modal">Hayır</button>
				                </div>
				            </div>
				        </div>
				    </div> 
        			
        			
        			
        			
        			
        			</div>
        		
        		</div>
        		
      			
      			</div>
      			</form>
			</div>
		</div>
	</div>

	
	 <script type="text/javascript">
      $(document).ready(function() {
       $('#positiontype-multiple-selected').multiselect({
               enableFiltering: true,
               enableFullValueFiltering: true,
               onChange: function(option,checked) {
                // Get selected options.
                  var selectedOptions = $('#positiontype-multiple-selected option:selected');
                   if (selectedOptions.length >= 5) {
                    // Disable all other checkboxes.
                	    var nonSelectedOptions = $('#positiontype-multiple-selected option').filter(function() {
                       	 return !$(this).is(':selected');
                      });
                                         
           			 var dropdown = $('#positiontype-multiple-selected').siblings('.multiselect-container');
                      nonSelectedOptions.each(function() {
                      var input = $('input[value="' + $(this).val() + '"]');
                  		input.prop('disabled', true);
                     	input.parent('li').addClass('disabled');
                            });
                           }
                            else {
                       	// Enable all checkboxes.
                        var dropdown = $('#positiontype-multiple-selected').siblings('.multiselect-container');
                        $('#positiontype-multiple-selected option').each(function() {
                          var input = $('input[value="' + $(this).val() + '"]');
                           input.prop('disabled', false);
                           input.parent('li').addClass('disabled');
                           });
                         }
          
              				 }
                    			});
       
       
       $('#sector-multiple-selected').multiselect({
           enableFiltering: true,
           enableFullValueFiltering: true,
           onChange: function(option,checked) {
            // Get selected options.
              var selectedOptions = $('#sector-multiple-selected option:selected');
               if (selectedOptions.length >= 5) {
                // Disable all other checkboxes.
            	    var nonSelectedOptions = $('#sector-multiple-selected option').filter(function() {
                   	 return !$(this).is(':selected');
                  });
                                     
       			 var dropdown = $('#sector-multiple-selected').siblings('.multiselect-container');
                  nonSelectedOptions.each(function() {
                  var input = $('input[value="' + $(this).val() + '"]');
              		input.prop('disabled', true);
                 	input.parent('li').addClass('disabled');
                        });
                       }
                        else {
                   	// Enable all checkboxes.
                    var dropdown = $('#sector-multiple-selected').siblings('.multiselect-container');
                    $('#sector-multiple-selected option').each(function() {
                      var input = $('input[value="' + $(this).val() + '"]');
                       input.prop('disabled', false);
                       input.parent('li').addClass('disabled');
                       });
                     }
      
          				 }
                			});
       
       $('#pastpositions-multiple-selected').multiselect({
           enableFiltering: true,
           enableFullValueFiltering: true,
           onChange: function(option,checked) {
            // Get selected options.
              var selectedOptions = $('#pastpositions-multiple-selected option:selected');
               if (selectedOptions.length >= 5) {
                // Disable all other checkboxes.
            	    var nonSelectedOptions = $('#pastpositions-multiple-selected option').filter(function() {
                   	 return !$(this).is(':selected');
                  });
                                     
       			 var dropdown = $('#pastpositions-multiple-selected').siblings('.multiselect-container');
                  nonSelectedOptions.each(function() {
                  var input = $('input[value="' + $(this).val() + '"]');
              		input.prop('disabled', true);
                 	input.parent('li').addClass('disabled');
                        });
                       }
                        else {
                   	// Enable all checkboxes.
                    var dropdown = $('#pastpositions-multiple-selected').siblings('.multiselect-container');
                    $('#pastpositions-multiple-selected option').each(function() {
                      var input = $('input[value="' + $(this).val() + '"]');
                       input.prop('disabled', false);
                       input.parent('li').addClass('disabled');
                       });
                     }
      
          				 }
                			});
       
       $('#pastsectors-multiple-selected').multiselect({
           enableFiltering: true,
           enableFullValueFiltering: true,
           onChange: function(option,checked) {
            // Get selected options.
              var selectedOptions = $('#pastsectors-multiple-selected option:selected');
               if (selectedOptions.length >= 5) {
                // Disable all other checkboxes.
            	    var nonSelectedOptions = $('#pastsectors-multiple-selected option').filter(function() {
                   	 return !$(this).is(':selected');
                  });
                                     
       			 var dropdown = $('#pastsectors-multiple-selected').siblings('.multiselect-container');
                  nonSelectedOptions.each(function() {
                  var input = $('input[value="' + $(this).val() + '"]');
              		input.prop('disabled', true);
                 	input.parent('li').addClass('disabled');
                        });
                       }
                        else {
                   	// Enable all checkboxes.
                    var dropdown = $('#pastsectors-multiple-selected').siblings('.multiselect-container');
                    $('#pastsectors-multiple-selected option').each(function() {
                      var input = $('input[value="' + $(this).val() + '"]');
                       input.prop('disabled', false);
                       input.parent('li').addClass('disabled');
                       });
                     }
      
          				 }
                			});
       
       $('#jobfield-multiple-selected').multiselect({
    	   enableFiltering: true,
           enableFullValueFiltering: true,
           onChange: function(option,checked) {
            // Get selected options.
              var selectedOptions = $('#sector-multiple-selected option:selected');
               if (selectedOptions.length >= 5) {
                // Disable all other checkboxes.
            	    var nonSelectedOptions = $('#sector-multiple-selected option').filter(function() {
                   	 return !$(this).is(':selected');
                  });
                                     
       			 var dropdown = $('#sector-multiple-selected').siblings('.multiselect-container');
                  nonSelectedOptions.each(function() {
                  var input = $('input[value="' + $(this).val() + '"]');
              		input.prop('disabled', true);
                 	input.parent('li').addClass('disabled');
                        });
                       }
                        else {
                   	// Enable all checkboxes.
                    var dropdown = $('#sector-multiple-selected').siblings('.multiselect-container');
                    $('#sector-multiple-selected option').each(function() {
                      var input = $('input[value="' + $(this).val() + '"]');
                       input.prop('disabled', false);
                       input.parent('li').addClass('disabled');
                       });
                     }
      
          				 }
                			});
       
       
       
       $('#university-multiple-selected').multiselect({
           enableFiltering: true,
           enableFullValueFiltering: true,
           onChange: function(option,checked) {
            // Get selected options.
              var selectedOptions = $('#university-multiple-selected option:selected');
               if (selectedOptions.length >= 5) {
                // Disable all other checkboxes.
            	    var nonSelectedOptions = $('#university-multiple-selected option').filter(function() {
                   	 return !$(this).is(':selected');
                  });
                                     
       			 var dropdown = $('#university-multiple-selected').siblings('.multiselect-container');
                  nonSelectedOptions.each(function() {
                  var input = $('input[value="' + $(this).val() + '"]');
              		input.prop('disabled', true);
                 	input.parent('li').addClass('disabled');
                        });
                       }
                        else {
                   	// Enable all checkboxes.
                    var dropdown = $('#university-multiple-selected').siblings('.multiselect-container');
                    $('#university-multiple-selected option').each(function() {
                      var input = $('input[value="' + $(this).val() + '"]');
                       input.prop('disabled', false);
                       input.parent('li').addClass('disabled');
                       });
                     }
      
          				 }
                			});
       
       $('#universitysection-multiple-selected').multiselect({
           enableFiltering: true,
           enableFullValueFiltering: true,
           onChange: function(option,checked) {
            // Get selected options.
              var selectedOptions = $('#universitysection-multiple-selected option:selected');
               if (selectedOptions.length >= 5) {
                // Disable all other checkboxes.
            	    var nonSelectedOptions = $('#universitysection-multiple-selected option').filter(function() {
                   	 return !$(this).is(':selected');
                  });
                                     
       			 var dropdown = $('#universitysection-multiple-selected').siblings('.multiselect-container');
                  nonSelectedOptions.each(function() {
                  var input = $('input[value="' + $(this).val() + '"]');
              		input.prop('disabled', true);
                 	input.parent('li').addClass('disabled');
                        });
                       }
                        else {
                   	// Enable all checkboxes.
                    var dropdown = $('#universitysection-multiple-selected').siblings('.multiselect-container');
                    $('#universitysection-multiple-selected option').each(function() {
                      var input = $('input[value="' + $(this).val() + '"]');
                       input.prop('disabled', false);
                       input.parent('li').addClass('disabled');
                       });
                     }
      
          				 }
                			});
       
       
       
       $('#lang-multiple-selected').multiselect({
           enableFiltering: true,
           enableFullValueFiltering: true,
           onChange: function(option,checked) {
            // Get selected options.
              var selectedOptions = $('#lang-multiple-selected option:selected');
               if (selectedOptions.length >= 5) {
                // Disable all other checkboxes.
            	    var nonSelectedOptions = $('#lang-multiple-selected option').filter(function() {
                   	 return !$(this).is(':selected');
                  });
                                     
       			 var dropdown = $('#lang-multiple-selected').siblings('.multiselect-container');
                  nonSelectedOptions.each(function() {
                  var input = $('input[value="' + $(this).val() + '"]');
              		input.prop('disabled', true);
                 	input.parent('li').addClass('disabled');
                        });
                       }
                        else {
                   	// Enable all checkboxes.
                    var dropdown = $('#lang-multiple-selected').siblings('.multiselect-container');
                    $('#lang-multiple-selected option').each(function() {
                      var input = $('input[value="' + $(this).val() + '"]');
                       input.prop('disabled', false);
                       input.parent('li').addClass('disabled');
                       });
                     }
      
          				 }
                			});
       
       
                                       });
      
       </script>
   

   
    <script type="text/javascript" src="http://js.nicedit.com/nicEdit-latest.js"></script> 
    <script type="text/javascript">
	//<![CDATA[
        $(document).ready(function() {nicEditors.allTextAreas() 
       nicEditors.findEditor("qualifications").disable(true);
       
    
  
        });
  //]]>
  </script>
  

  

</body>
</html>
