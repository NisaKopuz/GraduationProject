<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="tr">
<head>
<title>İşveren Kayıt</title>
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

$(function(){
	  $('#cellphone').keypress(function(e){
	    if(e.which != 69 && e.which != 101 && e.which != 45 && e.which != 46 && e.which != 44 && e.which != 43){
	    } else {
	      return false;
	    }
	  });
	  
	  $('#phonenumber').keypress(function(e){
		    if(e.which != 69 && e.which != 101 && e.which != 45 && e.which != 46 && e.which != 44 && e.which != 43){
		    } else {
		      return false;
		    }
		  });
	});

	function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : evt.keyCode
    return !(charCode > 31 && (charCode < 48 || charCode > 57));
}

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
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"> <span
							class="glyphicon glyphicon-user"></span> Üye <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/HaritaUzerindeIsArama/userhome.jsp">Giriş Yap</a></li>
							<li><a href="/HaritaUzerindeIsArama/signupasuser.jsp">Kayıt Ol</a></li>

						</ul></li>
					<li class="dropdown active"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"> <span
							class="glyphicon glyphicon-user"></span> İşveren <span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/HaritaUzerindeIsArama/employerhome.jsp">Giriş
									Yap</a></li>
							<li  class="active"><a href="/HaritaUzerindeIsArama/signupasemployer.jsp">Kayıt
									Ol</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<form class="form-horizontal" role="form" action="addemployeruser"
				method="POST">
				<div class="col-md-5">
					<br>
					<h2 class="text-center text-primary">Firma Bilgileri</h2>
					<br>
					<div class="form-group">
						<label class="control-label col-sm-4" for="companyname">Firma
							Adı :</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="companyname"
								name="companyname" placeholder="Firma adı giriniz" required>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-4" for="sector">Sektörü
							:</label>
						<div class="col-sm-8">
							<select class="form-control" id="sector" name="sector" required>
							<option value=""></option>
								<option value="Arşiv Yönetimi ve Saklama">Arşiv
									Yönetimi ve Saklama</option>
								<option value="Atık Yönetimi ve Geri Dönüşüm">Atık
									Yönetimi ve Geri Dönüşüm</option>
								<option value="Basım-Yayın">Basım-Yayın</option>
								<option value="Elektronik Yayıncılık">
									&nbsp;&nbsp;Elektronik Yayıncılık</option>
								<option value="Kitabevi">&nbsp;&nbsp;Kitabevi</option>
								<option value="Matbaacılık">&nbsp;&nbsp;Matbaacılık</option>
								<option value="Dijital Baskı">&nbsp;&nbsp;Dijital Baskı</option>
								<option value="Süreli Yayınlar">&nbsp;&nbsp;Süreli
									Yayınlar</option>
								<option value="Yayıncılık">&nbsp;&nbsp;Yayıncılık</option>
								<option value="Bilişim">Bilişim</option>
								<option value="Bilişim Danışmanlığı">
									&nbsp;&nbsp;Bilişim Danışmanlığı</option>
								<option value=";Elektronik Kart Sistemleri">
									&nbsp;&nbsp;Elektronik Kart Sistemleri</option>
								<option value="İnternet">&nbsp;&nbsp;İnternet</option>
								<option value="Makine ve Ekipmanlar">
									&nbsp;&nbsp;Makine ve Ekipmanlar</option>
								<option value="Servisler">&nbsp;&nbsp;Servisler</option>
								<option value="Tüketici Ürünler">&nbsp;&nbsp;Tüketici
									Ürünler</option>
								<option value="Veri Merkezi">&nbsp;&nbsp;Veri Merkezi</option>
								<option value="Yazılım">&nbsp;&nbsp;Yazılım</option>
								<option value="Çevre">Çevre</option>
								<option value="Atık Yönetimi">&nbsp;&nbsp;Atık Yönetimi</option>
								<option value="Çevre Danışmanlığı">&nbsp;&nbsp;Çevre
									Danışmanlığı</option>
								<option value="Çevre Düzenleme">&nbsp;&nbsp;Çevre
									Düzenleme</option>
								<option value="Çevre Laboratuvarı">&nbsp;&nbsp;Çevre
									Laboratuvarı</option>
								<option value="İş Sağlığı ve Güvenliği">&nbsp;&nbsp;İş
									Sağlığı ve Güvenliği</option>
								<option value="Danışmanlık">Danışmanlık</option>
								<option value="Avukatlık ve Hukuki Danışmanlık">
									&nbsp;&nbsp;Avukatlık ve Hukuki Danışmanlık</option>
								<option value="Bilişim Danışmanlığı">
									&nbsp;&nbsp;Bilişim Danışmanlığı</option>
								<option value="Çevre Danışmanlığı">&nbsp;&nbsp;Çevre
									Danışmanlığı</option>
								<option value="Eğitim Danışmanlığı">&nbsp;&nbsp;Eğitim
									Danışmanlığı</option>
								<option value="Finans ve Yatırım Danışmanlığı">
									&nbsp;&nbsp;Finans ve Yatırım Danışmanlığı</option>
								<option value="İnsan Kaynakları Danışmanlığı">
									&nbsp;&nbsp;İnsan Kaynakları Danışmanlığı</option>
								<option value="Pazarlama Danışmanlığı">
									&nbsp;&nbsp;Pazarlama Danışmanlığı</option>
								<option value="Dayanıklı Tüketim Ürünleri">Dayanıklı
									Tüketim Ürünleri</option>
								<option value="Denizcilik">Denizcilik</option>
								<option value="Deniz Taşımacılığı">&nbsp;&nbsp;Deniz
									Taşımacılığı</option>
								<option value="Deniz Ürünleri">&nbsp;&nbsp;Deniz
									Ürünleri</option>
								<option value="Gemi Acentaları">&nbsp;&nbsp;Gemi
									Acentaları</option>
								<option value="Liman İşletmeleri ve Hizmetleri">
									&nbsp;&nbsp;Liman İşletmeleri ve Hizmetleri</option>
								<option value="Tersane / Gemi İnşa">
									&nbsp;&nbsp;Tersane / Gemi İnşa</option>
								<option>Diğer</option>
								<option value="Fotoğrafçılık">&nbsp;&nbsp;
									Fotoğrafçılık</option>
								<option value="Harita - Planma">&nbsp;&nbsp; Harita -
									Planma</option>
								<option value="Hediyelik Eşya">&nbsp;&nbsp; Hediyelik
									Eşya</option>
								<option value="Kamu / Devlet">&nbsp;&nbsp; Kamu /
									Devlet</option>
								<option value="Konsolosluk">&nbsp;&nbsp; Konsolosluk</option>
								<option value="Oyuncak - Oyun Grupları ve Sistemleri">
									&nbsp;&nbsp; Oyuncak - Oyun Grupları ve Sistemleri</option>
								<option value="Saatçilik">&nbsp;&nbsp; Saatçilik</option>
								<option value="Spor">&nbsp;&nbsp; Spor</option>
								<option value="Eğitim">Eğitim</option>
								<option value=" Çocuk Gelişim ve Eğitimi">&nbsp;&nbsp;
									Çocuk Gelişim ve Eğitimi</option>
								<option value="Eğitim Danışmanlığı">&nbsp;&nbsp; Eğitim
									Danışmanlığı</option>
								<option value="Eğitim Kurumları">&nbsp;&nbsp; Eğitim
									Kurumları</option>
								<option value="Dershane ve Kurslar">
									&nbsp;&nbsp;&nbsp;&nbsp; Dershane ve Kurslar</option>
								<option value="Okullar">&nbsp;&nbsp;&nbsp;&nbsp;
									Okullar</option>
								<option value="Üniversiteler">&nbsp;&nbsp;&nbsp;&nbsp;
									Üniversiteler</option>
								<option value="Öğrenci Yurtları">&nbsp;&nbsp; Öğrenci
									Yurtları</option>
								<option value="Yurtdışı Eğitim Danışmanlığı">
									&nbsp;&nbsp; Yurtdışı Eğitim Danışmanlığı</option>
								<option value="Eğlence - Kültür - Sanat">Eğlence -
									Kültür - Sanat</option>
								<option value="Eğlence Hizmetleri">&nbsp;&nbsp; Eğlence
									Hizmetleri</option>
								<option value="Eğlence Tesisleri">&nbsp;&nbsp; Eğlence
									Tesisleri</option>
								<option value="Alışveriş Merkezleri">
									&nbsp;&nbsp;&nbsp;&nbsp; Alışveriş Merkezleri</option>
								<option value="Restaurant-Bar-Cafe">
									&nbsp;&nbsp;&nbsp;&nbsp; Restaurant-Bar-Cafe</option>
								<option value="Müzik ve Müzik Organizasyon">
									&nbsp;&nbsp; Müzik ve Müzik Organizasyon</option>
								<option value="Sinema - Tiyatro">&nbsp;&nbsp; Sinema -
									Tiyatro</option>
								<option value="Elektrik & Elektronik">Elektrik &
									Elektronik</option>
								<option value="Akü -  Pil - Batarya">&nbsp;&nbsp; Akü -
									Pil - Batarya</option>
								<option value="Aydınlatma">&nbsp;&nbsp; Aydınlatma</option>
								<option value="Barkod">&nbsp;&nbsp; Barkod</option>
								<option value="Elektrik - Elektronik Malzemeleri">
									&nbsp;&nbsp; Elektrik - Elektronik Malzemeleri</option>
								<option value="Elektrik Üretim ve Dağıtımı">
									&nbsp;&nbsp; Elektrik Üretim ve Dağıtımı</option>
								<option value="Elektrikli ve Elektronik Aletler">
									&nbsp;&nbsp; Elektrikli ve Elektronik Aletler</option>
								<option value="Isıtma, Havalandırma ve Klima">
									&nbsp;&nbsp; Isıtma, Havalandırma ve Klima</option>
								<option value="Işık,Görüntü ve Ses Sistemleri">
									&nbsp;&nbsp; Işık,Görüntü ve Ses Sistemleri</option>
								<option value="Kablo ve Tel">&nbsp;&nbsp; Kablo ve Tel</option>
								<option value="Otomasyon">&nbsp;&nbsp; Otomasyon</option>
								<option value="Ölçü ve Kontrol Sistemleri">
									&nbsp;&nbsp; Ölçü ve Kontrol Sistemleri</option>
								<option value="Proje Taahhüt">&nbsp;&nbsp; Proje
									Taahhüt</option>
								<option value="Enerji">Enerji</option>
								<option value="Enerji Üretim ve Dağıtım">&nbsp;&nbsp;
									Enerji Üretim ve Dağıtım</option>
								<option value="Gaz Sanayi">&nbsp;&nbsp; Gaz Sanayi</option>
								<option value=" Doğalgaz">&nbsp;&nbsp;&nbsp;&nbsp;
									Doğalgaz</option>
								<option value="Jeneratör">&nbsp;&nbsp; Jeneratör</option>
								<option value="Petrol ve Ürünleri">&nbsp;&nbsp; Petrol
									ve Ürünleri</option>
								<option value="Yenilebilir Enerji">&nbsp;&nbsp;
									Yenilebilir Enerji</option>
								<option value="Ev Eşyaları">Ev Eşyaları</option>
								<option value="Beyaz Eşyalar">&nbsp;&nbsp; Beyaz
									Eşyalar</option>
								<option value="Elektrikli Ev Aletleri">&nbsp;&nbsp;
									Elektrikli Ev Aletleri</option>
								<option value="Ev Tekstili">&nbsp;&nbsp;Ev Tekstili</option>
								<option value="Halı / Kilim">&nbsp;&nbsp;Halı / Kilim</option>
								<option value="Mutfak Gereçleri">&nbsp;&nbsp;Mutfak
									Gereçleri</option>
								<option value="Yatak ve Yan Ürünleri">
									&nbsp;&nbsp;Yatak ve Yan Ürünleri</option>
								<option value="Züccaciye">&nbsp;&nbsp;Züccaciye</option>
								<option value="Finans - Ekonomi">Finans - Ekonomi</option>
								<option value="Bankacılık">&nbsp;&nbsp;Bankacılık</option>
								<option value="Borsa">&nbsp;&nbsp;Borsa</option>
								<option value="Faktorin">&nbsp;&nbsp;Faktoring</option>
								<option value="Finans ve Yatırım Danışmanlığı">&nbsp;&nbsp;
									Finans ve Yatırım Danışmanlığı</option>
								<option value="Leasing / Finansal Kiralama">
									&nbsp;&nbsp;Leasing / Finansal Kiralama</option>
								<option value="Yatırım">&nbsp;&nbsp;Yatırım</option>
								<option value="Gıda">Gıda</option>
								<option value="Bebek Besinleri">&nbsp;&nbsp;Bebek
									Besinleri</option>
								<option value="Bisküvi, Çikolata ve Şekerleme">
									&nbsp;&nbsp;Bisküvi, Çikolata ve Şekerleme</option>
								<option value="Catering">&nbsp;&nbsp;Catering</option>
								<option value="Çay Sanayi">&nbsp;&nbsp;Çay Sanayi</option>
								<option value="Deniz Ürünleri">&nbsp;&nbsp;Deniz
									Ürünleri</option>
								<option value="Et ve Et Ürünleri">&nbsp;&nbsp;Et ve Et
									Ürünleri</option>
								<option value="Gıda Hizmetleri">&nbsp;&nbsp;Gıda
									Hizmetleri</option>
								<option value="Gıda Makine / Ekipmanları">
									&nbsp;&nbsp;Gıda Makine / Ekipmanları</option>
								<option value="İçecek">&nbsp;&nbsp;İçecek</option>
								<option value="Alkollü İçecek">
									&nbsp;&nbsp;&nbsp;&nbsp; Alkollü İçecek</option>
								<option value="Kuruyemiş Sektörü">
									&nbsp;&nbsp;Kuruyemiş Sektörü</option>
								<option value="Pastane">&nbsp;&nbsp;Pastane</option>
								<option value="Restaurant - Cafe - Bar">
									&nbsp;&nbsp;Restaurant - Cafe - Bar</option>
								<option value="Su Ürünleri">&nbsp;&nbsp;Su Ürünleri</option>
								<option value="Süt ve Süt Ürünleri">&nbsp;&nbsp;Süt ve
									Süt Ürünleri</option>
								<option value="Tavukçuluk ve Yumurta">
									&nbsp;&nbsp;Tavukçuluk ve Yumurta</option>
								<option value="Un ve Unlu Mamülleri">&nbsp;&nbsp;Un ve
									Unlu Mamülleri</option>
								<option value="Güvenlik">Güvenlik</option>
								<option value="Elektronik Güvenlik Sistemleri">
									&nbsp;&nbsp;Elektronik Güvenlik Sistemleri</option>
								<option value="Güvenlik Hizmetleri">
									&nbsp;&nbsp;Güvenlik Hizmetleri</option>
								<option value="İş Güvenliği Ekipmanları">
									&nbsp;&nbsp;İş Güvenliği Ekipmanları</option>
								<option value="Havacılık">Havacılık</option>
								<option value="Hava Taşımacılığı">&nbsp;&nbsp;Hava
									Taşımacılığı</option>
								<option value="Uzay Teknolojileri">&nbsp;&nbsp;Uzay
									Teknolojileri</option>
								<option value="Hayvancılık">Hayvancılık</option>
								<option value="Arıcılık">&nbsp;&nbsp;Arıcılık</option>
								<option value="Balıkçılık">&nbsp;&nbsp;Balıkçılık</option>
								<option value="Evcil Hayvan">&nbsp;&nbsp;Evcil Hayvan</option>
								<option value="Küçükbaş ve Büyükbaş Hayvancılık">
									&nbsp;&nbsp;Küçükbaş ve Büyükbaş Hayvancılık</option>
								<option value="Tavukçuluk ve Yumurta">
									&nbsp;&nbsp;Tavukçuluk ve Yumurta</option>
								<option value="Yem Sanayi">&nbsp;&nbsp; Yem Sanayi</option>
								<option value="Hızlı Tüketim Malları">Hızlı Tüketim
									Malları</option>
								<option value="Hizmet">Hizmet</option>
								<option value="Araştırma Hizmetleri">
									&nbsp;&nbsp;Araştırma Hizmetleri</option>
								<option value="Çağrı Merkezi Hizmetleri">
									&nbsp;&nbsp;Çağrı Merkezi Hizmetleri</option>
								<option value="Çeviri Hizmetleri">&nbsp;&nbsp;Çeviri
									Hizmetleri</option>
								<option value="Dağıtım Hizmetleri">&nbsp;&nbsp;Dağıtım
									Hizmetleri</option>
								<option value="Denetim Hizmetleri">&nbsp;&nbsp;Denetim
									Hizmetleri</option>
								<option value="Eğlence Hizmetleri">&nbsp;&nbsp;Eğlence
									Hizmetleri</option>
								<option value="Gayrımenkul, Emlak İşleri">
									&nbsp;&nbsp;Gayrımenkul, Emlak İşleri</option>
								<option value="Emlak Geliştirme">
									&nbsp;&nbsp;&nbsp;&nbsp; Emlak Geliştirme</option>
								<option value="Gayrımenkul Değerleme">
									&nbsp;&nbsp;&nbsp;&nbsp; Gayrımenkul Değerleme</option>
								<option value="Gıda Hizmetleri">&nbsp;&nbsp;Gıda
									Hizmetleri</option>
								<option value="Gümrük Hizmetleri">&nbsp;&nbsp;Gümrük
									Hizmetleri</option>
								<option value="Mali Müşavirlik - Muhasebe">
									&nbsp;&nbsp;Mali Müşavirlik - Muhasebe</option>
								<option value="Marka - Patent Hizmetleri">
									&nbsp;&nbsp;Marka - Patent Hizmetleri</option>
								<option value="Medya Takip Hizmetleri">
									&nbsp;&nbsp;Medya Takip Hizmetleri</option>
								<option value="Mühendislik Hizmetleri">
									&nbsp;&nbsp;Mühendislik Hizmetleri</option>
								<option value="Network Proje Hizmetleri">
									&nbsp;&nbsp;Network Proje Hizmetleri</option>
								<option value="Ortak Sağlık Güvenlik Birimi">
									&nbsp;&nbsp;Ortak Sağlık Güvenlik Birimi</option>
								<option value="Oto Kiralama">&nbsp;&nbsp;Oto Kiralama</option>
								<option value="Sağlık Hizmetleri">&nbsp;&nbsp;Sağlık
									Hizmetleri</option>
								<option value="Temizlik Hizmetleri">
									&nbsp;&nbsp;Temizlik Hizmetleri</option>
								<option value="İletişim Danışmanlığı">İletişim
									Danışmanlığı</option>
								<option value="Kaynak ve Kesme Ekipmanları">Kaynak ve
									Kesme Ekipmanları</option>
								<option value="Kimya">Kimya</option>
								<option value="Boya Sanayi">&nbsp;&nbsp;Boya Sanayi</option>
								<option value="	Tekstil Boya ve Kimyasalları">
									&nbsp;&nbsp;&nbsp;&nbsp; Tekstil Boya ve Kimyasalları</option>
								<option value="Dermokozmetik">
									&nbsp;&nbsp;Dermokozmetik</option>
								<option value="Kimya Sanayi">&nbsp;&nbsp;Kimya Sanayi</option>
								<option value="Kozmetik">&nbsp;&nbsp; Kozmetik</option>
								<option value="Lastik / Kauçuk">&nbsp;&nbsp;Lastik /
									Kauçuk</option>
								<option value="Oto Lastiği">&nbsp;&nbsp;&nbsp;&nbsp;
									Oto Lastiği</option>
								<option value="Plastik ve Ürünleri">
									&nbsp;&nbsp;Plastik ve Ürünleri</option>
								<option value="Temizlik Malzemeleri">
									&nbsp;&nbsp;Temizlik Malzemeleri</option>
								<option value="Yapı Kimyasalları">&nbsp;&nbsp;Yapı
									Kimyasalları</option>
								<option value="Maden ve Metal Sanayi">Maden ve Metal
									Sanayi</option>
								<option value="Değerli Madenler ve Mamülleri / Kuyumculuk">
									&nbsp;&nbsp;Değerli Madenler ve Mamülleri / Kuyumculuk</option>
								<option value="Mücevherat">&nbsp;&nbsp;&nbsp;&nbsp;
									Mücevherat</option>
								<option value="Hırdavat Sanayi">&nbsp;&nbsp;Hırdavat
									Sanayi</option>
								<option value="Madencilik - Metalurji">
									&nbsp;&nbsp;Madencilik - Metalurji</option>
								<option value="Mermer Sanayi">&nbsp;&nbsp;Mermer Sanayi</option>
								<option value="Metal Sanayi">&nbsp;&nbsp;Metal Sanayi</option>
								<option value="Alüminyum">&nbsp;&nbsp;&nbsp;&nbsp;
									Alüminyum</option>
								<option value="Çelik Montaj İmalat">
									&nbsp;&nbsp;&nbsp;&nbsp;Çelik Montaj İmalat</option>
								<option value="Demir- Çelik">&nbsp;&nbsp;&nbsp;&nbsp;
									Demir- Çelik</option>
								<option value="Mineraller">&nbsp;&nbsp;Mineraller</option>
								<option value="Medya">Medya</option>
								<option value="Basın ve Haber Ajansları">
									&nbsp;&nbsp;Basın ve Haber Ajansları</option>
								<option value="Medya Satınalma Firmaları">
									&nbsp;&nbsp;Medya Satınalma Firmaları</option>
								<option value="Medya Takip Hizmetler">
									&nbsp;&nbsp;Medya Takip Hizmetler</option>
								<option value="Prodüksiyon">&nbsp;&nbsp;Prodüksiyon</option>
								<option value="Radyo - TV">&nbsp;&nbsp;Radyo - TV</option>
								<option value="Reklam Satış Firmaları">
									&nbsp;&nbsp;Reklam Satış Firmaları</option>
								<option value="Seri İlan Ajansları">&nbsp;&nbsp;Seri
									İlan Ajansları</option>
								<option value="Mobilya & Aksesuar">Mobilya & Aksesuar</option>
								<option value="Aksesuar">&nbsp;&nbsp;Aksesuar</option>
								<option value="Bahçe Mobilyaları">&nbsp;&nbsp;Bahçe
									Mobilyaları</option>
								<option value="Ev Mobilyaları">&nbsp;&nbsp;Ev
									Mobilyaları</option>
								<option value="Ofis Mobilyaları">&nbsp;&nbsp;Ofis
									Mobilyaları</option>
								<option value="Şehir Mobilyaları">&nbsp;&nbsp;Şehir
									Mobilyaları</option>
								<option value="Ofis / Büro Malzemeleri">Ofis / Büro
									Malzemeleri</option>
								<option value="Büro Makineleri">&nbsp;&nbsp;Büro
									Makineleri</option>
								<option value="Kırtasiye">&nbsp;&nbsp;Kırtasiye</option>
								<option value="Ofis Mobilyası ve Dekorasyonu">
									&nbsp;&nbsp;Ofis Mobilyası ve Dekorasyonu</option>
								<option value="Orman Ürünleri">Orman Ürünleri</option>
								<option value="Ağaç - Kereste">&nbsp;&nbsp;Ağaç -
									Kereste</option>
								<option value="Kağıt ve Selüloz Sanayi">
									&nbsp;&nbsp;Kağıt ve Selüloz Sanayi</option>
								<option value="Otomotiv">Otomotiv</option>
								<option value="Bisiklet ve Motosiklet">
									&nbsp;&nbsp;Bisiklet ve Motosiklet</option>
								<option value="Oto Aksesuarları">&nbsp;&nbsp;Oto
									Aksesuarları</option>
								<option value="Oto Kiralama">&nbsp;&nbsp;Oto Kiralama</option>
								<option value="Oto Lastiği">&nbsp;&nbsp;Oto Lastiği</option>
								<option value="Oto Yedek Parça ve Yan Sanayi">
									&nbsp;&nbsp;Oto Yedek Parça ve Yan Sanayi</option>
								<option value="Oto Yetkili Satıcıları">&nbsp;&nbsp;Oto
									Yetkili Satıcıları</option>
								<option value="Tamir, Bakım, Servis ve Ekipmanları">
									&nbsp;&nbsp;Tamir, Bakım, Servis ve Ekipmanları</option>
								<option value="Perakende">Perakende</option>
								<option value="Reklam ve Tanıtım">Reklam ve Tanıtım</option>
								<option value="Açık Hava Reklamcılığı">
									&nbsp;&nbsp;Açık Hava Reklamcılığı</option>
								<option value="Film, Grafik ve Renk Ayrım İşleri">
									&nbsp;&nbsp;Film, Grafik ve Renk Ayrım İşleri</option>
								<option value="Fuarcılık">&nbsp;&nbsp;Fuarcılık</option>
								<option value="Halkla İlişkiler">&nbsp;&nbsp;Halkla
									İlişkiler</option>
								<option value="Manken Ajansları">&nbsp;&nbsp;Manken
									Ajansları</option>
								<option value="Organizasyon ve Animasyon Hizmetleri">
									&nbsp;&nbsp;Organizasyon ve Animasyon Hizmetleri</option>
								<option value="Promosyon Ürünleri">
									&nbsp;&nbsp;Promosyon Ürünleri</option>
								<option value="Reklamcılık">&nbsp;&nbsp;Reklamcılık</option>
								<option value="Teşhir Malzemeleri">&nbsp;&nbsp;Teşhir
									Malzemeleri</option>
								<option value="Sağlık">Sağlık</option>
								<option value="Bakım, Diyet ve Güzellik Merkezleri">
									&nbsp;&nbsp;Bakım, Diyet ve Güzellik Merkezleri</option>
								<option value="Dermokozmetik">
									&nbsp;&nbsp;Dermokozmetik</option>
								<option value="İlaç Sanayi">&nbsp;&nbsp;İlaç Sanayi</option>
								<option value="Biyoteknoloji">&nbsp;&nbsp;&nbsp;&nbsp;
									Biyoteknoloji</option>
								<option value="Ecza Depoları ve Eczaneler">
									&nbsp;&nbsp;&nbsp;&nbsp; Ecza Depoları ve Eczaneler</option>
								<option value="İş Güvenliği ve Sağlığı">&nbsp;&nbsp;İş
									Güvenliği ve Sağlığı</option>
								<option value="Medikal Ürünler">&nbsp;&nbsp;Medikal
									Ürünler</option>
								<option value="Optik">&nbsp;&nbsp;Optik</option>
								<option value="Sağlık Hizmetleri">&nbsp;&nbsp;Sağlık
									Hizmetleri</option>
								<option value="Ambulans Servisleri">
									&nbsp;&nbsp;&nbsp;&nbsp; Ambulans Servisleri</option>
								<option value="Evde Bakım Hizmetleri">
									&nbsp;&nbsp;&nbsp;&nbsp; Evde Bakım Hizmetleri</option>
								<option value="Sağlık Kuruluşları">&nbsp;&nbsp;Sağlık
									Kuruluşları</option>
								<option value="Hastaneler">&nbsp;&nbsp;&nbsp;&nbsp;
									Hastaneler</option>
								<option value="Klinikler">&nbsp;&nbsp;&nbsp;&nbsp;
									Klinikler</option>
								<option value="Veterinerler">&nbsp;&nbsp;&nbsp;&nbsp;
									Veterinerler</option>
								<option value="Tıbbi Cihaz ve Malzemeler">
									&nbsp;&nbsp;Tıbbi Cihaz ve Malzemeler</option>
								<option value="Tıbbi Laboratuarlar">&nbsp;&nbsp;Tıbbi
									Laboratuarlar</option>
								<option value="Sigortacılık">Sigortacılık</option>
								<option value="Elementer">&nbsp;&nbsp;Elementer</option>
								<option value="Hayat ve Emeklilik">&nbsp;&nbsp;Hayat ve
									Emeklilik</option>
								<option value="Sağlık">&nbsp;&nbsp;Sağlık</option>
								<option value="Tarım / Ziraat">Tarım / Ziraat</option>
								<option value="Bağcılık">&nbsp;&nbsp;Bağcılık</option>
								<option value="Bitki Besleme Ürünleri Üretimi">
									&nbsp;&nbsp;Bitki Besleme Ürünleri Üretimi</option>
								<option value="Çay Sanayi">&nbsp;&nbsp;Çay Sanayi</option>
								<option value="Fidancılık - Çiçekçilik">
									&nbsp;&nbsp;Fidancılık - Çiçekçilik</option>
								<option value="Gübre Üretimi">&nbsp;&nbsp;Gübre Üretimi</option>
								<option value="Seracılık">&nbsp;&nbsp;Seracılık</option>
								<option value="Tarım Araç ve Ekipmanları">&nbsp;&nbsp;Tarım Araç ve Ekipmanları</option>
								<option value="Tarım İlaçları">
									&nbsp;&nbsp;Tarım İlaçları</option>
								<option value="Tarım Ürünleri">&nbsp;&nbsp;Tarım
									Ürünleri</option>
								<option value="Tütün Sanayi">&nbsp;&nbsp;Tütün Sanayi</option>
								<option value="Taşımacılık">Taşımacılık</option>
								<option value="Demiryolu Taşımacılığı">
									&nbsp;&nbsp;Demiryolu Taşımacılığı</option>
								<option value="Deniz Taşımacılığı">&nbsp;&nbsp;Deniz
									Taşımacılığı</option>
								<option value="Depo - Antrepo">&nbsp;&nbsp;Depo -
									Antrepo</option>
								<option value="Gümrük Hizmetleri">&nbsp;&nbsp;Gümrük
									Hizmetleri</option>
								<option value="Hava Taşımacılığı">&nbsp;&nbsp;Hava
									Taşımacılığı</option>
								<option value="Karayolu Taşımacılığı">
									&nbsp;&nbsp;Karayolu Taşımacılığı</option>
								<option value="Kargo - Kurye">&nbsp;&nbsp;Kargo - Kurye</option>
								<option value="Lojistik">&nbsp;&nbsp;Lojistik</option>
								<option value="Nakliye">&nbsp;&nbsp;Nakliye</option>
								<option value="Otobüs Şirketleri">&nbsp;&nbsp;Otobüs
									Şirketleri</option>
								<option value="Sevkiyat (Forwarding)">
									&nbsp;&nbsp;Sevkiyat (Forwarding)</option>
								<option value="Uluslararası Taşımacılık ve Nakliyat">
									&nbsp;&nbsp;Uluslararası Taşımacılık ve Nakliyat</option>
								<option value="Tekstil">Tekstil</option>
								<option value="Aksesuar">&nbsp;&nbsp;Aksesuar</option>
								<option value="Deri">&nbsp;&nbsp;Deri</option>
								<option value="Ev Tekstili">&nbsp;&nbsp;Ev Tekstili</option>
								<option value="Giyim">&nbsp;&nbsp;Giyim</option>
								<option value="Ayakkabıcılık">&nbsp;&nbsp;&nbsp;&nbsp;
									Ayakkabıcılık</option>
								<option value="Çorap Sanayi">&nbsp;&nbsp;&nbsp;&nbsp;
									Çorap Sanayi</option>
								<option value="Hazır Giyim">&nbsp;&nbsp;&nbsp;&nbsp;
									Hazır Giyim</option>
								<option value="Mağazacılık (Tekstil)">
									&nbsp;&nbsp;&nbsp;&nbsp; Mağazacılık (Tekstil)</option>
								<option value="Moda Tasarım">&nbsp;&nbsp;&nbsp;&nbsp;
									Moda Tasarım</option>
								<option value="Kumaş & İplik">&nbsp;&nbsp;Kumaş & İplik</option>
								<option value="Tekstil Boya ve Kimyasalları">
									&nbsp;&nbsp;Tekstil Boya ve Kimyasalları</option>
								<option value="Tekstil Makineleri ve Parçaları">
									&nbsp;&nbsp;Tekstil Makineleri ve Parçaları</option>
								<option value="Telekomünikasyon">Telekomünikasyon</option>
								<option value="Çağrı Merkezi Ürün ve Hizmetleri">
									&nbsp;&nbsp;Çağrı Merkezi Ürün ve Hizmetleri</option>
								<option value="Makine ve Ekipmanlar">
									&nbsp;&nbsp;Makine ve Ekipmanlar</option>
								<option value="Network Proje Hizmetleri">
									&nbsp;&nbsp;Network Proje Hizmetleri</option>
								<option value="Servis Sağlayıcılar">&nbsp;&nbsp;Servis
									Sağlayıcılar</option>
								<option value="Tüketici Ürünleri">&nbsp;&nbsp;Tüketici
									Ürünleri</option>
								<option value="Cep Telefonları ve Aksesuarları">
									&nbsp;&nbsp;Cep Telefonları ve Aksesuarları</option>
								<option value="Ticaret">Ticaret</option>
								<option value="Alışveriş Merkezi">
									&nbsp;&nbsp;Alışveriş Merkezi</option>
								<option value="E-ticaret">&nbsp;&nbsp;E-ticaret</option>
								<option value="İç Ticaret">&nbsp;&nbsp;İç Ticaret</option>
								<option value="İthalat - İhracat">&nbsp;&nbsp;İthalat -
									İhracat</option>
								<option value="Mağazacılık (Ticaret)">
									&nbsp;&nbsp;Mağazacılık (Ticaret)</option>
								<option value="Market">&nbsp;&nbsp;Market</option>
								<option value="Topluluklar">Topluluklar</option>
								<option value="Birlikler">&nbsp;&nbsp;Birlikler</option>
								<option value="Dernekler">&nbsp;&nbsp;Dernekler</option>
								<option value="Holding / Şirketler Grubu">
									&nbsp;&nbsp;Holding / Şirketler Grubu</option>
								<option value="Sivil Toplum Kuruluşları">
									&nbsp;&nbsp;Sivil Toplum Kuruluşları</option>
								<option value="Vakıflar">&nbsp;&nbsp;Vakıflar</option>
								<option value="Turizm">Turizm</option>
								<option value="Konaklama ve Otelcilik">
									&nbsp;&nbsp;Konaklama ve Otelcilik</option>
								<option value="Otel Ekipmanları">&nbsp;&nbsp;Otel
									Ekipmanları</option>
								<option value="Seyahat Acentaları">&nbsp;&nbsp;Seyahat
									Acentaları</option>
								<option value="Yiyecek Hizmetleri">&nbsp;&nbsp;Yiyecek
									Hizmetleri</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-4" for="phonenumber">Telefon
							No :</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="phonenumber"
								name="phonenumber" placeholder="XXXXXXXXXXX" maxlength="11" onkeypress="return isNumberKey(event);" required>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-4" for="district">Semt
							:</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="district"
								name="district" placeholder="örn. Göztepe" required>
						</div>
					</div>


					<div class="form-group">
						<label class="control-label col-sm-4" for="town">İlçe :</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="town" name="town"
								placeholder="örn. Kadıköy" required>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-4" for="city">Şehir :</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="city" name="city"
								placeholder="örn. İstanbul" required>
						</div>
					</div>

				</div>


				<div class="col-md-1"></div>
				<div class="col-md-5">
					<br>
					<h2 class="text-center text-primary">Kullanıcı Bilgileri</h2>
					<br>

					<div class="form-group">
						<label class="control-label col-sm-4" for="name">Ad :</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="name" name="name" placeholder="Ad" required pattern="\w+"  value="${param.name}"/>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-4" for="surname">Soyad
							:</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="surname" name="surname"
								placeholder="Soyad" required pattern="\w+" value="${param.surname}">
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-4" for="email">E-Posta
							Adresi :</label>
						<div class="col-sm-8">
							<input type="email" class="form-control" id="email" name="email"  value="${param.email}"
								placeholder="E-posta Adresi" data-toggle="tooltip" title="İşverenlerin sizinle kolayca iletişime geçebilmesi için, sürekli kullandığınız bir mail adresi girebilirsiniz."
								  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-4" for="cellphone">Cep
							Telefon No :</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="cellphone" name="cellphone"
								 placeholder="XXXXXXXXXXX" maxlength="11" onkeypress="return isNumberKey(event);"  value="${param.cellphone}"   required>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-4" for="username">Kullanıcı
							Adı :</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="username"
								name="username" placeholder="Kullanıcı Adı"  required/>
								<div  style="display: none" id="dvErrorMessage" class="alert-box error"><span>error: </span><%= session.getAttribute("errorMessage") %></div>
						</div>
					</div>

<%session.removeAttribute("errorMessage");%>
					<div class="form-group">
						<label class="control-label col-sm-4" for="password">Şifre
							:</label>
						<div class="col-sm-8">
							<input type="password" class="form-control" id="password" name="password"
								placeholder="Şifre"  data-toggle="tooltip" title="En az 6 karakter içermelidir.Büyük,küçük harf ve numara içermelidir." required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" onchange="form.pwd2.pattern = this.value;"/>
						
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