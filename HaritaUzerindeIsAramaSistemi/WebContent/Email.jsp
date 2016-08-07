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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
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
.help {
    display:none;
    font-size:90%;
}
input:focus + .help {
    display:inline-block;
}
div.submit {
    margin-left:170px;
    }
    .alert-box {
    color:#555;
    border-radius:10px;
    font-family:Tahoma,Geneva,Arial,sans-serif;
    font-size:11px;
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
</style>
</head>
<body>
	
	<%
		String username = request.getRemoteUser();
		session.setAttribute("username", username);
	%>
	<%
	   ConnectionHelper conn= new ConnectionHelper();
	   Connection con = conn.getConnection();
	   PreparedStatement stmt10 = null;
	   ResultSet rs10 = null;
	   PreparedStatement stmt = null;
	   ResultSet rs = null;
	   String query10 = "SELECT * FROM tblMessage WHERE UserName=? ";
	   String query= "SELECT * FROM  tblUserRegistration";
	   stmt10 = conn.getStatement(con, query10);
	   stmt = conn.getStatement(con, query);
	   int messageCount =0;

		stmt10.setString(1,request.getRemoteUser());
	 	rs10 = stmt10.executeQuery();
	 	rs=stmt.executeQuery();
		while (rs10.next()) {
			rs10.getString("UserName");
			messageCount++;
		} 
		messageCount=0;
	%>

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
                           <input type="text" name="userName" class="form-control" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-default" onclick="form.action='userSearch'"><span class="glyphicon glyphicon-search"></span></button>
                    </form>

				<ul class="nav navbar-nav navbar-right">
					<li><a href="/HaritaUzerindeIsArama/MyReferencesUser.jsp"><span class="glyphicon glyphicon-list-alt"></span> Başvurularım</a></li>
				    <li><a href="/HaritaUzerindeIsArama/Inbox.jsp"><span class="glyphicon glyphicon-envelope"></span>&nbsp;<span class="badge"></span> </a></li><!-- Didem Kaçmaz Email -->
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> <span class="glyphicon glyphicon-user"></span> <%=request.getRemoteUser()%><span class="caret"></span></a>
				<ul class="dropdown-menu">
							<li><a href="userTimeLine.jsp?userName=<%=request.getRemoteUser()%>"><span class="glyphicon glyphicon-user"></span>Profilim</a></li>
							<li><a href="CVContactInformation.jsp"><span class="glyphicon glyphicon-user"></span>Özgeçmiş Bilgilerim</a></li><!-- Didem Kaçmaz Özgeçmiş -->
							<li><a href="CVContactInformationUpdate.jsp"><span class="glyphicon glyphicon-user"></span> Özgeçmiş Bilgilerimi Güncelle</a></li><!-- Özgeçmiş Güncelle -->
							<li><a href="UserSettings.jsp"><span class="glyphicon glyphicon-cog"></span>Hesabım</a></li>
				</ul></li>
					<li><a href="/HaritaUzerindeIsArama/logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Çıkış Yap</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<form  action="MailServlet" method="POST">
		<br/><br/>	<br/><br/><br>
	<div class="container-fluid">


		
  <div class="container-fluid ">
   
      <div class="form-group">
			<div class="col-sm-offset-4 col-sm-8">
    <ul class="nav navbar-nav">
      <li><a href="Inbox.jsp">Gelen Kutusu</a></li>
      <li><a href="Email.jsp">Email Oluştur</a></li>
      <li><a href="Trash.jsp">Çöp Kutusu</a></li> 
    </ul>
    </div>
    </div><br><br><br>
  </div>
</nav>
	<div id="rcorners2" >
	
	  <h4 class="modal-title">Mail Gönder</h4>
	  <br>
	  <div class="form-group">
                  <label class="col-sm-2" for="inputTo">Kime</label>
                  <div class="col-sm-10">
                  <select class="form-control" name="inputTo" required>
                  <%while (rs.next()) {%>
                  <option value="<%=rs.getString("UserName")%>"><%=rs.getString("UserName")%></option>
                 <% }  %>
                  </select>
                  </div>
        </div><br><br>
                    <div class="form-group">
                  <label class="col-sm-2" for="inputSubject">Konu</label>
                  <div class="col-sm-10"><input type="text" class="form-control" name="inputSubject" maxlength="100" required placeholder="" ></div>
                </div><br><br>
                          
            
                <div class="form-group">
							<label class="col-sm-2" for="inputBody">Mesaj</label><br>
							 <div class="col-sm-10"><textarea class="form-control" name="inputBody" rows="3" maxlength="500" style="width: 100%; height: 100%;" ></textarea></div>
							</div><br><br><br><br><br><br><br>
							<div class="form-group">
							<div class="col-sm-offset-5 col-sm-8">

								<button type="submit" class="btn btn-success" >Gönder</button>

							</div>
						</div>
          </div>
	</div>

    </form>
     	<script type="text/javascript"
		src="http://js.nicedit.com/nicEdit-latest.js"></script>
	<script type="text/javascript">
		//<![CDATA[
		bkLib.onDomLoaded(function() {
			nicEditors.allTextAreas()
		});
		//]]>
	</script>
	
</body>
</html>