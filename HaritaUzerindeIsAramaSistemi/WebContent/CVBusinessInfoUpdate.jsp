<%@page import="com.huia.service.db.ConnectionHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
 <%@ page import="java.io.*"%>
 <%@ page import="java.sql.*"%>
 <%@ page import="java.util.*"%> 
 <%@ page import="java.text.*"%>
 <%@ page import="javax.servlet.*"%>
 <%@ page import="javax.servlet.http.*"%>
 <%@ page import="javax.servlet.http.HttpSession"%>
 <%@ page import="com.huia.service.db.ConnectionHelper" %>
 <%@ page language="java"%>
 <%@ page session="true"%>
<!DOCTYPE html>
<html lang="tr">
<head>
<%
String idBusiness2=request.getParameter("idBusiness");
if("".equals(idBusiness2)){
	response.sendRedirect("CVBusinessInfoUpdate2.jsp");
}
ConnectionHelper conn= new ConnectionHelper();
Connection con = conn.getConnection();

PreparedStatement stmt3 = null;
ResultSet rs3 = null;

String userName=request.getRemoteUser();
String Name = "";
String Surname = "";
String Email = "";


String FirmName = "";
String FirmStartDate = "";
String FirmFinishDate = "";
String	PositionAtFirm = "";
String FirmSector="";
String FirmContiune = "";
String BusinessScope="";
String	Explanation = "";

 String query3 = "SELECT * FROM tblBusinessInformation WHERE idBusiness=?";

 stmt3 = conn.getStatement(con, query3);

 try {

	 	stmt3.setString(1,idBusiness2);
	 	rs3 = stmt3.executeQuery();
		int count=0;
	       while (rs3.next()) {
				
				FirmName = rs3.getString("FirmName");
				FirmStartDate = rs3.getString("FirmStartDate");
				FirmFinishDate = rs3.getString("FirmFinishDate");
				PositionAtFirm = rs3.getString("PositionAtFirm");
				FirmSector =rs3.getString("FirmSector");
				FirmContiune = rs3.getString("ContinueSituation");
				Explanation = rs3.getString("Explanation");
				BusinessScope=rs3.getString("BusinessScope");
				 if("".equals("FirmFinishDate"))
			       {
					 FirmFinishDate=FirmContiune;
			       }
			       if("".equals("FirmContiune"))
			       {
			    	   FirmContiune=FirmFinishDate;
			       }
	       }
	%>
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


<script>
function changeval(){
	var x = document.sform.FirmContinue.checked;
	var valDate = document.getElementById('datepicker2').value;
	if(valDate == ""){		
		  if( x == false){	
			alert("Lütfen Bitiş Tarihi Veya Devam Durumunuzu Belitiniz.");
		   }
		}
	var firmaSeciniz=document.sform.FirmSector.value;
	var isSeciniz = document.sform.BusinessScope.value;
	if(firmaSeciniz == null || firmaSeciniz == "" || firmaSeciniz == "0")
		alert("Lütfen Firma Sektörü Seçiniz");
	if(isSeciniz == null || isSeciniz == "" || isSeciniz == "0")
		alert("Lütfen İş Alanı Seçiniz");
		
}
</script>


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
		method="POST" action="CVBusinessInfoUpdateServlet" data-fv-framework="bootstrap"
		data-fv-framework="bootstrap"
		data-fv-icon-valid="glyphicon glyphicon-ok"
		data-fv-icon-invalid="glyphicon glyphicon-remove"
		data-fv-icon-validating="glyphicon glyphicon-refresh">
		<div class="container">
			<p>
				<br> <br>
			</p>
			<ul class="nav nav-pills col-md-offset-2   ">
				<li ><a data-toggle="pill" href="CVContactInformationUpdate.jsp">İletişim Bilgileri</a></li>
				<li><a data-toggle="pill" href="CVPersonalInformationUpdate.jsp">Kişisel Bilgiler</a></li>
				<li><a data-toggle="pill" href="CVEducationalInfoUpdate2.jsp">Eğitim Bilgileri</a></li>
				<li class="active" ><a data-toggle="pill" href="CVBusinessInfoUpdate2.jsp">İş Deneyimi</a></li>
				<li><a data-toggle="pill" href="CVForeignLanguageInfoUpdate2.jsp">Yabancı Dil</a></li>
				<li ><a data-toggle="pill" href="CVReferenceInfoUpdate2.jsp">Referans Bilgileri</a></li>
				<li><a data-toggle="pill" href="CVAdditionalInfoUpdate.jsp">Ek Bilgiler</a></li>
			</ul>


			<div class="tab-content text-center">
				<div id="home" class="tab-pane fade in active">
					<br>
					<div class="container center ">


						<div class="form-group">
							<label class="control-label col-sm-5" for="FirmName">Firma
								Adı * &nbsp;&nbsp;&nbsp;:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="FirmName" value="<%=FirmName%>" required placeholder="">

							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-5" for="FirmStartDate">Başlangıç
								Tarihi * &nbsp;&nbsp;&nbsp;:</label>
							<div class="col-sm-7">
								<input type="text" id="datepicker" class="form-control"
									name="FirmStartDate" value="<%=FirmStartDate%>" required placeholder="">

							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-5" for="FirmFinishDate">Bitiş
								Tarihi * &nbsp;&nbsp;&nbsp;:</label>
							<div class="col-sm-4">
								<input type="text" id="datepicker2" class="form-control" value="<%=FirmFinishDate%>"
									name="FirmFinishDate" >

							</div>
						</div>				

						<div class="form-group">
							<label class="control-label col-sm-5" for="PositionAtFirm">Firmadaki
								Pozisyon* &nbsp;&nbsp;&nbsp;:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="PositionAtFirm" value="<%=PositionAtFirm%>"  required placeholder=""> 

							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-5" for="FirmSector">Firma
								Sektörü * &nbsp;&nbsp;&nbsp;:</label>
							<div class="col-sm-7">
								<select class="form-control" name="FirmSector" required>
									<option value="<%=FirmSector%>"><%=FirmSector%></option>
									<option value="">----------------</option>
									<option>Diğer</option>
									<option value="Arşiv Yönetimi ve Saklama">Arşiv
										Yönetimi ve Saklama</option>
									<option value="Atık Yönetimi ve Geri Dönüşüm">Atık
										Yönetimi ve Geri Dönüşüm</option>
										<option value="Ar-GE">Ar-GE</option>
									<option value="Basım-Yayın">Basım-Yayın</option>

									<option value="Bilişim">Bilişim</option>

									<option value="Çevre">Çevre</option>

									<option value="Danışmanlık">Danışmanlık</option>

									<option value="Dayanıklı Tüketim Ürünleri">Dayanıklı
										Tüketim Ürünleri</option>
									<option value="Denizcilik">Denizcilik</option>




									<option value="Eğitim">Eğitim</option>

									<option value="Eğlence - Kültür - Sanat">Eğlence -
										Kültür - Sanat</option>



									<option value="Elektrik & Elektronik">Elektrik &
										Elektronik</option>


									<option value="Enerji">Enerji</option>

									<option value="Ev Eşyaları">Ev Eşyaları</option>


									<option value="Finans - Ekonomi">Finans - Ekonomi</option>

									<option value="Gıda">Gıda</option>

									<option value="Güvenlik">Güvenlik</option>

									<option value="Havacılık">Havacılık</option>

									<option value="Hayvancılık">Hayvancılık</option>


									<option value="Hızlı Tüketim Malları">Hızlı Tüketim
										Malları</option>
									<option value="Hizmet">Hizmet</option>

									<option value="İletişim Danışmanlığı">İletişim
										Danışmanlığı</option>
									<option value="Kaynak ve Kesme Ekipmanları">Kaynak ve
										Kesme Ekipmanları</option>
									<option value="Kimya">Kimya</option>

									<option value="Maden ve Metal Sanayi">Maden ve Metal
										Sanayi</option>

									<option value="Medya">Medya</option>

									<option value="Mobilya & Aksesuar">Mobilya & Aksesuar</option>

									<option value="Ofis / Büro Malzemeleri">Ofis / Büro
										Malzemeleri</option>

									<option value="Orman Ürünleri">Orman Ürünleri</option>

									<option value="Otomotiv">Otomotiv</option>


									<option value="Perakende">Perakende</option>
									<option value="Reklam ve Tanıtım">Reklam ve Tanıtım</option>


									<option value="Sağlık">Sağlık</option>


									<option value="Sigortacılık">Sigortacılık</option>

									<option value="Tarım / Ziraat">Tarım / Ziraat</option>

									<option value="Taşımacılık">Taşımacılık</option>

									<option value="Tekstil">Tekstil</option>


									<option value="Telekomünikasyon">Telekomünikasyon</option>

									<option value="Ticaret">Ticaret</option>

									<option value="Topluluklar">Topluluklar</option>

									<option value="Turizm">Turizm</option>

								</select>

							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-5" for="BusinessScope">İş
								Alanı * &nbsp;&nbsp;&nbsp;:</label>
							<div class="col-sm-7">

								<select class="form-control" name="BusinessScope" required>
									<option value="<%=BusinessScope%>"><%=BusinessScope%></option>
									<option value="">--------------------</option>
									<option value="Satış-Pazarlama">Satış-Pazarlama</option>
									<option value="Eğitim-Öğretim">Eğitim-Öğretim</option>
									<option value="Branş Öğretmenliği">Branş Öğretmenliği</option>
									<option value="Yiyecek-İçecek Hizmetleri">Yiyecek-İçecek
										Hizmetleri</option>
									<option value="Mühendislik">Mühendislik</option>
									<option value="Mali İşler-Finansman">Mali
										İşler-Finansman</option>
									<option value="Operasyon">Operasyon</option>
									<option value="Müşteri İlişkileri-Crm">Müşteri
										İlişkileri-Crm</option>
									<option value="Üretim">Üretim</option>
									<option value="Yabancı Dil Öğretmenliği">Yabancı Dil
										Öğretmenliği</option>
									<option value="Bilgi Teknolojileri">Bilgi
										Teknolojileri</option>
									<option value="Satış Danışmanlığı-Tezgahtarlık">Satış
										Danışmanlığı-Tezgahtarlık</option>
									<option value="Bakım-Servis-Onarım">Bakım-Servis-Onarım</option>
									<option value="Satış-Hizmet Sonrası Destek">Satış-Hizmet
										Sonrası Destek</option>
									<option value="Mutfak">Mutfak</option>
									<option value="İnsan Kaynakları">İnsan Kaynakları</option>
									<option value="Şantiye">Şantiye</option>
									<option value="Servis">Servis</option>
									<option value="Araştırma-Geliştirme">Araştırma-Geliştirme</option>
									<option value="Sağlık Hizmetleri">Sağlık Hizmetleri</option>
									<option value="Restoran-Bar">Restoran-Bar</option>
									<option value="ÖnBüro-Resepsiyon-Rezervasyon">ÖnBüro-Resepsiyon-Rezervasyon</option>
									<option value="Kasa">Kasa</option>
									<option value="Sekreterya-Ofis Yönetimi">Sekreterya-Ofis
										Yönetimi</option>
									<option value="Kurs-Dershane">Kurs-Dershane</option>
									<option value="Kat Hizmetleri">Kat Hizmetleri</option>
									<option value="Güvenlik Hizmetleri">Güvenlik
										Hizmetleri</option>
									<option value="Halkla İlişkiler">Halkla İlişkiler</option>
									<option value="Yazılım Uygulama Ve Geliştirme">Yazılım
										Uygulama Ve Geliştirme</option>
									<option value="Depo">Depo</option>
									<option value="Reyon">Reyon</option>
									<option value="Lojistik-Malzeme Yönetimi">Lojistik-Malzeme
										Yönetimi</option>
									<option value="Kafe-Bar">Kafe-Bar</option>
									<option value="Proje Yönetimi">Proje Yönetimi</option>
									<option value="Satınalma">Satınalma</option>
									<option value="Kalite Kontrol-Güvence">Kalite
										Kontrol-Güvence</option>
									<option value="Sistem Destek Ve Yönetimi">Sistem
										Destek Ve Yönetimi</option>
									<option value="İdari İşler">İdari İşler</option>
									<option value="Doktor - Hekim">Doktor - Hekim</option>
									<option value="Teknik İşler">Teknik İşler</option>
									<option value="İş Geliştirme">İş Geliştirme</option>
									<option value="Genel Yönetim">Genel Yönetim</option>
									<option value="Eğitim Danışmanlığı">Eğitim
										Danışmanlığı</option>
									<option value="Merchandising">Merchandising</option>
									<option value="Tanıtım">Tanıtım</option>
									<option value="Proje Satış">Proje Satış</option>
									<option value="Reklam">Reklam</option>
									<option value="İş Sağlığı ve Güvenliği">İş Sağlığı ve
										Güvenliği</option>
									<option value="Tasarım">Tasarım</option>
									<option value="Sevkiyat">Sevkiyat</option>
									<option value="Elektrik Tesisat">Elektrik Tesisat</option>
									<option value="Merkez Ofis">Merkez Ofis</option>
									<option value="Gizli Müşteri">Gizli Müşteri</option>
									<option value="Gizli Müşteri">Hemşirelik</option>
									<option value="Grafik Tasarım - Uygulama">Grafik
										Tasarım - Uygulama</option>
									<option value="Zincir Mağazalar Yönetimi">Zincir
										Mağazalar Yönetimi</option>
									<option value="Anaokulu Öğretmenliği">Anaokulu
										Öğretmenliği</option>
									<option value="Web Tasarımı">Web Tasarımı</option>
									<option value="Mimarlık Hizmetleri">Mimarlık
										Hizmetleri</option>
									<option value="İthalat-İhracat - Dış Ticaret">İthalat-İhracat
										- Dış Ticaret</option>
									<option value="Gayrimenkul Danışmanlığı">Gayrimenkul
										Danışmanlığı</option>
									<option value="Arşiv-Dökümantasyon">Arşiv-Dökümantasyon</option>
									<option value="İnce İnşaat">İnce İnşaat</option>
									<option value="Medya Planlaması">Medya Planlaması</option>
									<option value="Depo-Ambar-Antrepo">Depo-Ambar-Antrepo</option>
									<option value="Veri Tabanı Tasarım Ve Yönetimi">Veri
										Tabanı Tasarım Ve Yönetimi</option>
									<option value="Laboratuvar">Laboratuvar</option>
									<option value="Teknik">Teknik</option>
									<option value="Medya Planlama - Satış">Medya Planlama
										- Satış</option>
									<option value="Nakliye">Nakliye</option>
									<option value="Danışmanlık Hizmetleri">Danışmanlık
										Hizmetleri</option>
									<option value="Üretim Planlama">Üretim Planlama</option>
									<option value="Mekanik Tesisat">Mekanik Tesisat</option>
									<option value="Proses Kontrol">Proses Kontrol</option>
									<option value="Tıbbi Mümessillik">Tıbbi Mümessillik</option>
									<option value="Sınıf Öğretmenliği">Sınıf Öğretmenliği</option>
									<option value="Etüt Öğretmenliği">Etüt Öğretmenliği</option>
									<option value="Bayi Takip Ve Geliştirme">Bayi Takip Ve
										Geliştirme</option>
									<option value="Şoför - Ulaştırma">Şoför - Ulaştırma</option>
									<option value="Hukuk">Hukuk</option>
									<option value="Ağ Yönetimi">Ağ Yönetimi</option>
									<option value="Montaj">Montaj</option>
									<option value="Yazılım Danışmanlığı">Yazılım
										Danışmanlığı</option>
									<option value="Konuk Ağırlama">Konuk Ağırlama</option>
									<option value="Hisse Senedi Yönetimi">Hisse Senedi
										Yönetimi</option>
									<option value="Bireysel Bankacılık">Bireysel
										Bankacılık</option>
									<option value="Pres">Pres</option>
									<option value="Harita">Harita</option>
									<option value="Fon Yönetimi">Fon Yönetimi</option>
									<option value="Ürün Yönetimi-Geliştirme">Ürün
										Yönetimi-Geliştirme</option>
									<option value="Spor - Antrenman">Spor - Antrenman</option>
									<option value="Çözüm Satış">Çözüm Satış</option>
									<option value="Eczane">Eczane</option>
									<option value="Öğrenci İşleri">Öğrenci İşleri</option>
									<option value="Bölge Ofisi">Bölge Ofisi</option>
									<option value="Gayrimenkul Değerleme">Gayrimenkul
										Değerleme</option>
									<option value="Paketleme">Paketleme</option>
									<option value="Enjeksiyon">Enjeksiyon</option>
									<option value="Kaba İnşaat">Kaba İnşaat</option>
									<option value="Stratejik Planlama">Stratejik Planlama</option>
									<option value="Finansal Danışmanlık">Finansal
										Danışmanlık</option>
									<option value="Kişisel Bakım">Kişisel Bakım</option>
									<option value="Öğretim Görevlisi">Öğretim Görevlisi</option>
									<option value="Model Tasarım">Model Tasarım</option>Danışmanlık
									</option>
									<option value="Alternatif Dağıtım Kanalları">Alternatif
										Dağıtım Kanalları</option>
									<option value="İnşaat-Emlak İşleri">İnşaat-Emlak
										İşleri</option>
									<option value="Hazine">Hazine</option>
									<option value="Haberleşme-İletişim">Haberleşme-İletişim</option>
									<option value="Meslek Öğretmenliği">Meslek
										Öğretmenliği</option>
									<option value="Yayın">Yayın</option>
									<option value="Kaynak">Kaynak</option>
									<option value="Donanım Montaj">Donanım Montaj</option>
									<option value="Portföy Yönetimi">Portföy Yönetimi</option>
									<option value="Son Kontrol">Son Kontrol</option>
									<option value="İç Kontrol-Teftiş">İç Kontrol-Teftiş</option>
									<option value="Hakediş-Kesin Hesap">Hakediş-Kesin
										Hesap</option>
									<option value="Test">Test</option>
									<option value="Banka-Finans Risk Yönetimi">Banka-Finans
										Risk Yönetimi</option>
									<option value="Formülasyon">Formülasyon</option>
									<option value="Anket-Saha Araştırma">Anket-Saha
										Araştırma</option>
									<option value="Hamur Hazırlama">Hamur Hazırlama</option>
									<option value="Tedarik Zinciri Yönetimi">Tedarik
										Zinciri Yönetimi</option>
									<option value="Model Kalıp">Model Kalıp</option>
									<option value="Sigorta Hizmetleri">Sigorta Hizmetleri</option>
									<option value="Organizasyon">Organizasyon</option>
									<option value="İhale">İhale</option>
									<option value="Stabilite">Stabilite</option>
									<option value="Veri Girişi">Veri Girişi</option>
									<option value="Kalıp Üretim">Kalıp Üretim</option>
									<option value="Döküm">Döküm</option>
									<option value="Tasarım Değerlendirme">Tasarım
										Değerlendirme</option>
									<option value="Şube İşlemleri">Şube İşlemleri</option>
									<option value="Kurye Teslimat">Kurye Teslimat</option>
									<option value="Medikal">Medikal</option>
									<option value="Kara">Kara</option>
									<option value="Kredi Kartları">Kredi Kartları</option>
									<option value="İç Denetim">İç Denetim</option>
									<option value="Araştırma Görevlisi">Araştırma
										Görevlisi</option>
									<option value="Banket">Banket</option>
									<option value="Muhabirlik">Muhabirlik</option>
									<option value="Görsel Tasarım">Görsel Tasarım</option>
									<option value="Editörlük">Editörlük</option>
									<option value="Yazı İşleri-Haber">Yazı İşleri-Haber</option>
									<option value="Kesim">Kesim</option>
									<option value="Kağıt Makinesi">Kağıt Makinesi</option>
									<option value="Baskı">Baskı</option>
									<option value="Konsept Tasarım Geliştirme">Konsept
										Tasarım Geliştirme</option>
									<option value="Ürün Müdürü - Yöneticisi">Ürün Müdürü -
										Yöneticisi</option>
									<option value="Revir">Revir</option>
									<option value="Prodüksiyon Hizmetleri">Prodüksiyon
										Hizmetleri</option>
									<option value="Gece Amiri">Gece Amiri</option>
									<option value="Aktivite-Animasyon">Aktivite-Animasyon</option>
									<option value="Dağıtım - Tiraj Planlama">Dağıtım -
										Tiraj Planlama</option>
									<option value="Bayi İlişkileri">Bayi İlişkileri</option>
									<option value="İş Makinesi Operatörlüğü">İş Makinesi
										Operatörlüğü</option>
									<option value="Kullanıcı Eğitimi">Kullanıcı Eğitimi</option>
									<option value="Yükleme">Yükleme</option>
									<option value="Klinik Araştırmalar">Klinik
										Araştırmalar</option>
									<option value="Web Sitesi İçerik Yönetimi">Web Sitesi
										İçerik Yönetimi</option>
									<option value="Dikim">Dikim</option>
									<option value="Kamera - Fotoğraf">Kamera - Fotoğraf</option>
									<option value="Görsel-Vitrin Düzenleme">Görsel-Vitrin
										Düzenleme</option>
									<option value="Sigorta Risk Yönetimi">Sigorta Risk
										Yönetimi</option>
									<option value="Laboratuvar Teknisyenliği">Laboratuvar
										Teknisyenliği</option>
									<option value="Diyet - Beslenme">Diyet - Beslenme</option>
									<option value="Biyomedikal Teknisyeni">Biyomedikal
										Teknisyeni</option>
									<option value="Anestezi Teknisyenliği">Anestezi
										Teknisyenliği</option>
									<option value="Ajans Prodüktörlüğü">Ajans
										Prodüktörlüğü</option>
									<option value="Ölçme Değerlendirme">Ölçme
										Değerlendirme</option>
									<option value="Oyunculuk">Oyunculuk</option>
									<option value="Rehberlik-Tur Operatörlüğü">Rehberlik-Tur
										Operatörlüğü</option>
									<option value="Krediler Ve İstihbarat">Krediler Ve
										İstihbarat</option>
									<option value="Hasta Danışma">Hasta Danışma</option>
									<option value="Fuar">Fuar</option>
									<option value="Filo Yönetimi">Filo Yönetimi</option>
									<option value="Masaj">Masaj</option>
									<option value="Gişe-Fuaye-Büfe">Gişe-Fuaye-Büfe</option>
									<option value="Fason Takip">Fason Takip</option>
									<option value="Forklift Operatörlüğü">Forklift
										Operatörlüğü</option>
									<option value="Cnc Operatörlüğü">Cnc Operatörlüğü</option>
									<option value="Farmakovijilans">Farmakovijilans</option>
									<option value="Yolcu Hizmetleri">Yolcu Hizmetleri</option>
									<option value="Haber Takip">Haber Takip</option>
									<option value="Vardiya Şefliği">Vardiya Şefliği</option>
									<option value="Son İşlemler">Son İşlemler</option>
									<option value="İplik Büküm - Çözgü">İplik Büküm -
										Çözgü</option>
									<option value="Fırınlama">Fırınlama</option>
									<option value="Boya - Serigrafi">Boya - Serigrafi</option>
									<option value="Ticari Bankacılık">Ticari Bankacılık</option>
									<option value="Ses-Işık-Kamera">Ses-Işık-Kamera</option>
									<option value="Kurgu - Montaj">Kurgu - Montaj</option>
									<option value="Promosyon - Eşantiyon">Promosyon -
										Eşantiyon</option>
									<option value="Bölge Müdürlüğü">Bölge Müdürlüğü</option>
									<option value="Fizyoterapi">Fizyoterapi</option>
									<option value="Diş Teknisyenliği">Diş Teknisyenliği</option>
									<option value="Diş Hekimliği">Diş Hekimliği</option>
									<option value="Restorasyon">Restorasyon</option>
									<option value="Sanat Yönetmenliği">Sanat Yönetmenliği</option>
									<option value="Grafik Operatörlüğü">Grafik
										Operatörlüğü</option>
									<option value="Prova Mankenliği">Prova Mankenliği</option>
									<option value="Sağlık Memuru (Ön Büro)">Sağlık Memuru
										(Ön Büro)</option>
									<option value="Bilet Satış">Bilet Satış</option>
									<option value="Demiryolu">Demiryolu</option>
									<option value="Kurumsal Bankacılık">Kurumsal
										Bankacılık</option>
									<option value="İlaç Ruhsatlandırma">İlaç
										Ruhsatlandırma</option>
									<option value="Basın Danışmanlığı">Basın Danışmanlığı</option>
									<option value="Eczacılık">Eczacılık</option>
									<option value="Çevre Sistemleri">Çevre Sistemleri</option>
									<option value="Çevirmen-Tercüman">Çevirmen-Tercüman</option>
									<option value="Baskı">Baskı</option>
									<option value="Yazarlık">Yazarlık</option>
									<option value="İstihbarat">İstihbarat</option>
									<option value="Dizgi - Mizanpaj">Dizgi - Mizanpaj</option>
									<option value="Yönetmenlik">Yönetmenlik</option>
									<option value="Transmisyon">Transmisyon</option>
									<option value="Spikerlik">Spikerlik</option>
									<option value="Reji">Reji</option>
									<option value="Prodüksiyon - Yapım">Prodüksiyon -
										Yapım</option>
									<option value="Yapı Ruhsatlandırma">Yapı
										Ruhsatlandırma</option>
									<option value="Sırlama">Sırlama</option>
									<option value="Fermentasyon">Fermentasyon</option>
									<option value="Dokuma">Dokuma</option>
									<option value="Deri İşleme">Deri İşleme</option>
									<option value="Boya - Terbiye">Boya - Terbiye</option>
									<option value="Üfleme">Üfleme</option>
									<option value="Tütün Eksperliği">Tütün Eksperliği</option>
									<option value="Dublaj-Altyazı">Dublaj-Altyazı</option>
									<option value="Ses - Işık Teknisyenliği">Ses - Işık
										Teknisyenliği</option>
									<option value="Dublaj - Seslendirme">Dublaj -
										Seslendirme</option>
									<option value="Artistik Hizmetler">Artistik Hizmetler</option>
									<option value="Sahne - Dekor - Kostüm">Sahne - Dekor -
										Kostüm</option>
									<option value="Ambalaj Tasarımı">Ambalaj Tasarımı</option>
									<option value="Zemin Güçlendirme">Zemin Güçlendirme</option>
									<option value="Sosyal Hizmet">Sosyal Hizmet</option>
									<option value="Senaryo">Senaryo</option>
									<option value="Resim-Heykel">Resim-Heykel</option>
									<option value="Müzisyenlik">Müzisyenlik</option>
									<option value="Fotoğrafçılık">Fotoğrafçılık</option>
									<option value="Bale-Opera">Bale-Opera</option>
									<option value="Sanatsal Faaliyetler">Sanatsal
										Faaliyetler</option>
									<option value="Radyoloji Teknisyenliği">Radyoloji
										Teknisyenliği</option>
									<option value="Radyasyon Onkoloji Teknisyeni">Radyasyon
										Onkoloji Teknisyeni</option>
									<option value="Ameliyathane Teknisyenliği">Ameliyathane
										Teknisyenliği</option>
									<option value="Trafik">Trafik</option>
									<option value="Metin Yazarlığı">Metin Yazarlığı</option>
									<option value="Kreatif Direktörlük">Kreatif
										Direktörlük</option>
									<option value="Pilotaj Hizmetleri">Pilotaj Hizmetleri</option>
									<option value="Paramedik - Acil Yardım">Paramedik -
										Acil Yardım</option>
									<option value="Kargo Takip">Kargo Takip</option>
									<option value="Kambiyo">Kambiyo</option>
									<option value="İade">İade</option>
									<option value="Cankurtaran">Cankurtaran</option>
									<option value="Numune">Numune</option>
									<option value="Mevzuat-Uyum">Mevzuat-Uyum</option>
									<option value="Hava">Hava</option>
									<option value="Deniz">Deniz</option>
									<option value="Koreografi">Koreografi</option>
									<option value="Kobi Bankacılığı">Kobi Bankacılığı</option>
									<option value="Karikatür">Karikatür</option>
									<option value="Metod Geliştirme-Validasyon">Metod
										Geliştirme-Validasyon</option>
									<option value="Kalibrasyon">Kalibrasyon</option>
									<option value="İstatistik">İstatistik</option>
									<option value="Menajerlik">Menajerlik</option>
									<option value="Gümrük">Gümrük</option>
									<option value="Forwarder">Forwarder</option>
									<option value="Cad-Cam Operatörlüğü">Cad-Cam
										Operatörlüğü</option>
									<option value="Arsa Değerlendirme">Arsa Değerlendirme</option>

								</select>

							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-5" for="Explanation">Ek
								Açıklama &nbsp;&nbsp;&nbsp;:</label>
							<div class="col-sm-7">
								<textarea class="form-control" name="Explanation" value="<%=Explanation%>" maxlength="120"></textarea>
							</div>
						</div>
			


						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-8">

								<button type="submit" class="btn btn-primary" onclick="changeval()">GÜNCELLE</button>

							</div>
						</div>
<input type="hidden" value=<%=request.getParameter("idBusiness") %> name="idBusiness">

					</div>
				</div>
			</div>
		</div>
	</form>
</body>
<%  
} catch (SQLException e){
	response.getOutputStream().flush();
	response.getOutputStream().close();
	e.printStackTrace();
} finally {
	conn.closeStatement(stmt3);	
	conn.closeResultSet(rs3);
	conn.closeConnection(con);
	
}
 
%>
</html>