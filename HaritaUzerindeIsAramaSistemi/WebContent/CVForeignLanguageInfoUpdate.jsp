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
<%
String idLanguage2=request.getParameter("idLanguage");
if("".equals(idLanguage2)){
	response.sendRedirect("CVForeignLanguageInfoUpdate2.jsp");
}
ConnectionHelper conn= new ConnectionHelper();
Connection con = conn.getConnection();
PreparedStatement stmt6 = null;
ResultSet rs6 = null;

String userName=request.getRemoteUser();

String ForeignLanguageName = "";
String Reading = "";
String Writing = "";
String Speaking = "";
String LearningPlace="";
String NativeLanguageInfo="";



 String query6 = "SELECT * FROM tblForeignLanguage WHERE idLanguage=? ";
 stmt6 = conn.getStatement(con, query6);

 try {
	 	stmt6.setString(1,idLanguage2);
	 	rs6 = stmt6.executeQuery();
	       while (rs6.next()) {
	      		ForeignLanguageName = rs6.getString("Language");
	      		Reading = rs6.getString("Reading");
	      		Writing = rs6.getString("Writing");
	      		Speaking = rs6.getString("Speaking");
	      		LearningPlace=rs6.getString("LearningPlace");
	      		NativeLanguageInfo=rs6.getString("NativeLanguageInfo");
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
	<form class="form-horizontal" data-toggle="validator" name="sform"
		method="POST" action="CVForeignLaguageInfoUpdateServlet" data-fv-framework="bootstrap"
		data-fv-framework="bootstrap"
		data-fv-icon-valid="glyphicon glyphicon-ok"
		data-fv-icon-invalid="glyphicon glyphicon-remove"
		data-fv-icon-validating="glyphicon glyphicon-refresh">
		<div class="container">
		<p><br><br></p>
				<ul class="nav nav-pills col-md-offset-2   ">
				<li><a data-toggle="pill" href="CVContactInformationUpdate.jsp">İletişim Bilgileri</a></li>
				<li><a data-toggle="pill" href="CVPersonalInformationUpdate.jsp">Kişisel Bilgiler</a></li>
				<li ><a data-toggle="pill" href="CVEducationalInfoUpdate2.jsp">EğitimBilgileri</a></li>
				<li><a data-toggle="pill" href="CVBusinessInfoUpdate2.jsp">İş Deneyimi</a></li>
				<li class="active"><a data-toggle="pill" href="CVForeignLanguageInfoUpdate2.jsp">Yabancı Dil</a></li>
				<li><a data-toggle="pill" href="CVReferenceInfoUpdate2.jsp">Referans Bilgileri</a></li>
				<li><a data-toggle="pill" href="CVAdditionalInfoUpdate.jsp">Ek Bilgiler</a></li>
			</ul>

			<div class="tab-content text-center">
				<div id="home" class="tab-pane fade in active">
					<br>
					<div class="container center ">


						<div class="form-group">
							<label class="control-label col-sm-7" for="Language">Yabancı Dil Adı&nbsp;&nbsp;&nbsp;:</label>
							<div class="control-label col-sm-2 col-sm-offset-0 ">
								<select class="form-control" name="Language" required>
									<option value="<%=ForeignLanguageName%>"><%=ForeignLanguageName%></option>
									<option value="">------------------</option>
									<option value="1">Diğer</option>
									<option value="Türkçe">Türkçe</option>
									<option value="Almanca">Almanca</option>
									<option value="Arapça">Arapça</option>
									<option value="Arnavutça">Arnavutça</option>
									<option value="Fransızca">Fransızca</option>
									<option value="İngilizce">İngilizce</option>
									<option value="İspanyolca">İspanyolca</option>
									<option value="Azerbaycan Türkçesi">Azerbaycan
										Türkçesi</option>
									<option value="Bulgarca">Bulgarca</option>
									<option value="Çince">Çince</option>
									<option value="Farsça">Farsça</option>
									<option value="İtalyanca">İtalyanca</option>
									<option value="Japonca">Japonca</option>
									<option value="Korece ">Korece</option>
									<option value="Latince ">Latince</option>
									<option value="Norveççe">Norveççe</option>
									<option value="Portekizce">Portekizce</option>
									<option value="Tayvanca ">Tayvanca</option>

								</select>
							</div>
						</div>


   
    <div class="form-group">
      <label class="control-label col-sm-5" for="NativeLanguageInfo">Ana Dil Bilgisi&nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">          
       <select name="NativeLanguageInfoRadio" class="form-control" required >
       <option value="<%=NativeLanguageInfo%>"><%=NativeLanguageInfo%></option>
       <option>------------</option>
       <option value="Evet">Evet</option>
        <option value="Hayır">Hayır</option>
       </select>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-5" for="Reading">Okuma&nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">          
        <select name="Reading" class="form-control" required>
           <option value="<%=Reading%>"><%=Reading%></option>
            <option value="">-----------------</option>
          <option value="Çok İyi">Çok İyi</option>
          <option value="iyi">iyi</option>
          <option value="orta">orta</option>
            <option value="kötü">kötü</option>
        </select>
      </div>
    </div>
    
 <div class="form-group">
      <label class="control-label col-sm-5" for="Writing">Yazma&nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">          
        <select name="Writing" class="form-control" required>
         <option value="<%=Writing%>">Seçiniz</option>
         <option value="">--------------</option>
          <option value="Çok İyi">Çok İyi</option>
          <option value="iyi">iyi</option>
          <option value="orta">orta</option>
            <option value="kötü">kötü</option>
        </select>
      </div>
    </div>
    
    
    <div class="form-group">
      <label class="control-label col-sm-5" for="Speaking">Konuşma&nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">          
        <select name="Speaking" class="form-control" required>
          <option value="<%=Speaking%>"><%=Speaking%></option>
          <option value="">-------------------</option>
          <option value="Çok İyi">Çok İyi</option>
          <option value="iyi">iyi</option>
          <option value="orta">orta</option>
            <option value="kötü">kötü</option>
        </select>
      </div>
    </div>
    
    
    <div class="form-group">
      <label class="control-label col-sm-5" for="LearningPlace">Öğrenilen Yer&nbsp;&nbsp;&nbsp;:</label>
      <div class="col-sm-7">          
        <input type="text" class="form-control" value="<%=LearningPlace%>" name="LearningPlace"  >
      </div>
    </div>
       
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-8">

								<button type="submit" class="btn btn-primary">GÜNCELLE</button>

							</div>
						</div>

<input type="hidden" value=<%=request.getParameter("idLanguage") %> name="idLanguage">
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
	conn.closeStatement(stmt6);
	conn.closeResultSet(rs6);
	conn.closeConnection(con);
	
}
 %>
</html>