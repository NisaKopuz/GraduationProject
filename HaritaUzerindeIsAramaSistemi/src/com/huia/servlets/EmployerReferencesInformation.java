package com.huia.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.huia.service.dao.ad.AdDAOImp;
import com.huia.service.dao.user.UserDAOImp;

/**
 * Servlet implementation class ReferencesInformationForEmployer
 */
@WebServlet("/employerReferencesInformation")
public class EmployerReferencesInformation extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		AdDAOImp addao = new AdDAOImp();
		UserDAOImp user = new UserDAOImp();

		ArrayList<String> applicantinformation = new ArrayList<String>();
		ArrayList<String> userinformation = new ArrayList<String>();

		int adid = Integer.parseInt(request.getParameter("adid"));
		String referencesusername, message;
		String html = "";
		String advertname;
		String filepath;
		int k = 0, referenceid = 0;

		advertname = addao.getAdvertName(adid);

		// html += "<div id=\"" + adid + "\" class=\"modal fade\">";
		html += "<div class=\"modal-dialog modal-lg\" >";
		html += "<div class=\"modal-content\"><div class=\"modal-header\"><button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button>";
		html += "<h4 class=\"modal-title\" id= \"myModalLabel\">" + advertname
				+ "</h4></div><div class=\"modal-body\">";

		html += "<table class=\"table table-striped\" >";

		html += "<thead><tr><th>Adı Soyadı</th><th>Başvuru Tarihi</th><th>Mesaj</th><th>Cevapla</th></tr></thead><tbody>";

		applicantinformation = addao.getApplicants(adid);
		k = 0;
		while (k != (applicantinformation.size())) {

			referenceid = Integer.parseInt(applicantinformation.get(k));
			k++;
			html += "<tr>";
			referencesusername = applicantinformation.get(k);

			filepath = user.getUserCV(adid, referencesusername);

			userinformation = user.usernameandsurname(referencesusername);
			// izel - kullanıcı profil linki eklendi
			html += "<td><a href= \"http://localhost:8080/HaritaUzerindeIsArama/UserProfile.jsp?userName=" + referencesusername + "\">" + userinformation.get(0) + "  "
					+ userinformation.get(1) + "</a></td>";

			k++;
			html += "<td>" + applicantinformation.get(k) + "</td>";
			k++;

			message = user.getMessageForEmployer(referencesusername, adid);
			/// ------------------------------------------------------------------------
			if ((Integer.parseInt(applicantinformation.get(k))) == 0) {
				html += "<td>" + " " + "</td>";
			} else if (Integer.parseInt(applicantinformation.get(k)) == 1) {
				html += "<td><a href=\"#\" onclick=\"edit(" + adid + ",'"
						+ referencesusername
						+ "')\"><span id=\"unopenedmessage\" data-toggle=\"modal\" data-target=\"#myModal"
						+ referenceid
						+ "\" class=\"glyphicon glyphicon-envelope\"></span></a></td>";
			} else if (Integer.parseInt(applicantinformation.get(k)) == 2) {
				message = user.getMessageForEmployer(referencesusername, adid);
				html += "<td><img id=\"openedmessage\" data-toggle=\"modal\" data-target=\"#myModal"
						+ referenceid
						+ "\" src=\"https://cdn4.iconfinder.com/data/icons/social-communication/142/open_mail_letter-512.png\" style=\"width:20px; height: 20px;\"></td>";
			}

			html += "<div class=\"modal fade\" id=\"myModal" + referenceid
					+ "\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModal"
					+ referenceid
					+ "\" aria-hidden=\"true\"><div class=\"modal-dialog\">";
			html += "<div class=\"modal-content\"><div class=\"modal-header\">";
			html += "<h4 class=\"modal-title\" id= \"myModalLabel\"></h4></div><div class=\"modal-body\"><h3>"
					+ message + "</h3></div>";
			html += "<div class=\"modal-footer\"><button type=\"button\" class=\"btn btn-default\" id=\"closebutton\" onclick=\"closeModal("
					+ adid + ",'myModal" + referenceid
					+ "')\" >Kapat</button></div></div></div></div>";

			// Cevapla

			html += "<form action=\"SendMail\" method=\"post\"><td><a href=\"#\"  onclick=\"nicedit("
					+ referenceid
					+ ")\"><span data-toggle=\"modal\" data-target=\"#myModal2"
					+ referenceid
					+ "\" class=\"glyphicon glyphicon-share-alt\"></span></a></td>";
			html += "<input type=\"hidden\" name=\"hdnusername\" value=\""
					+ referencesusername + "\">";
			html += "<input type=\"hidden\" name=\"hdnadvertid\" value=\""
					+ adid + "\">";
			html += "<div class=\"modal fade\" id=\"myModal2" + referenceid
					+ "\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModal2"
					+ referenceid
					+ "\" aria-hidden=\"true\"><div class=\"modal-dialog\">";
			html += "<div class=\"modal-content\"><div class=\"modal-header\"><button type=\"button\" class=\"close\" onclick=\"closeModal("
					+ adid + ",'myModal2" + referenceid
					+ "')\" >&times;</button><h5><b>Gönderilen:</b> "
					+ userinformation.get(0) + "  " + userinformation.get(1)
					+ "</h5>";
			html += "<h4 class=\"modal-title\" id= \"myModalLabel\"></h4></div><div class=\"modal-body\"><h3>"
					+ "<textarea  name=\"answer\" id=\"nick" + referenceid
					+ "\" style=\"width: 555px; height: 200px;\" ></textarea>"
					+ "</h3></div>";
			html += "<div class=\"modal-footer\"><button type=\"submit\" class=\"btn btn-default\" >Gönder</button></div></div></div></div></form>";

			if (filepath != null) {

				html += "<td><a href=\"http://localhost:8080/HaritaUzerindeIsArama/DownloadFileServlet?filePath="
						+ filepath
						+ "\"><span class=\"glyphicon glyphicon-folder-open\"></span></a></td>";
			}
			html += "</tr>";

			k++;

		}

		html += "</tbody></table></div>";
		html += "<div class=\"modal-footer\"><button type=\"button\" class=\"btn btn-default\" onclick=\"listByBonusFeature("
				+ adid
				+ ")\"><span style=\"color:yellow\"class=\"glyphicon glyphicon-star\"></span></button><button type=\"button\" id=\"btn\" class=\"btn btn-default\" onclick=\"changeStatus()\" data-dismiss=\"modal\">Kapat</button></div></div></div></div>";

		response.getWriter().write(html);

	}

}
