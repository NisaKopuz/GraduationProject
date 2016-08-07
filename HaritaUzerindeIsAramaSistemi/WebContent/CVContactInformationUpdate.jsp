<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.huia.service.db.ConnectionHelper"%> 
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

<title>İşBurada.com</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1h11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
	var aa = new Array("Seçiniz","Türkiye", "Afghanistan", "Albania", "Algeria",
			"American Samoa", "Angola", "Anguilla", "Antartica",
			"Antigua and Barbuda", "Argentina", "Armenia", "Aruba",
			"Ashmore and Cartier Island", "Australia", "Austria", "Azerbaijan",
			"Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus",
			"Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia",
			"Bosnia and Herzegovina", "Botswana", "Brazil",
			"British Virgin Islands", "Brunei", "Bulgaria", "Burkina Faso",
			"Burma", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde",
			"Cayman Islands", "Central African Republic", "Chad", "Chile",
			"China", "Christmas Island", "Clipperton Island",
			"Cocos (Keeling) Islands", "Colombia", "Comoros",
			"Congo, Democratic Republic of the", "Congo, Republic of the",
			"Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia", "Cuba",
			"Cyprus", "Czeck Republic", "Denmark", "Djibouti", "Dominica",
			"Dominican Republic", "Ecuador", "Egypt", "El Salvador",
			"Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia",
			"Europa Island", "Falkland Islands (Islas Malvinas)",
			"Faroe Islands", "Fiji", "Finland", "France", "French Guiana",
			"French Polynesia", "French Southern and Antarctic Lands", "Gabon",
			"Gambia, The", "Gaza Strip", "Georgia", "Germany", "Ghana",
			"Gibraltar", "Glorioso Islands", "Greece", "Greenland", "Grenada",
			"Guadeloupe", "Guam", "Guatemala", "Guernsey", "Guinea",
			"Guinea-Bissau", "Guyana", "Haiti",
			"Heard Island and McDonald Islands", "Holy See (Vatican City)",
			"Honduras", "Hong Kong", "Howland Island", "Hungary", "Iceland",
			"India", "Indonesia", "Iran", "Iraq", "Ireland",
			"Ireland, Northern", "Israel", "Italy", "Jamaica", "Jan Mayen",
			"Japan", "Jarvis Island", "Jersey", "Johnston Atoll", "Jordan",
			"Juan de Nova Island", "Kazakhstan", "Kenya", "Kiribati",
			"Korea, North", "Korea, South", "Kuwait", "Kyrgyzstan", "Laos",
			"Latvia", "Lebanon", "Lesotho", "Liberia", "Libya",
			"Liechtenstein", "Lithuania", "Luxembourg", "Macau",
			"Macedonia, Former Yugoslav Republic of", "Madagascar", "Malawi",
			"Malaysia", "Maldives", "Mali", "Malta", "Man, Isle of",
			"Marshall Islands", "Martinique", "Mauritania", "Mauritius",
			"Mayotte", "Mexico", "Micronesia, Federated States of",
			"Midway Islands", "Moldova", "Monaco", "Mongolia", "Montserrat",
			"Morocco", "Mozambique", "Namibia", "Nauru", "Nepal",
			"Netherlands", "Netherlands Antilles", "New Caledonia",
			"New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue",
			"Norfolk Island", "Northern Mariana Islands", "Norway", "Oman",
			"Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay",
			"Peru", "Philippines", "Pitcaim Islands", "Poland", "Portugal",
			"Puerto Rico", "Qatar", "Reunion", "Romainia", "Russia", "Rwanda",
			"Saint Helena", "Saint Kitts and Nevis", "Saint Lucia",
			"Saint Pierre and Miquelon", "Saint Vincent and the Grenadines",
			"Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia",
			"Scotland", "Senegal", "Seychelles", "Sierra Leone", "Singapore",
			"Slovakia", "Slovenia", "Solomon Islands", "Somalia",
			"South Africa", "South Georgia and South Sandwich Islands",
			"Spain", "Spratly Islands", "Sri Lanka", "Sudan", "Suriname",
			"Svalbard", "Swaziland", "Sweden", "Switzerland", "Syria",
			"Taiwan", "Tajikistan", "Tanzania", "Thailand", "Tobago", "Toga",
			"Tokelau", "Tonga", "Trinidad", "Tunisia", "Turkmenistan",
			"Tuvalu", "Uganda", "Ukraine", "United Arab Emirates",
			"United Kingdom", "Uruguay", "USA", "Uzbekistan", "Vanuatu",
			"Venezuela", "Vietnam", "Virgin Islands", "Wales",
			"Wallis and Futuna", "West Bank", "Western Sahara", "Yemen",
			"Yugoslavia", "Zambia", "Zimbabwe");

	Türkiye = new Array("Adana", "Adiyaman", "Afyon", "Agri", "Aksaray",
			"Amasya", "Ankara", "Antalya", "Ardahan", "Artvin", "Aydin",
			"Balikesir", "Bartin", "Batman", "Bayburt", "Bilecik", "Bingol",
			"Bitlis", "Bolu", "Burdur", "Bursa", "Canakkale", "Cankiri",
			"Corum", "Denizli", "Diyarbakir", "Duzce", "Edirne", "Elazig",
			"Erzincan", "Erzurum", "Eskisehir", "Gaziantep", "Giresun",
			"Gumushane", "Hakkari", "Hatay", "Igdir", "Isparta", "Istanbul",
			"Izmir", "Kahramanmaras", "Karabuk", "Karaman", "Kars",
			"Kastamonu", "Kayseri", "Kilis", "Kirikkale", "Kirklareli",
			"Kirsehir", "Kocaeli", "Konya", "Kutahya", "Malatya", "Manisa",
			"Mardin", "Mugla", "Mus", "Nevsehir", "Nigde", "Ordu", "Osmaniye",
			"Rize", "Sakarya", "Samsun", "Sanliurfa", "Siirt", "Sinop",
			"Sirnak", "Sivas", "Tekirdag", "Tokat", "Trabzon", "Tunceli",
			"Usak", "Van", "Yalova", "Yozgat", "Zonguldak");

	function changeval() {
		var val1 = document.sform.sel1.value;

		if (val1 != "Türkiye") {
			document.sform.elements['sel2'].style.display = 'none';
			document.sform.elements['City'].style.display = 'block';
		}
		if (val1 == "Türkiye") {
			document.sform.elements['sel2'].style.display = 'block';
			document.sform.elements['City'].style.display = 'none';
			var optionArray = eval(val1);
			for (var df = 0; df < optionArray.length; df++) {
				var ss = document.sform.sel2;
				ss.options.length = 0;
				for (var ff = 0; ff < optionArray.length; ff++) {
					var val = optionArray[ff];
					ss.options[ff] = new Option(val, val);
				}
			}
		}

	}
