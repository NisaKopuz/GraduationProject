package com.huia.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.huia.service.dao.ad.AdDAOImp;

/**
 * Servlet implementation class EmployerReferenceAdverts
 */
@WebServlet("/EmployerReferenceAdverts")
public class EmployerReferenceAdverts extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		AdDAOImp addao = new AdDAOImp();

		ArrayList<Integer> departmentids = new ArrayList<Integer>();
		ArrayList<Integer> adids = new ArrayList<Integer>();

		// Session alınması
		HttpSession session = request.getSession();
		String html = "";
		String username = request.getParameter("Username");

		String advertname, advertapplydate;

		departmentids = addao.getDepartmentId(username);
System.out.println(departmentids.size());
		for (int i = 0; i < departmentids.size(); i++) {

			adids = addao.getReferencesAdvertId(departmentids.get(i));
			System.out.println(adids.size());
			for (int j = 0; j < adids.size(); j++) {
				System.out.println(adids.get(j));
				advertname = addao.getAdvertName(adids.get(j));

				advertapplydate = addao.getApplyDateForAdvert(adids.get(j));
				html += "<input type=\"hidden\" name=\"hdnadvertid\" value=\""
						+ adids.get(j) + "\"  id=\"hdnadvertid\">";
				session.setAttribute("advertname", advertname);

				html += "<table><tr>";
				html += "<td>" + advertapplydate + "</td>";
				html += "<td>" + addao.getCountReferences(adids.get(j))
						+ "</td>";
				html += "<td><a href=\"javascript:void(0)\"  onclick=\"referencesEmployerInformation("
						+ adids.get(j)
						+ ")\" data-toggle=\"modal\" data-target=\"#"
						+ adids.get(j) + "\" >" + advertname + "</a>";
				html += "<div id=\"" + adids.get(j)
						+ "\" class=\"modal fade\" role=\"dialog\">";
				html += "</td></table>";

			}
		}
		response.getWriter().write(html);
	}

}
