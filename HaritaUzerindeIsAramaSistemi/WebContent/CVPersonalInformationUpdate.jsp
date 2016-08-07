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
<html>
<head>
 
<title>İşBurada.com</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1h11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
<script>
	$(function() {
		$("#datepicker").datepicker({ dateFormat: "dd-mm-yy" }).val()
	});
</script>
<style>
.form-control {
	width: 450px;
}

.width-button {
	width: 450px;
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



.center {
	margin: auto;
	width: 70%;
	border: 2px solid white;
	padding: 10px;
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
<!-- Only Numbera -->
<script>
function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : evt.keyCode
    return !(charCode > 31 && (charCode < 48 || charCode > 57));
}
</script>
<%
ConnectionHelper conn= new ConnectionHelper();
Connection con = conn.getConnection();
PreparedStatement stmt2 = null;
ResultSet rs2 = null;
String userName=request.getRemoteUser();
String ID ="";
String	MaritalStatus = "";
String Gender ="";
String BirthDate = "";
String BirthPlace = "";
String Nationality = "";
String	DrivingLicence = "";
String DisabledInfo = "";
String DisabledPercentage ="";
String HealthCertificate="";
String HealthCertificatetxt ="";
String ChronicIlness ="";
String ChronicIlnesstxt="";
String UsedMedicine="";
String UsedMedicinetxt ="";
String CommunicableIllness="";
String CommunicableIllnesstxt="";
String LossOfConsciousness="";
String LossOfConsciousnesstxt="";

 String query2 = "SELECT * FROM tblPersonalInformation WHERE UserName=?";
 stmt2 = conn.getStatement(con, query2);

 try {
	 	
	 	stmt2.setString(1,userName);
	 	rs2 = stmt2.executeQuery();

		while (rs2.next()) {
			ID=rs2.getString("ID");
			MaritalStatus = rs2.getString("MaritalStatus");
			Gender=rs2.getString("Gender");
			BirthDate = rs2.getString("BirthDate");
			BirthPlace= rs2.getString("BirthPlace");
			Nationality=rs2.getString("Nationality");
			DrivingLicence=rs2.getString("DrivingLicence");
			DisabledInfo= rs2.getString("DisabledInfo");
			DisabledPercentage= rs2.getString("DisabledPercentage");
			HealthCertificate=rs2.getString("HealthCertificate");
			HealthCertificatetxt=rs2.getString("HealthCertificatetxt");
			ChronicIlness=rs2.getString("ChronicIlness");
			ChronicIlnesstxt=rs2.getString("ChronicIlnesstxt");
			UsedMedicine=rs2.getString("UsedMedicine");
			UsedMedicinetxt=rs2.getString("UsedMedicinetxt");
			CommunicableIllness=rs2.getString("CommunicableIllness");
			CommunicableIllnesstxt=rs2.getString("CommunicableIllnesstxt");
			LossOfConsciousness=rs2.getString("LossOfConsciousness");
			LossOfConsciousnesstxt=rs2.getString("LossOfConsciousnesstxt");

		} 		
	%>
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

 <form class="form-horizontal" data-toggle="validator" name="sform" method="POST" action="CVPersonalInformationUpdateServlet" data-fv-framework="bootstrap"
		data-fv-framework="bootstrap"
		data-fv-icon-valid="glyphicon glyphicon-ok"
		data-fv-icon-invalid="glyphicon glyphicon-remove"
		data-fv-icon-validating="glyphicon glyphicon-refresh">
		<div class="container">
		<p><br><br></p>
			<ul class="nav nav-pills col-md-offset-2   ">
				<li ><a data-toggle="pill"
					href="CVContactInformationUpdate.jsp">İletişim Bilgileri</a></li>
				<li class="active" ><a data-toggle="pill" href="CVPersonalInformationUpdate.jsp">Kişisel Bilgiler</a></li>
				<li><a data-toggle="pill" href="CVEducationalInfoUpdate2.jsp">Eğitim Bilgileri</a></li>
				<li><a data-toggle="pill" href="CVBusinessInfoUpdate2.jsp">İş Deneyimi</a></li>
				<li><a data-toggle="pill" href="CVForeignLanguageInfoUpdate2.jsp">Yabancı Dil</a></li>
				<li><a data-toggle="pill" href="CVReferenceInfoUpdate2.jsp">Referans Bilgileri</a></li>
			<li><a data-toggle="pill" href="CVAdditionalInfoUpdate.jsp">Ek Bilgiler</a></li>
			</ul>

			<div class="tab-content text-center">
				<div id="home" class="tab-pane fade in active">
				 <p><br></p>
					<div class="container  ">


 
 <div class="form-group">
      <label class="control-label col-sm-5" for="ID">TC Kimlik No *&nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">          
        <input type="text" class="form-control"  name="ID" placeholder="TC Kimlik Numaranız" value="<%=ID %>" required placeholder="" maxlength="11" onkeypress="return isNumberKey(event);">
      </div>
    </div>
    
      
    <div class="form-group">
      <label class="control-label col-sm-5" for="MaritalStatus">Medeni Durum *&nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">          
       <select name="MaritalStatusDrpdwnlst" class="form-control" required >
       <option value="<%=MaritalStatus %>"><%=MaritalStatus %></option>
       <option>------------</option>
       <option value="Bekar">Bekar</option>
        <option value="Evli">Evli</option>
       </select>
      </div>
    </div>
    
       
    <div class="form-group">
      <label class="control-label col-sm-5" for="Gender">Cinsiyet *&nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">          
       <select name="genderRadioBttn" class="form-control" required >
       <option value="<%=Gender%>"><%=Gender%></option>
       <option>------------</option>
       <option value="Kadın">Kadın</option>
        <option value="Erkek">Erkek</option>
       </select>
      </div>
    </div>
 
    
    <div class="form-group">
      <label class="control-label col-sm-5" for="BirthDate">Doğum Tarihi *&nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">          
        <input type="text" id="datepicker" class="form-control" value="<%=BirthDate%>" name="BirthDate" required placeholder="">
      </div>
    </div>
    
 <div class="form-group">
      <label class="control-label col-sm-5" for="BirthPlace">Dogum Yeri &nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">          
        <input type="text" class="form-control" name="BirthPlace" value="<%=BirthPlace%>" >
      </div>
    </div>  
      <div class="form-group">
      <label class="control-label col-sm-5" for="Nationality">Uyruk &nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">          
        <select  class="form-control" name="Nationality" required>
         <option value="<%=Nationality%>"><%=Nationality%></option>
          <option value="">-------------</option>
  <option value="">Seçiniz</option>
  <option value="Türk">Türkiye Cumhuriyeti</option>
  <option value="afghan">Afghan</option>
  <option value="albanian">Albanian</option>
  <option value="algerian">Algerian</option>
  <option value="american">American</option>
  <option value="andorran">Andorran</option>
  <option value="angolan">Angolan</option>
  <option value="antiguans">Antiguans</option>
  <option value="argentinean">Argentinean</option>
  <option value="armenian">Armenian</option>
  <option value="australian">Australian</option>
  <option value="austrian">Austrian</option>
  <option value="azerbaijani">Azerbaijani</option>
  <option value="bahamian">Bahamian</option>
  <option value="bahraini">Bahraini</option>
  <option value="bangladeshi">Bangladeshi</option>
  <option value="barbadian">Barbadian</option>
  <option value="barbudans">Barbudans</option>
  <option value="batswana">Batswana</option>
  <option value="belarusian">Belarusian</option>
  <option value="belgian">Belgian</option>
  <option value="belizean">Belizean</option>
  <option value="beninese">Beninese</option>
  <option value="bhutanese">Bhutanese</option>
  <option value="bolivian">Bolivian</option>
  <option value="bosnian">Bosnian</option>
  <option value="brazilian">Brazilian</option>
  <option value="british">British</option>
  <option value="bruneian">Bruneian</option>
  <option value="bulgarian">Bulgarian</option>
  <option value="burkinabe">Burkinabe</option>
  <option value="burmese">Burmese</option>
  <option value="burundian">Burundian</option>
  <option value="cambodian">Cambodian</option>
  <option value="cameroonian">Cameroonian</option>
  <option value="canadian">Canadian</option>
  <option value="cape verdean">Cape Verdean</option>
  <option value="central african">Central African</option>
  <option value="chadian">Chadian</option>
  <option value="chilean">Chilean</option>
  <option value="chinese">Chinese</option>
  <option value="colombian">Colombian</option>
  <option value="comoran">Comoran</option>
  <option value="congolese">Congolese</option>
  <option value="costa rican">Costa Rican</option>
  <option value="croatian">Croatian</option>
  <option value="cuban">Cuban</option>
  <option value="cypriot">Cypriot</option>
  <option value="czech">Czech</option>
  <option value="danish">Danish</option>
  <option value="djibouti">Djibouti</option>
  <option value="dominican">Dominican</option>
  <option value="dutch">Dutch</option>
  <option value="east timorese">East Timorese</option>
  <option value="ecuadorean">Ecuadorean</option>
  <option value="egyptian">Egyptian</option>
  <option value="emirian">Emirian</option>
  <option value="equatorial guinean">Equatorial Guinean</option>
  <option value="eritrean">Eritrean</option>
  <option value="estonian">Estonian</option>
  <option value="ethiopian">Ethiopian</option>
  <option value="fijian">Fijian</option>
  <option value="filipino">Filipino</option>
  <option value="finnish">Finnish</option>
  <option value="french">French</option>
  <option value="gabonese">Gabonese</option>
  <option value="gambian">Gambian</option>
  <option value="georgian">Georgian</option>
  <option value="german">German</option>
  <option value="ghanaian">Ghanaian</option>
  <option value="greek">Greek</option>
  <option value="grenadian">Grenadian</option>
  <option value="guatemalan">Guatemalan</option>
  <option value="guinea-bissauan">Guinea-Bissauan</option>
  <option value="guinean">Guinean</option>
  <option value="guyanese">Guyanese</option>
  <option value="haitian">Haitian</option>
  <option value="herzegovinian">Herzegovinian</option>
  <option value="honduran">Honduran</option>
  <option value="hungarian">Hungarian</option>
  <option value="icelander">Icelander</option>
  <option value="indian">Indian</option>
  <option value="indonesian">Indonesian</option>
  <option value="iranian">Iranian</option>
  <option value="iraqi">Iraqi</option>
  <option value="irish">Irish</option>
  <option value="israeli">Israeli</option>
  <option value="italian">Italian</option>
  <option value="ivorian">Ivorian</option>
  <option value="jamaican">Jamaican</option>
  <option value="japanese">Japanese</option>
  <option value="jordanian">Jordanian</option>
  <option value="kazakhstani">Kazakhstani</option>
  <option value="kenyan">Kenyan</option>
  <option value="kittian and nevisian">Kittian and Nevisian</option>
  <option value="kuwaiti">Kuwaiti</option>
  <option value="kyrgyz">Kyrgyz</option>
  <option value="laotian">Laotian</option>
  <option value="latvian">Latvian</option>
  <option value="lebanese">Lebanese</option>
  <option value="liberian">Liberian</option>
  <option value="libyan">Libyan</option>
  <option value="liechtensteiner">Liechtensteiner</option>
  <option value="lithuanian">Lithuanian</option>
  <option value="luxembourger">Luxembourger</option>
  <option value="macedonian">Macedonian</option>
  <option value="malagasy">Malagasy</option>
  <option value="malawian">Malawian</option>
  <option value="malaysian">Malaysian</option>
  <option value="maldivan">Maldivan</option>
  <option value="malian">Malian</option>
  <option value="maltese">Maltese</option>
  <option value="marshallese">Marshallese</option>
  <option value="mauritanian">Mauritanian</option>
  <option value="mauritian">Mauritian</option>
  <option value="mexican">Mexican</option>
  <option value="micronesian">Micronesian</option>
  <option value="moldovan">Moldovan</option>
  <option value="monacan">Monacan</option>
  <option value="mongolian">Mongolian</option>
  <option value="moroccan">Moroccan</option>
  <option value="mosotho">Mosotho</option>
  <option value="motswana">Motswana</option>
  <option value="mozambican">Mozambican</option>
  <option value="namibian">Namibian</option>
  <option value="nauruan">Nauruan</option>
  <option value="nepalese">Nepalese</option>
  <option value="new zealander">New Zealander</option>
  <option value="ni-vanuatu">Ni-Vanuatu</option>
  <option value="nicaraguan">Nicaraguan</option>
  <option value="nigerien">Nigerien</option>
  <option value="north korean">North Korean</option>
  <option value="northern irish">Northern Irish</option>
  <option value="norwegian">Norwegian</option>
  <option value="omani">Omani</option>
  <option value="pakistani">Pakistani</option>
  <option value="palauan">Palauan</option>
  <option value="panamanian">Panamanian</option>
  <option value="papua new guinean">Papua New Guinean</option>
  <option value="paraguayan">Paraguayan</option>
  <option value="peruvian">Peruvian</option>
  <option value="polish">Polish</option>
  <option value="portuguese">Portuguese</option>
  <option value="qatari">Qatari</option>
  <option value="romanian">Romanian</option>
  <option value="russian">Russian</option>
  <option value="rwandan">Rwandan</option>
  <option value="saint lucian">Saint Lucian</option>
  <option value="salvadoran">Salvadoran</option>
  <option value="samoan">Samoan</option>
  <option value="san marinese">San Marinese</option>
  <option value="sao tomean">Sao Tomean</option>
  <option value="saudi">Saudi</option>
  <option value="scottish">Scottish</option>
  <option value="senegalese">Senegalese</option>
  <option value="serbian">Serbian</option>
  <option value="seychellois">Seychellois</option>
  <option value="sierra leonean">Sierra Leonean</option>
  <option value="singaporean">Singaporean</option>
  <option value="slovakian">Slovakian</option>
  <option value="slovenian">Slovenian</option>
  <option value="solomon islander">Solomon Islander</option>
  <option value="somali">Somali</option>
  <option value="south african">South African</option>
  <option value="south korean">South Korean</option>
  <option value="spanish">Spanish</option>
  <option value="sri lankan">Sri Lankan</option>
  <option value="sudanese">Sudanese</option>
  <option value="surinamer">Surinamer</option>
  <option value="swazi">Swazi</option>
  <option value="swedish">Swedish</option>
  <option value="swiss">Swiss</option>
  <option value="syrian">Syrian</option>
  <option value="taiwanese">Taiwanese</option>
  <option value="tajik">Tajik</option>
  <option value="tanzanian">Tanzanian</option>
  <option value="thai">Thai</option>
  <option value="togolese">Togolese</option>
  <option value="tongan">Tongan</option>
  <option value="trinidadian or tobagonian">Trinidadian or Tobagonian</option>
  <option value="tunisian">Tunisian</option>
 
  <option value="tuvaluan">Tuvaluan</option>
  <option value="ugandan">Ugandan</option>
  <option value="ukrainian">Ukrainian</option>
  <option value="uruguayan">Uruguayan</option>
  <option value="uzbekistani">Uzbekistani</option>
  <option value="venezuelan">Venezuelan</option>
  <option value="vietnamese">Vietnamese</option>
  <option value="welsh">Welsh</option>
  <option value="yemenite">Yemenite</option>
  <option value="zambian">Zambian</option>
  <option value="zimbabwean">Zimbabwean</option>
        
        </select>
      </div>
    </div>
       <div class="form-group">
      <label class="control-label col-sm-5" for="DrivingLicence">Surucu Belgesi &nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">          
       <select name="DrivingLicence" class="form-control" required >
       <option value="<%=DrivingLicence %>"><%=DrivingLicence %></option>
       <option>------------</option>
       <option value="Var">Var</option>
        <option value="Yok">Yok</option>
       </select>
      </div>
    </div>
    
      <hr>
     <div class="form-group">
      <label class="control-label col-sm-5" for="DisabledInfo">Engel Bilgisi &nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">          
       <select name="DisabledInfo" class="form-control" >
       <option value="<%=DisabledInfo  %>"><%=DisabledInfo  %></option>
       <option>------------</option>
       <option value="Var">Var</option>
        <option value="Yok">Yok</option>
       </select>
      </div>
    </div>

	<div class="form-group">
      <label class="control-label col-sm-5" id="Percentagelbl" for="Percentagelbl">Yüzdesi &nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">          
        <select class="form-control" name="Percentage"  >
        <option value="<%=DisabledPercentage%>"><%=DisabledPercentage%></option>
         <option value="">--------------</option>
        <option value="5">%5</option>
        <option value="10">%10</option>
        <option value="15">%15</option>
        <option value="20">%20</option>
        <option value="25">%25</option>
        <option value="30">%30</option>
        <option value="35">%35</option>
        <option value="40">%40</option>
        <option value="45">%45</option>
        <option value="50">%50</option>
        <option value="55">%55</option>
        <option value="60">%60</option>
        <option value="65">%65</option>
        <option value="70">%70</option>
        <option value="75">%75</option>
        <option value="80">%80</option>
        <option value="85">%85</option>
        <option value="90">%90</option>
        <option value="95">%95</option>
        <option value="100">%100</option>
        </select>
      </div>
    </div>
	
	<div class="form-group">
      <label class="control-label col-sm-5" for="HealthCertificate ">Sağlık Raporunuz Var Mı? &nbsp;&nbsp;&nbsp;:</label>
         <div class="col-sm-1">
        <input TYPE=radio name="HealthCertificate" value="Evet" >  Evet <BR>        
      </div>
    <div class="col-sm-1">
        <input TYPE="text" class="form-control" name="HealthCertificatetxt" value="<%=HealthCertificatetxt  %>" placeholder="Açıklama" >      
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-5" for="ChronicIlness  ">Kronik Bir Rahatsızlığınız Var Mı? &nbsp;&nbsp;&nbsp;:</label>
         <div class="col-sm-1">
        <input TYPE=radio name="ChronicIlness" value="Evet" >  Evet <BR>        
      </div>
      <div class="col-sm-1">
        <input TYPE="text" class="form-control" name="ChronicIlnesstxt" value="<%=ChronicIlnesstxt%>" placeholder="Açıklama">      
      </div>
    </div>
      
	
	 <div class="form-group">
      <label class="control-label col-sm-5" for="UsedMedicine">Devamlı Kullanılan ilaç Var Mı? &nbsp;&nbsp;&nbsp;:</label>
         <div class="col-sm-1">
        <input TYPE=radio name="UsedMedicine" value="Evet" >  Evet <BR>        
      </div>
 
       <div class="col-sm-1">
        <input TYPE="text" class="form-control" name="UsedMedicinetxt" value="<%=UsedMedicinetxt %>" placeholder="Açıklama">      
      </div>
    </div>



<div class="form-group">
      <label class="control-label col-sm-5" for="CommunicableIllnesslbl">Bulaşıcı Herhangi Bir Hastalığınız Var M ı? &nbsp;&nbsp;&nbsp;:</label>
         <div class="col-sm-1">
        <input TYPE=radio name="CommunicableIllness" value="Evet" >  Evet <BR>        
      </div>
      
       <div class="col-sm-1">
        <input TYPE="text" class="form-control" name="CommunicableIllnesstxt" value="<%=CommunicableIllnesstxt%>" placeholder="Açıklama" >      
      </div>
    </div>

<div class="form-group">
      <label class="control-label col-sm-5" for="LossOfConsciousness  ">Arada Bilinç Kaybı Yaşanan Durumlar Oluyor Mu? &nbsp;&nbsp;&nbsp;:</label>
         <div class="col-sm-1">
        <input TYPE=radio name="LossOfConsciousness" value="Evet" >  Evet <BR>        
      </div>
      
       <div class="col-sm-1">
        <input TYPE="text" class="form-control" name="LossOfConsciousnesstxt" value="<%=LossOfConsciousnesstxt%>"  placeholder="Açıklama" >      
      </div>
    </div>

    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
      
        <button type="submit" class="btn btn-primary" >GÜNCELLE</button>
      </div>
						</div>


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
	conn.closeStatement(stmt2);	
	conn.closeResultSet(rs2);
	conn.closeConnection(con);

	
}
 
%>
</html>