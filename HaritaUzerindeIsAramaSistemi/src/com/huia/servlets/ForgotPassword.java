package com.huia.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.huia.service.dao.user.UserDAOImp;

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet(
		asyncSupported = true, 
		urlPatterns = { 
				"/ForgotPassword", 
				"/forgotpassword"
		})
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		UserDAOImp user = new UserDAOImp();
		String userPassword = user.getUserPassword(request.getParameter("uname"), request.getParameter("email"));
		if(userPassword == null){
			response.getWriter().write("1");
		}else{
			String msgBody = "<!DOCTYPE html>"+
					"<html lang=\"tr\">"+
					"<head>"+
					"<title>İşBurada.com</title>"+
					"<meta charset=\"utf-8\">"+
					"<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"+
					"<link rel=\"stylesheet\" href=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css\">"+
					"<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js\"></script>"+
					"<script	src=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js\"></script>"+
					"<title>İşBurada.com</title>"+
					"<style>"+
					"body {"+
					"	padding-top: 50px; "+
					"}"+
					".loginbox {"+
					"	-moz-box-shadow: 0 0 2px black;"+
					"    -webkit-box-shadow: 0 0 2px black;"+
					"    box-shadow: 0 0 2px black;"+
					"    background-color: #eee;"+
					"}"+
					"</style>"+
					"</head>"+
					"<body>"+
					"	<div class=\"container-fluid\">"+
					"		<div class=\"row\">"+
					"			<div class=\"col-md-3\"></div>"+
					"			<div class=\"col-md-6\">"+
					"				<br> <br> <br> "+
					"				<div class=\"loginbox\">"+
					"				<br> <br>"+
					"					<h3 class=\"text-center\">isBurada.com " + request.getParameter("uname") + " için kullanıcı şifreniz</h3>"+
					"					<br> <br> "+
					"					<h1 class=\"text-center\">" + userPassword + "</h1>"+
					"				<br> <br>"+
					"					<h5 class=\"text-center\"> Güvenliğiniz için giriş yaptıktan sonra şifrenizi değiştirmenizi öneriyoruz. </h5>"+
					"					<h6 class=\"text-center\"> ©isburada.com </h6>"+
					"					<br><br>"+
					"				</div>"+
					"			</div>"+
					"		</div>"+
					"	</div>"+
					"</body>"+
					"</html>";
			user.sendEmail(request.getParameter("email"), "işburada.com Şifreniz", msgBody);
			response.getWriter().write("0");
		}
	}

}
