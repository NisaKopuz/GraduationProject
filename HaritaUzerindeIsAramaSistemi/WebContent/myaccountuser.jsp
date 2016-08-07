<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html lang="tr">
<head>
<title>Hesabım</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
	 <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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

<body onload="ControlErrorMessage()">




<script>

	$(document).ready(function() {
		
		$.get('getUsersinformation',function(responseJson) {                                    
           $.each(responseJson, function(key, deger) { 
        	   
        	   if(key==0)
        			document.getElementById("nname").value=deger;
        			 
     		  	if(key==1)
        	 		 document.getElementById("ssurname").value=deger; 
        
     		  	if(key==2)
        	   		document.getElementById("e-mail").value=deger; 
        	   	
     		  	else	
        	   		
        	   		document.getElementById("phonenumber").value=deger;
        	   		
        	    	
                });
        });
});


</script>

<%
		String username = request.getRemoteUser();
		session.setAttribute("username", username);
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

<form class="form-horizontal" role="form" action="ChangeAccountInformationUser" method="POST">
 
		<div class="container-fluid">
		<br><br><br>
 
	<div id="rcorners2" class="jumbotron">
    <h4 style="color: #4A1031;"><strong>Hesap Ayarlarım</strong></h4>   
    <br/>
    
    
    <label class="control-label col-sm-2">Ad:</label>
    <div class="col-sm-4" id="name">
 	 <input type="text"   class="form-control" id="nname" name="name" value="" required/>
    </div>
    
  	<br/><br/><br/>
     <label class="control-label col-sm-2">Soyad:</label>
    <div class="col-sm-4" id="surname">
    <input type="text"   class="form-control" id="ssurname" name="surname" required/>
    </div>
    
    <br/><br/><br/>
     <label class="control-label col-sm-2">E-posta Adresi:</label>
    <div class="col-sm-4">
    <input type="text"   class="form-control" id="e-mail" name="email" required/>
    </div>
    
    
      <br/><br/><br/>
     <label class="control-label col-sm-2">Cep Telefonu:</label>
    <div class="col-sm-4">
    <input type="text"   class="form-control" id="phonenumber" name="phonenumber" required/>
    </div>
    
  
    
     <br/><br/><br/>

     
    
     <script>
     
     function ControlErrorMessage()
     {
    	   var errormessage = "<%= session.getAttribute("errorMessage") %>"
           if((errormessage.localeCompare(null))!=0)
          	 {
        	   document.getElementById("rcorners2").style.height = "600px";
        	
               $('#lnkSifreDegistir').text('Şifremi Değiştirmeyeceğim');
               $('#hdnSifreDegistircekMi').val("evet")
                $('#hdnisClicked').val("evet")
               $("#dvSifreDegistir").show();
          		 $("#dvErrorMessage").show();
          		
          	 
          	 }
          
    	 
     }
     
     function GosterGizle() {
	  	
         if ($('#dvSifreDegistir').css('display') == 'none') {
        	 document.getElementById("rcorners2").style.height = "600px";
        
             $('#lnkSifreDegistir').text('Şifremi Değiştirmeyeceğim');
             $('#hdnSifreDegistircekMi').val("evet")
              $('#hdnisClicked').val("evet")
             $("#dvSifreDegistir").show();
      
    
            
             
         } else {
       
        	 document.getElementById("rcorners2").style.height = "455px";
             $("#dvSifreDegistir").hide();
             $('#hdnSifreDegistircekMi').val("hayir")
             $('#lnkSifreDegistir').text('Şifremi Değiştir');
             $('#hdnisClicked').val("hayir")
         }
     }

     
     </script>
     
     <script>
    function validatePass(p1, p2) {
    if (p1.value != p2.value ) {
        p2.setCustomValidity('Şifreler uyuşmuyor.');
    } else {
        p2.setCustomValidity('');
    }
}
    </script>
    <script type="text/javascript">    
   
   
    function checkPassword(str)
    {
    	 var re = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}/;
    	if((re.match(str.value))==false)
    		{
    		str.setCustomValidity('En az 6 karakter içermelidir.Büyük,küçük harf ve numara içermelidir.');
    		}
    	
    }
    
  

</script>
    
    
    
    <div class="col-sm-4">
  <a id="lnkSifreDegistir" href="javascript:void(0);" onclick="GosterGizle()" class="link">
                                Şifremi Değiştir</a>   </div>
                            <input id="hdnSifreDegistircekMi" value="hayir" name="hdnSifreDegistircekMi" type="hidden" />
                            <input id="hdnisClicked" value="hayir" name="hdnisClicked" type="hidden" />
                            <br />
                            <br />
                         
                            <div id="dvSifreDegistir" style="display: none">
                                <table>
                                    <tr style="height: 35px; vertical-align: top;">
                                        <td style="width: 120px;">
                                        
                               
                                           <label class="control-label col-sm-2">Eski Şifre:</label>
                                        </td>
                                        <td>
                                            <input   class="form-control" name="ctl00$MasterPageBody$txtEskiSifre" type="password" id="txtEskiSifre" class="nesne" style="width:250px;" />
                                        </td>
                                        <td>
                                        <div  style="display: none" id="dvErrorMessage" class="alert-box error"><span>error: </span>${errorMessage}</div>
                                      <% session.removeAttribute("errorMessage"); %>
                                          <!--  &nbsp; <a href="/website/TeknikDestek/sifremiunuttum/s1.aspx" class="link">
                                                Şifremi Hatırlamıyorum</a>--> 
                                        </td>
                                    </tr>
                                    <tr style="height: 35px; vertical-align: top;">
                                        <td style="width: 120px;">
                                           <label class="control-label col-sm-2">Yeni Şifre:</label>
                                        </td>
                                        <td>
                                        <!--  <input class="form-control" type="password" id="txtYeniSifre" name="txtYeniSifre" class="nesne" style="width: 250px"
                                                size='30'  aria-describedby="name-format" title="En az 6 karakter içermelidir.Büyük,küçük harf ve numara içermelidir." type="password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" > -->
                                            <input class="form-control" aria-describedby="name-format" type="password" id="txtYeniSifre" name="txtYeniSifre"   style="width: 250px" oninput="checkPassword(document.getElementById('txtYeniSifre'));"  onfocus="checkPassword(document.getElementById('txtYeniSifre'));"   />
                                               <span id="name-format" class="help"><b>En az 6 karakter içermelidir.Büyük,küçük harf ve numara içermelidir.</b></span>
                                        
                                              </td>
                                        <td rowspan="2">
 									 </td>
  
                                    </tr>
                                    <tr style="height: 35px; vertical-align: top;">
                                        <td style="width: 120px;">
                                          <label class="control-label col-sm-2">Yeni Şifre(tekrar):</label>
                                        </td>
                                        <td>
                                            <input class="form-control" name="ctl00$MasterPageBody$txtYeniSifreTekrar" type="password" id="txtYeniSifreTekrar" class="nesne" style="width:250px;" onfocus="validatePass(document.getElementById('txtYeniSifre'), this);" oninput="validatePass(document.getElementById('txtYeniSifre'), this);">
                                        </td>
                                    </tr>
                                </table>
                            </div>
                      
 
              
     <div align="right">
   
      <button type="button" data-target="#modal" data-toggle="modal" class="btn btn-primary btn-xs" >Kaydet</button> 
   
   <!-- Commit -->
   
	<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog">
            <div class="modal-content">
            
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                   
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
  
 
</body>
</html>