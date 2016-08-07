<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.huia.service.dao.ad.AdDAOImp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>İşBurada</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.2.js"></script>
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.min.css" />
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"> </script>
<%
	AdDAOImp addao = new AdDAOImp();
	int companyid = addao.getCompanyId(session.getAttribute("companyname").toString());
	String companyname=session.getAttribute("companyname").toString();
	session.setAttribute("companyid",companyid);
%>
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

h3, h5 {
	font-weight: bold;
}
</style>
	<%
			
			String username=(String) session.getAttribute("username");
			
				
			if(username == null)
			{
				
				
				response.sendRedirect("/HaritaUzerindeIsArama/WelcomePage.jsp");
			}
	
%>


<script>
function Control(){
var Country= document.getElementById("sel1");

	if(Country[Country.selectedIndex].value=="Seçiniz"){
		
		alert("Ülke Seçin");
	}
}
</script>
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
</head>
<body onload="MyFunction()">
	<%
		
		session.setAttribute("username", username);
	%>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span>
					 <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/HaritaUzerindeIsArama/employerhome.jsp"> 
				<img alt="İşBurada" src="/HaritaUzerindeIsArama/images/logo.png" width="25" height="25">
				</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="/HaritaUzerindeIsArama/employerhome.jsp">İşBurada</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/HaritaUzerindeIsArama/addadvert.jsp">
					<span class="glyphicon glyphicon-pencil"></span> İlan Ver</a></li>
					<li><a href="/HaritaUzerindeIsArama/myadverts.jsp">
					<span class="glyphicon glyphicon-th-list"></span> İlanlarım</a></li>
					<li><a href="#"><span class="glyphicon glyphicon-list-alt">
					</span>Başvurular</a></li>
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
						<span class="glyphicon glyphicon-user"></span> <%=companyname%>
							<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/HaritaUzerindeIsArama/adddepartment.jsp">
							<span class="glyphicon glyphicon-plus"></span> Şube Ekle</a></li>
							<li><a href="FirmProfile.jsp">
							<span class="glyphicon glyphicon-user"></span> Profilim</a></li>
							<li><a href="/HaritaUzerindeIsArama/MyAccount.jsp">
							<span class="glyphicon glyphicon-cog"></span> Hesabım</a></li>
						</ul></li>
					<li><a href="/HaritaUzerindeIsArama/logout.jsp">
					<span class="glyphicon glyphicon-log-out"></span> Çıkış Yap</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<form class="form-horizontal" method="post" action="CompanyDetail" name="sform" id="sform">
			<div class="form-group">
				<label class="control-label col-sm-4" for="CompanyName">Firma Adı:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="companyname" name="companyname" placeholder="<%=companyname%>" readonly>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4" for="Website">Web Sitesi:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="Website" placeholder="örn:http://www.adresim.com">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4" for="CompanyHistory">Tarihcesi:</label>
				<div class="col-sm-5">
					<textarea cols="50" rows="5" class="form-control" name="CompanyHistory" placeholder="Tarihcesi"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4" for="Country">Ülke:</label>
				<div class="col-sm-5">
					<select class="form-control" name="sel1" id="sel1" onchange="changeval()">
						<script>
									for (var dd = 0; dd < aa.length; dd++) {
										document.write("<option value=\""+aa[dd]+"\">"+ aa[dd] + "</option>");
									}
						</script>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4" for="City">Şehir:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="City" placeholder="Şehir">
				</div>
				<div class="col-sm-5">
					<select class="form-control" name="sel2">
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4" for="Town">İlçe:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="Town" placeholder="İlçe">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4" for="District">Semt:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="District" placeholder="Semt">
				</div>
			</div>
			<!-- #messages is where the messages are placed inside -->
			<div class="form-group">
				<div class="col-md-9 col-md-offset-3">
					<div id="messages"></div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-9 col-md-offset-6">
					<button type="submit" class="btn btn-success" onclick="Control()">Kaydet</button>
				</div>
			</div>
		</form>
	</div>
<script>
$(document).ready(function() {
    $('#sform').bootstrapValidator({
        container: '#messages',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
       
            Website: {
                validators: {
                    notEmpty: {
                        message: 'Web Sitesi Adresinizi Giriniz.'
                    }
                    
                }
            },
            CompanyHistory: {
            	 notEmpty: {
                     message: 'Tarihçe Alanını Boş Bırakmayınız.'
                 },
            	 validators: {
                     stringLength: {
                         max: 500,
                         message: 'Tarihçe Alanı 500 Karakterden Az olmalıdır.'
                     }
                 }
            },
            Website: {
                validators: {
                    notEmpty: {
                        message: 'Web Sitesi Adresinizi Giriniz.'
                    },
                    stringLength: {
                        max: 100,
                        message: 'Web Sitesi Alanı 100 Karakteri Geçmemelidir.'
                    }
                }
            },
            City: {
                validators: {
                    notEmpty: {
                        message: 'Şehir Bilgisini Boş Bırakmayınız.'
                    },
             
                }
            },
            Town: {
                validators: {
                    notEmpty: {
                        message: 'İlçe Bilgisini Boş Bırakmayınz.'
                    },
             
                }
            },
            District: {
                validators: {
                    notEmpty: {
                        message: 'Semt Bilgisini Boş Bırakmayınız.'
                    },
             
                }
            },
         
        }
    });
});
</script>
</body>
</html>