</script>
<script>
	function MyFunction() {

		document.sform.elements['sel2'].style.display = 'none';
		document.sform.elements['City'].style.display = 'block';
	}
</script>
<script>
function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : evt.keyCode
    return !(charCode > 31 && (charCode < 48 || charCode > 57));
}
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
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#img_prev').attr('src', e.target.result).width(100).height(
						100);
			};
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
<%
ConnectionHelper conn= new ConnectionHelper();
Connection con = conn.getConnection();
PreparedStatement stmt = null;
ResultSet rs = null;
PreparedStatement stmt1 = null;
ResultSet rs1 = null;

String userName=request.getRemoteUser();
String Name = "";
String Surname = "";
String Email = "";

String Title= "";
String Country = "";
String City = "";
String Town = "";
String District = "";
String CellPhoneNumber = "";
String HomePhoneNumber="";
String webPage="";
String webPage2="";


 String query =  "SELECT * FROM tblUserRegistration WHERE UserName=?";
 String query1 = "SELECT * FROM tblContactInformation WHERE UserName=?";

 stmt = conn.getStatement(con, query);
 stmt1 = conn.getStatement(con, query1);

 try {
	 	stmt.setString(1,userName);
	 	rs = stmt.executeQuery();
	 	
	 	stmt1.setString(1,userName);
	 	rs1 = stmt1.executeQuery();

		while (rs.next()) {
			Name = rs.getString("Name");
			Surname = rs.getString("Surname");
			Email = rs.getString("Email");
		} 
		while (rs1.next()) {
			Title = rs1.getString("Title");
			Country = rs1.getString("Country");
			City = rs1.getString("City");
			Town = rs1.getString("Town");
			District = rs1.getString("District");
			CellPhoneNumber = rs1.getString("CellPhoneNumber");
			HomePhoneNumber =rs1.getString("HomePhoneNumber");
			webPage=rs1.getString("webPage");
			webPage2=rs1.getString("WepPage2");
		} 
		String CellPhoneNumberCode ="";
		String CellPhoneNumberRest="";
		String HomePhoneNumberCode="";
		String HomePhoneNumberRest="";
		
		if(!("".equals(CellPhoneNumber)) && !("".equals(HomePhoneNumber))){
			CellPhoneNumberCode=CellPhoneNumber.substring(0, 3);
			CellPhoneNumberRest=CellPhoneNumber.substring(3,10);
			HomePhoneNumberCode=HomePhoneNumber.substring(0,2);
			HomePhoneNumberRest=HomePhoneNumber.substring(2,12);
		}
		
	%>

</head>
<body onload="MyFunction()">
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
	<form class="form-horizontal" data-toggle="validator" name="sform" method="POST" action="CVContactInformationUpdateServlet" data-fv-framework="bootstrap"
		data-fv-framework="bootstrap"
		data-fv-icon-valid="glyphicon glyphicon-ok"
		data-fv-icon-invalid="glyphicon glyphicon-remove"
		data-fv-icon-validating="glyphicon glyphicon-refresh">
		<div class="container">
		<p><br><br></p>
			<ul class="nav nav-pills  col-md-offset-2   ">
				<li class="active" ><a data-toggle="pill" href="CVContactInformationUpdate.jsp">İletişim Bilgileri</a></li>
				<li><a data-toggle="pill" href="CVPersonalInformationUpdate.jsp">Kişisel Bilgiler</a></li>
				<li><a data-toggle="pill" href="CVEducationalInfoUpdate2.jsp">Eğitim Bilgileri</a></li>
				<li><a data-toggle="pill" href="CVBusinessInfoUpdate2.jsp">İş Deneyimi</a></li>
				<li><a data-toggle="pill" href="CVForeignLanguageInfoUpdate2.jsp">Yabancı Dil</a></li>
				<li ><a data-toggle="pill" href="CVReferenceInfoUpdate2.jsp">Referans Bilgileri</a></li>
				<li><a data-toggle="pill" href="CVAdditionalInfoUpdate.jsp">Ek Bilgiler</a></li>
			</ul>

			<div class="tab-content text-center">
				<div id="home" class="tab-pane fade in active">
					<br>
					<div class="container center ">


						<div class="form-group">
							<label class="control-label col-sm-5" for="Name">Adım*&nbsp;&nbsp;&nbsp;:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="Name" value="<%=Name%>" required placeholder="" >
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-5" for="Surname">Soyadım *&nbsp;&nbsp;&nbsp;:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="Surname" value="<%=Surname%>" required placeholder="" >
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-5" for="Title">Ünvanım*&nbsp;&nbsp;&nbsp;:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="Title" value="<%=Title %>" required placeholder="">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-5" for="Country">Ülke*&nbsp;&nbsp;&nbsp;:</label>
							<div class="col-sm-7">
								<select class="form-control" name="sel1" onchange="changeval()" required >
								<option value="<%=Country%>"><%=Country%></option>
								<option value="">-------------------</option>
								<script>
							
									for (var dd = 0; dd < aa.length; dd++) {
										document.write("<option value=\""+aa[dd]+"\">"+ aa[dd] + "</option>");
									}
								</script></select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-5" for="City">Şehir *&nbsp;&nbsp;&nbsp;:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="City" value="<%=City%>" required placeholder="">
							</div>
					
						</div>

						<div class="form-group">
							<label class="control-label col-sm-5" for="Town">İlçe*&nbsp;&nbsp;&nbsp;:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="Town" value="<%=Town %>" required placeholder="">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-5" for="District">Semt*&nbsp;&nbsp;&nbsp;:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="District" value="<%=District %>" required placeholder="">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-5" for="HomePhoneNumber">Ev Telefonu &nbsp;&nbsp;&nbsp;:</label>
							<div class=" control-label col-sm-2 col-sm-offset-0 ">
								<select class="form-control" name="HomePhoneCodes">
								<option data-countryCode="TR" value="<%=HomePhoneNumberCode%>">+<%=(HomePhoneNumberCode)%></option>
									<option>--------------</option>
									<option data-countryCode="TR" value="90">Türkiye (+90)</option>
									<option data-countryCode="DZ" value="213">Algeria
										(+213)</option>
									<option data-countryCode="AD" value="376">Andorra
										(+376)</option>
									<option data-countryCode="AO" value="244">Angola
										(+244)</option>
									<option data-countryCode="AI" value="1264">Anguilla
										(+1264)</option>
									<option data-countryCode="AG" value="1268">Antigua
										&amp; Barbuda (+1268)</option>
									<option data-countryCode="AR" value="54">Argentina
										(+54)</option>
									<option data-countryCode="AM" value="374">Armenia
										(+374)</option>
									<option data-countryCode="AW" value="297">Aruba (+297)</option>
									<option data-countryCode="AU" value="61">Australia
										(+61)</option>
									<option data-countryCode="AT" value="43">Austria (+43)</option>
									<option data-countryCode="AZ" value="994">Azerbaijan
										(+994)</option>
									<option data-countryCode="BS" value="1242">Bahamas
										(+1242)</option>
									<option data-countryCode="BH" value="973">Bahrain
										(+973)</option>
									<option data-countryCode="BD" value="880">Bangladesh
										(+880)</option>
									<option data-countryCode="BB" value="1246">Barbados
										(+1246)</option>
									<option data-countryCode="BY" value="375">Belarus
										(+375)</option>
									<option data-countryCode="BE" value="32">Belgium (+32)</option>
									<option data-countryCode="BZ" value="501">Belize
										(+501)</option>
									<option data-countryCode="BJ" value="229">Benin (+229)</option>
									<option data-countryCode="BM" value="1441">Bermuda
										(+1441)</option>
									<option data-countryCode="BT" value="975">Bhutan
										(+975)</option>
									<option data-countryCode="BO" value="591">Bolivia
										(+591)</option>
									<option data-countryCode="BA" value="387">Bosnia
										Herzegovina (+387)</option>
									<option data-countryCode="BW" value="267">Botswana
										(+267)</option>
									<option data-countryCode="BR" value="55">Brazil (+55)</option>
									<option data-countryCode="BN" value="673">Brunei
										(+673)</option>
									<option data-countryCode="BG" value="359">Bulgaria
										(+359)</option>
									<option data-countryCode="BF" value="226">Burkina Faso
										(+226)</option>
									<option data-countryCode="BI" value="257">Burundi
										(+257)</option>
									<option data-countryCode="KH" value="855">Cambodia
										(+855)</option>
									<option data-countryCode="CM" value="237">Cameroon
										(+237)</option>
									<option data-countryCode="CA" value="1">Canada (+1)</option>
									<option data-countryCode="CV" value="238">Cape Verde
										Islands (+238)</option>
									<option data-countryCode="KY" value="1345">Cayman
										Islands (+1345)</option>
									<option data-countryCode="CF" value="236">Central
										African Republic (+236)</option>
									<option data-countryCode="CL" value="56">Chile (+56)</option>
									<option data-countryCode="CN" value="86">China (+86)</option>
									<option data-countryCode="CO" value="57">Colombia
										(+57)</option>
									<option data-countryCode="KM" value="269">Comoros
										(+269)</option>
									<option data-countryCode="CG" value="242">Congo (+242)</option>
									<option data-countryCode="CK" value="682">Cook Islands
										(+682)</option>
									<option data-countryCode="CR" value="506">Costa Rica
										(+506)</option>
									<option data-countryCode="HR" value="385">Croatia
										(+385)</option>
									<option data-countryCode="CU" value="53">Cuba (+53)</option>
									<option data-countryCode="CY" value="90392">Cyprus
										North (+90392)</option>
									<option data-countryCode="CY" value="357">Cyprus South
										(+357)</option>
									<option data-countryCode="CZ" value="42">Czech
										Republic (+42)</option>
									<option data-countryCode="DK" value="45">Denmark (+45)</option>
									<option data-countryCode="DJ" value="253">Djibouti
										(+253)</option>
									<option data-countryCode="DM" value="1809">Dominica
										(+1809)</option>
									<option data-countryCode="DO" value="1809">Dominican
										Republic (+1809)</option>
									<option data-countryCode="EC" value="593">Ecuador
										(+593)</option>
									<option data-countryCode="EG" value="20">Egypt (+20)</option>
									<option data-countryCode="SV" value="503">El Salvador
										(+503)</option>
									<option data-countryCode="GQ" value="240">Equatorial
										Guinea (+240)</option>
									<option data-countryCode="ER" value="291">Eritrea
										(+291)</option>
									<option data-countryCode="EE" value="372">Estonia
										(+372)</option>
									<option data-countryCode="ET" value="251">Ethiopia
										(+251)</option>
									<option data-countryCode="FK" value="500">Falkland
										Islands (+500)</option>
									<option data-countryCode="FO" value="298">Faroe
										Islands (+298)</option>
									<option data-countryCode="FJ" value="679">Fiji (+679)</option>
									<option data-countryCode="FI" value="358">Finland
										(+358)</option>
									<option data-countryCode="FR" value="33">France (+33)</option>
									<option data-countryCode="GF" value="594">French
										Guiana (+594)</option>
									<option data-countryCode="PF" value="689">French
										Polynesia (+689)</option>
									<option data-countryCode="GA" value="241">Gabon (+241)</option>
									<option data-countryCode="GM" value="220">Gambia
										(+220)</option>
									<option data-countryCode="GE" value="7880">Georgia
										(+7880)</option>
									<option data-countryCode="DE" value="49">Germany (+49)</option>
									<option data-countryCode="GH" value="233">Ghana (+233)</option>
									<option data-countryCode="GI" value="350">Gibraltar
										(+350)</option>
									<option data-countryCode="GR" value="30">Greece (+30)</option>
									<option data-countryCode="GL" value="299">Greenland
										(+299)</option>
									<option data-countryCode="GD" value="1473">Grenada
										(+1473)</option>
									<option data-countryCode="GP" value="590">Guadeloupe
										(+590)</option>
									<option data-countryCode="GU" value="671">Guam (+671)</option>
									<option data-countryCode="GT" value="502">Guatemala
										(+502)</option>
									<option data-countryCode="GN" value="224">Guinea
										(+224)</option>
									<option data-countryCode="GW" value="245">Guinea -
										Bissau (+245)</option>
									<option data-countryCode="GY" value="592">Guyana
										(+592)</option>
									<option data-countryCode="HT" value="509">Haiti (+509)</option>
									<option data-countryCode="HN" value="504">Honduras
										(+504)</option>
									<option data-countryCode="HK" value="852">Hong Kong
										(+852)</option>
									<option data-countryCode="HU" value="36">Hungary (+36)</option>
									<option data-countryCode="IS" value="354">Iceland
										(+354)</option>
									<option data-countryCode="IN" value="91">India (+91)</option>
									<option data-countryCode="ID" value="62">Indonesia
										(+62)</option>
									<option data-countryCode="IR" value="98">Iran (+98)</option>
									<option data-countryCode="IQ" value="964">Iraq (+964)</option>
									<option data-countryCode="IE" value="353">Ireland
										(+353)</option>
									<option data-countryCode="IL" value="972">Israel
										(+972)</option>
									<option data-countryCode="IT" value="39">Italy (+39)</option>
									<option data-countryCode="JM" value="1876">Jamaica
										(+1876)</option>
									<option data-countryCode="JP" value="81">Japan (+81)</option>
									<option data-countryCode="JO" value="962">Jordan
										(+962)</option>
									<option data-countryCode="KZ" value="7">Kazakhstan
										(+7)</option>
									<option data-countryCode="KE" value="254">Kenya (+254)</option>
									<option data-countryCode="KI" value="686">Kiribati
										(+686)</option>
									<option data-countryCode="KP" value="850">Korea North
										(+850)</option>
									<option data-countryCode="KR" value="82">Korea South
										(+82)</option>
									<option data-countryCode="KW" value="965">Kuwait
										(+965)</option>
									<option data-countryCode="KG" value="996">Kyrgyzstan
										(+996)</option>
									<option data-countryCode="LA" value="856">Laos (+856)</option>
									<option data-countryCode="LV" value="371">Latvia
										(+371)</option>
									<option data-countryCode="LB" value="961">Lebanon
										(+961)</option>
									<option data-countryCode="LS" value="266">Lesotho
										(+266)</option>
									<option data-countryCode="LR" value="231">Liberia
										(+231)</option>
									<option data-countryCode="LY" value="218">Libya (+218)</option>
									<option data-countryCode="LI" value="417">Liechtenstein
										(+417)</option>
									<option data-countryCode="LT" value="370">Lithuania
										(+370)</option>
									<option data-countryCode="LU" value="352">Luxembourg
										(+352)</option>
									<option data-countryCode="MO" value="853">Macao (+853)</option>
									<option data-countryCode="MK" value="389">Macedonia
										(+389)</option>
									<option data-countryCode="MG" value="261">Madagascar
										(+261)</option>
									<option data-countryCode="MW" value="265">Malawi
										(+265)</option>
									<option data-countryCode="MY" value="60">Malaysia
										(+60)</option>
									<option data-countryCode="MV" value="960">Maldives
										(+960)</option>
									<option data-countryCode="ML" value="223">Mali (+223)</option>
									<option data-countryCode="MT" value="356">Malta (+356)</option>
									<option data-countryCode="MH" value="692">Marshall
										Islands (+692)</option>
									<option data-countryCode="MQ" value="596">Martinique
										(+596)</option>
									<option data-countryCode="MR" value="222">Mauritania
										(+222)</option>
									<option data-countryCode="YT" value="269">Mayotte
										(+269)</option>
									<option data-countryCode="MX" value="52">Mexico (+52)</option>
									<option data-countryCode="FM" value="691">Micronesia
										(+691)</option>
									<option data-countryCode="MD" value="373">Moldova
										(+373)</option>
									<option data-countryCode="MC" value="377">Monaco
										(+377)</option>
									<option data-countryCode="MN" value="976">Mongolia
										(+976)</option>
									<option data-countryCode="MS" value="1664">Montserrat
										(+1664)</option>
									<option data-countryCode="MA" value="212">Morocco
										(+212)</option>
									<option data-countryCode="MZ" value="258">Mozambique
										(+258)</option>
									<option data-countryCode="MN" value="95">Myanmar (+95)</option>
									<option data-countryCode="NA" value="264">Namibia
										(+264)</option>
									<option data-countryCode="NR" value="674">Nauru (+674)</option>
									<option data-countryCode="NP" value="977">Nepal (+977)</option>
									<option data-countryCode="NL" value="31">Netherlands
										(+31)</option>
									<option data-countryCode="NC" value="687">New
										Caledonia (+687)</option>
									<option data-countryCode="NZ" value="64">New Zealand
										(+64)</option>
									<option data-countryCode="NI" value="505">Nicaragua
										(+505)</option>
									<option data-countryCode="NE" value="227">Niger (+227)</option>
									<option data-countryCode="NG" value="234">Nigeria
										(+234)</option>
									<option data-countryCode="NU" value="683">Niue (+683)</option>
									<option data-countryCode="NF" value="672">Norfolk
										Islands (+672)</option>
									<option data-countryCode="NP" value="670">Northern
										Marianas (+670)</option>
									<option data-countryCode="NO" value="47">Norway (+47)</option>
									<option data-countryCode="OM" value="968">Oman (+968)</option>
									<option data-countryCode="PW" value="680">Palau (+680)</option>
									<option data-countryCode="PA" value="507">Panama
										(+507)</option>
									<option data-countryCode="PG" value="675">Papua New
										Guinea (+675)</option>
									<option data-countryCode="PY" value="595">Paraguay
										(+595)</option>
									<option data-countryCode="PE" value="51">Peru (+51)</option>
									<option data-countryCode="PH" value="63">Philippines
										(+63)</option>
									<option data-countryCode="PL" value="48">Poland (+48)</option>
									<option data-countryCode="PT" value="351">Portugal
										(+351)</option>
									<option data-countryCode="PR" value="1787">Puerto Rico
										(+1787)</option>
									<option data-countryCode="QA" value="974">Qatar (+974)</option>
									<option data-countryCode="RE" value="262">Reunion
										(+262)</option>
									<option data-countryCode="RO" value="40">Romania (+40)</option>
									<option data-countryCode="RU" value="7">Russia (+7)</option>
									<option data-countryCode="RW" value="250">Rwanda
										(+250)</option>
									<option data-countryCode="SM" value="378">San Marino
										(+378)</option>
									<option data-countryCode="ST" value="239">Sao Tome
										&amp; Principe (+239)</option>
									<option data-countryCode="SA" value="966">Saudi Arabia
										(+966)</option>
									<option data-countryCode="SN" value="221">Senegal
										(+221)</option>
									<option data-countryCode="CS" value="381">Serbia
										(+381)</option>
									<option data-countryCode="SC" value="248">Seychelles
										(+248)</option>
									<option data-countryCode="SL" value="232">Sierra Leone
										(+232)</option>
									<option data-countryCode="SG" value="65">Singapore
										(+65)</option>
									<option data-countryCode="SK" value="421">Slovak
										Republic (+421)</option>
									<option data-countryCode="SI" value="386">Slovenia
										(+386)</option>
									<option data-countryCode="SB" value="677">Solomon
										Islands (+677)</option>
									<option data-countryCode="SO" value="252">Somalia
										(+252)</option>
									<option data-countryCode="ZA" value="27">South Africa
										(+27)</option>
									<option data-countryCode="ES" value="34">Spain (+34)</option>
									<option data-countryCode="LK" value="94">Sri Lanka
										(+94)</option>
									<option data-countryCode="SH" value="290">St. Helena
										(+290)</option>
									<option data-countryCode="KN" value="1869">St. Kitts
										(+1869)</option>
									<option data-countryCode="SC" value="1758">St. Lucia
										(+1758)</option>
									<option data-countryCode="SD" value="249">Sudan (+249)</option>
									<option data-countryCode="SR" value="597">Suriname
										(+597)</option>
									<option data-countryCode="SZ" value="268">Swaziland
										(+268)</option>
									<option data-countryCode="SE" value="46">Sweden (+46)</option>
									<option data-countryCode="CH" value="41">Switzerland
										(+41)</option>
									<option data-countryCode="SI" value="963">Syria (+963)</option>
									<option data-countryCode="TW" value="886">Taiwan
										(+886)</option>
									<option data-countryCode="TJ" value="7">Tajikstan (+7)</option>
									<option data-countryCode="TH" value="66">Thailand
										(+66)</option>
									<option data-countryCode="TG" value="228">Togo (+228)</option>
									<option data-countryCode="TO" value="676">Tonga (+676)</option>
									<option data-countryCode="TT" value="1868">Trinidad
										&amp; Tobago (+1868)</option>
									<option data-countryCode="TN" value="216">Tunisia
										(+216)</option>
									<option data-countryCode="TM" value="7">Turkmenistan
										(+7)</option>
									<option data-countryCode="TM" value="993">Turkmenistan
										(+993)</option>
									<option data-countryCode="TC" value="1649">Turks &amp;
										Caicos Islands (+1649)</option>
									<option data-countryCode="TV" value="688">Tuvalu
										(+688)</option>
									<option data-countryCode="UG" value="256">Uganda
										(+256)</option>
									<!-- <option data-countryCode="GB" value="44">UK (+44)</option> -->
									<option data-countryCode="UA" value="380">Ukraine
										(+380)</option>
									<option data-countryCode="AE" value="971">United Arab
										Emirates (+971)</option>
									<option data-countryCode="UY" value="598">Uruguay
										(+598)</option>
									<!-- <option data-countryCode="US" value="1">USA (+1)</option> -->
									<option data-countryCode="UZ" value="7">Uzbekistan
										(+7)</option>
									<option data-countryCode="VU" value="678">Vanuatu
										(+678)</option>
									<option data-countryCode="VA" value="379">Vatican City
										(+379)</option>
									<option data-countryCode="VE" value="58">Venezuela
										(+58)</option>
									<option data-countryCode="VN" value="84">Vietnam (+84)</option>
									<option data-countryCode="VG" value="84">Virgin
										Islands - British (+1284)</option>
									<option data-countryCode="VI" value="84">Virgin
										Islands - US (+1340)</option>
									<option data-countryCode="WF" value="681">Wallis &amp;
										Futuna (+681)</option>
									<option data-countryCode="YE" value="969">Yemen
										(North)(+969)</option>
									<option data-countryCode="YE" value="967">Yemen
										(South)(+967)</option>
									<option data-countryCode="ZM" value="260">Zambia
										(+260)</option>
									<option data-countryCode="ZW" value="263">Zimbabwe
										(+263)</option>
								</select>
							</div>

							<div class="col-sm-2 control-label col-sm-offset-0 ">
								<input type="text" class="form-control" name="HomePhoneNumber" value="<%=HomePhoneNumberRest %>" maxlength="10" onkeypress="return isNumberKey(event);">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-5" for="CellPhoneNumber">Cep
								Telefonu *&nbsp;&nbsp;&nbsp;:</label>
							<div class=" control-label col-sm-2 col-sm-offset-0 ">
								<select class="form-control" name="CellPhoneCodes">
								<option value="<%=CellPhoneNumberCode%>">(+90)<%=CellPhoneNumberCode %></option>
								<option>-------------</option>
									<option value="530">(+90)530</option>
									<option value="531">(+90)531</option>
									<option value="532">(+90)532</option>
									<option value="533">(+90)533</option>
									<option value="534">(+90)534</option>
									<option value="535">(+90)535</option>
									<option value="536">(+90)536</option>
									<option value="537">(+90)537</option>
									<option value="538">(+90)538</option>
									<option value="539">(+90)539</option>
									<option value="540">(+90)540</option>
									<option value="541">(+90)541</option>
									<option value="542">(+90)542</option>
									<option value="543">(+90)543</option>
									<option value="544">(+90)544</option>
									<option value="545">(+90)545</option>
									<option value="546">(+90)546</option>
									<option value="547">(+90)547</option>
									<option value="548">(+90)548</option>
									<option value="549">(+90)549</option>
									<option value="500">(+90)500</option>
									<option value="501">(+90)501</option>
									<option value="502">(+90)502</option>
									<option value="503">(+90)503</option>
									<option value="504">(+90)504</option>
									<option value="505">(+90)505</option>
									<option value="506">(+90)506</option>
									<option value="507">(+90)507</option>
									<option value="508">(+90)508</option>
									<option value="509">(+90)509</option>
									<option value="550">(+90)550</option>
									<option value="551">(+90)551</option>
									<option value="552">(+90)552</option>
									<option value="553">(+90)553</option>
									<option value="554">(+90)554</option>
									<option value="555">(+90)555</option>
									<option value="556">(+90)556</option>
									<option value="557">(+90)557</option>
									<option value="557">(+90)557</option>
									<option value="557">(+90)557</option>

									<option value="592">(+90)592</option>
									<option value="594">(+90)594</option>
									<option value="596">(+90)596</option>
									<option value="900">(+90)900</option>
									<option value="800">(+90)800</option>
									<option value="850">(+90)850</option>
									<option value="822">(+90)822</option>
									<option value="515">(+90)515</option>



								</select>
							</div>

							<div class="col-sm-2 control-label col-sm-offset-0 ">
								<input type="text" class="form-control" name="CellPhoneNumber" value="<%=CellPhoneNumberRest %>" maxlength="7" onkeypress="return isNumberKey(event);">
							</div>
						</div>
						
      
  

						<div class="form-group">
							<label class="control-label col-sm-7" for="Eposta">E-Posta Adresim *&nbsp;&nbsp;&nbsp;:</label>
							<div class="control-label col-sm-2 col-sm-offset-0 ">
								<input type="email" class="form-control" name="Eposta"  value="<%=Email%>" required placeholder="" >
							</div>
							</div>

<div class="form-group">
      <label class="control-label col-sm-5" for="WebPage">Web Sayfam &nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">
        <input type="text" class="form-control" name="WebPage" placeholder="http://www.adresim.com" value="<%=webPage%>" >
      </div>
    </div>
  
							<div class="form-group">
							<label class="control-label col-sm-5" for="WebPage2">Web Sayfam(2) &nbsp;&nbsp;&nbsp;:</label>
							<div class="control-label col-sm-2 col-sm-offset-0 ">
								<input type="text" class="form-control" name="WebPage2" placeholder="http://www.adresim.com"  value="<%=webPage2%>">
							</div>
							</div>
							
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-8">

								<button type="submit" class="btn btn-primary">GÜNCELLE</button>

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
	conn.closeStatement(stmt);
	conn.closeResultSet(rs);

	conn.closeStatement(stmt1);
	conn.closeResultSet(rs1);
	conn.closeConnection(con);

	
}
 
%>
</html>