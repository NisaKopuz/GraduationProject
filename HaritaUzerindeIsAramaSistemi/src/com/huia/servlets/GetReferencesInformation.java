package com.huia.servlets;

//TODO: Deðiþtirildi.1605
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.huia.service.dao.user.UserDAOImp;

/**
 * Servlet implementation class GetReferencesInformation
 */
@WebServlet("/getreferenceinformation")
public class GetReferencesInformation extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		// Session ile kullanıcının alınması
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");

		UserDAOImp user = new UserDAOImp();
		ArrayList<String> referencesinformation = new ArrayList<String>();
		String html = "";
		String message = "";
		int adid;
		int i = 0;

		referencesinformation = user.getReferencesInformation(username);

		if (!referencesinformation.isEmpty()) {

			/// Baþvuru Hareketi (false->başvuru iletildi. true->başvuru
			/// görüntülendi.)

			/// Mesaj(0->null,1->okunmadı,2->okundu)
			do {

				adid = Integer.parseInt(referencesinformation.get(i));
				html += "<input type=\"hidden\" id=\"GetAdId\" value=\"" + adid
						+ "\">";
				html += "<tr>";
				for (int j = 0; j < 2; j++) {
					i++;
					html += "<td>" + referencesinformation.get(i) + "</td>";

				}
				i++;

				if (Boolean
						.parseBoolean(referencesinformation.get(i)) == false) {

					html += "<td>Başvuru İletildi</td>";
					i++;

				} else if (Boolean
						.parseBoolean(referencesinformation.get(i)) == true) {

					html += "<td>Başvuru Görüntülendi</td>";
					i++;

				}
				if ((Integer.parseInt(referencesinformation.get(i))) == 0) {

					html += "<td>" + " " + "</td>";
					i++;

				} else if (Integer
						.parseInt(referencesinformation.get(i)) == 1) {

					message = user.getMessageForUser(adid, username);

					html += "<td><a href=\"#\" onclick=\"edit()\"><span id=\"unopenedmessage\" data-toggle=\"modal\" data-target=\"#"
							+ adid
							+ "\" class=\"glyphicon glyphicon-envelope\"></span></a></td>";
					html += "<div class=\"modal fade\" id=\"" + adid
							+ "\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\""
							+ adid
							+ "\" aria-hidden=\"true\"><div class=\"modal-dialog\">";
					html += "<div class=\"modal-content\"><div class=\"modal-header\"><button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button>";
					html += "</div><div class=\"modal-body\"><h3>" + message
							+ "</h3></div>";
					html += "<div class=\"modal-footer\"><button type=\"button\" class=\"btn btn-default\" onclick=\"window.location.reload(false);\" data-dismiss=\"modal\">Kapat</button></div></div></div></div>";
					i++;
				}

				else if (Integer.parseInt(referencesinformation.get(i)) == 2) {

					message = user.getMessageForUser(adid, username);

					html += "<td><img id=\"openedmessage\" data-toggle=\"modal\" data-target=\"#"
							+ adid
							+ "\" src=\"https://cdn4.iconfinder.com/data/icons/social-communication/142/open_mail_letter-512.png\" style=\"width:20px; height: 20px;\"></td>";
					html += "<div class=\"modal fade\" id=\"" + adid
							+ "\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\""
							+ adid
							+ "\" aria-hidden=\"true\"><div class=\"modal-dialog\">";
					html += "<div class=\"modal-content\"><div class=\"modal-header\"><button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button>";
					html += "</div><div class=\"modal-body\"><h3>" + message
							+ "</h3></div>";
					html += "<div class=\"modal-footer\"><button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Kapat</button></div></div></div></div>";
					i++;
				}
				/// Silme X iþareti
				html += "<td><a data-target=\"#modal\" data-toggle=\"modal\" href=\"javascript:void(0)\"><span class=\"glyphicon glyphicon-remove\"></span></a></td>";
				html += "<div class=\"modal fade\" id=\"modal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel\">"
						+ "<div class=\"modal-dialog\"><div class=\"modal-content\"><div class=\"modal-header\">"
						+ "<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button></div>"
						+ "<div class=\"modal-body\"><p>Kaldırmak istediğinize emin misiniz?</p><p class=\"debug-url\"></p></div>"
						+ "<div class=\"modal-footer\"><button class=\"btn btn-default\"  onclick=\"deleteref()\" >Evet</button>"
						+ "<button  class=\"btn btn-default\" data-dismiss=\"modal\">Hayır</button></div></div></div></div>";

				html += "</tr>";

			} while (i < referencesinformation.size());

			response.getWriter().write(html);
		}
	}

}
