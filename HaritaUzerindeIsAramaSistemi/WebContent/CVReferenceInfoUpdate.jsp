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
String idReference2=request.getParameter("idReference");
if("".equals(idReference2)){
	response.sendRedirect("CVReferenceInfoUpdate2.jsp");
}
ConnectionHelper conn= new ConnectionHelper();
Connection con = conn.getConnection();
PreparedStatement stmt7 = null;
ResultSet rs7 = null;
String userName=request.getRemoteUser();
String ReferenceType="";
String referenceName = "";
String referenceSurname = "";
String ReferansFirmPosition="";
String referenceEmail = "";
String ReferencePhone="";
String referenceFirmName = "";
String referenceFirmSector = "";
  


 String query7 = "SELECT * FROM tblReferenceInformation WHERE idReference=? ";
 stmt7 = conn.getStatement(con, query7);

 try {
	 	
	 	stmt7.setString(1,idReference2);
	 	rs7 = stmt7.executeQuery();
	 	
	       while (rs7.next()) {
	 		  ReferenceType=rs7.getString("ReferenceType");
	 			 referenceName = rs7.getString("ReferenceName");
	 			 referenceSurname =rs7.getString("ReferenceSurname");
	 			 ReferansFirmPosition=rs7.getString("ReferansFirmPosition");
	 			 referenceEmail = rs7.getString("ReferenceEmail");
	 			 ReferencePhone=rs7.getString("ReferencePhone");
	 			 referenceFirmName = rs7.getString("ReferenceFirmName");
	 			 referenceFirmSector = rs7.getString("ReferenceFirmSector");
	 			 
	 	  }
	       String ReferencePhoneCode ="";
	       String ReferencePhoneRest ="";
	       if(!("".equals(ReferencePhone))){
	       ReferencePhoneCode=ReferencePhone.substring(0, 3);
	       ReferencePhoneRest=ReferencePhone.substring(3,10);
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
<script>
function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : evt.keyCode
    return !(charCode > 31 && (charCode < 48 || charCode > 57));
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
<script >
function changeval(){
var referansSecim = document.sform.ReferenceType.value;
var sektörSecim = document.sform.ReferenceFirmSector.value;
if(referansSecim == null || referansSecim == "" || referansSecim == "0")
	alert("Lütfen Referans Tipini Seçiniz");
if(sektörSecim == null || sektörSecim == "" || sektörSecim == "0")
	alert("Lütfen Sektör Bilgisini Seçiniz");
}
</script>
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
		method="POST" action="CVReferenceInfoUpdateServlet" data-fv-framework="bootstrap"
		data-fv-framework="bootstrap"
		data-fv-icon-valid="glyphicon glyphicon-ok"
		data-fv-icon-invalid="glyphicon glyphicon-remove"
		data-fv-icon-validating="glyphicon glyphicon-refresh">
		<div class="container">
		<p><br><br></p>
			<ul class="nav nav-pills  col-md-offset-2   ">
				<li ><a data-toggle="pill" href="CVContactInformationUpdate.jsp">İletişim Bilgileri</a></li>
				<li><a data-toggle="pill" href="CVPersonalInformationUpdate.jsp">Kişisel Bilgiler</a></li>
				<li><a data-toggle="pill" href="CVEducationalInfoUpdate2.jsp">Eğitim Bilgileri</a></li>
				<li><a data-toggle="pill" href="CVBusinessInfoUpdate2.jsp">İş Deneyimi</a></li>
				<li><a data-toggle="pill" href="CVForeignLanguageInfoUpdate2.jsp">Yabancı Dil</a></li>
				<li class="active"><a data-toggle="pill" href="CVReferenceInfoUpdate2.jsp">Referans Bilgileri</a></li>
				<li><a data-toggle="pill" href="CVAdditionalInfoUpdate.jsp">Ek Bilgiler</a></li>
			</ul>
			<div class="tab-content text-center">
				<div id="home" class="tab-pane fade in active">
					<br>
					<div class="container center ">

						
					<div class="form-group">
							<label class="control-label col-sm-5" for="ReferenceType">Referans Tipi * &nbsp;&nbsp;&nbsp;:</label>
							<div class="col-sm-7">
								<select class="form-control" name="ReferenceType" required>
								
									<option value="<%=ReferenceType%>"><%=ReferenceType%></option>
									<option value="">-------------</option>
									<option value="İş Hayatıyla İlgili Referans(yönetici)">İş Hayatıyla İlgili Referans(Yöneticilerinizden)</option>
									<option value="İş Hayatıyla İlgili Referans(işarkadaşı)">İş Hayatıyla İlgili Referans(İş Arkadaşlarınızdan)</option>
									<option value="İş Hayatıyla İlgili Referans(sizin çalışanınız)">İş Hayatıyla İlgili Referans(Size Bağlı Çalışanlarınızdan)</option>
									<option value="Akademik Referans">Akademik Referans</option>
									<option value="Aile Bireylerinden">Aile Bireylerinden Referans</option>
									<option value="Kamu Çalışanlarından Referans">Kamu Çalışanlarından Referans</option>
									<option value="Sosyal Faliyetleriniz İle İlgili Referans">Sosyal Faliyetleriniz İle İlgili Referans</option>

								</select>
							</div>
						</div>
					
					<div class="form-group">
							<label class="control-label col-sm-5" for="ReferenceName">Referans Adı * &nbsp;&nbsp;&nbsp;:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="ReferenceName" value="<%=referenceName%>" required placeholder="">
								
							</div>
						</div>
					
					<div class="form-group">
							<label class="control-label col-sm-5" for="ReferenceSurname">Referans Soyadı * &nbsp;&nbsp;&nbsp;:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="ReferenceSurname" value="<%=referenceSurname%>" required placeholder="">
								
							</div>
						</div>
					
					<div class="form-group">
							<label class="control-label col-sm-5" for="ReferansFirmPosition">Firmadaki Pozisyon * &nbsp;&nbsp;&nbsp;:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="ReferansFirmPosition" value="<%=ReferansFirmPosition%>" required placeholder="">
								
							</div>
						</div>
					
					<div class="form-group">
							<label class="control-label col-sm-5" for="ReferenceEmail">Referans Email &nbsp;&nbsp;&nbsp;:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" value="<%=referenceEmail%>" name="ReferenceEmail">
								
							</div>
						</div>
						
					<div class="form-group">
							<label class="control-label col-sm-5" for="ReferencePhone">Referans Telefon Numarası*&nbsp;&nbsp;&nbsp;:</label>
							<div class=" control-label col-sm-2 col-sm-offset-0 ">
								<select class="form-control" name="ReferencePhoneCode" required>
								<option value="<%=ReferencePhoneCode%>">(+90)<%=ReferencePhoneCode%></option>
								<option value="">----------------</option>
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
								<input type="text" class="form-control" name="ReferencePhone"
									placeholder="XXXXXXX" maxlength="7" value="<%=ReferencePhoneRest%>" onkeypress="return isNumberKey(event);">
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-5" for="ReferenceFirmName">Çalıştığı Firma Adı &nbsp;&nbsp;&nbsp;:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" value="<%=referenceFirmName%>" name="ReferenceFirmName">
								
							</div>
						</div>
					
					
					<div class="form-group">
							<label class="control-label col-sm-5" for="ReferenceFirmSector">Çalıştığı Firma Sektörü &nbsp;&nbsp;&nbsp;:</label>
							<div class="col-sm-7">
								<select class="form-control" name="ReferenceFirmSector" required>
								<option value="<%=referenceFirmSector%>"><%=referenceFirmSector%></option>
									<option value="">-----------</option>
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



									<option value="Elektrik & Elektronik">Elektrik & Elektronik</option>


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
							<div class="col-sm-offset-2 col-sm-8">

								<button type="submit" class="btn btn-primary" onclick="changeval()">GÜNCELLE</button>

							</div>
						</div>

<input type="hidden" value=<%=request.getParameter("idReference") %> name="idReference">
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
	conn.closeStatement(stmt7);	
	conn.closeResultSet(rs7);
	conn.closeConnection(con);

}
 
%>
</html>