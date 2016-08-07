package com.huia.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.huia.service.dao.ad.AdDAOImp;

/**
 * Servlet implementation class GetAdverts
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/GetAdverts",
		"/getadverts" })
public class GetAdverts extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		AdDAOImp addao = new AdDAOImp();

		String companyId = request.getParameter("companyId");
		ArrayList<Integer> departmentids = new ArrayList<Integer>();
		ArrayList<Integer> advertids = new ArrayList<Integer>();
		String html = "<table class=\"table table-hover\"><tbody>";

		departmentids = addao.getDepartmentIdWithCompanyId(companyId);

		for (int i = 0; i < departmentids.size(); ++i) {
			advertids = addao.getAdvertIds(departmentids.get(i));
			for (int j = 0; j < advertids.size(); ++j) {
				html = html + "<tr><td onclick=\"getAdvert(" + advertids.get(j)
						+ ")\" data-toggle=\"modal\" data-target=\"#myModal\"><a href=\"javascript:void(0)\">"
						+ addao.getAdvertName(advertids.get(j))
						+ "</a></td><input type=\"hidden\" name=\"departmentId\" id=\"departmentId\" value=\""
						+ departmentids.get(i) + "\"/><td>"
						+ "<div class=\"pull-right\"><button data-target=\"#modal\" data-toggle=\"modal\" type=\"button\" "
						+ "class=\"btn btn-primary  btn-xs\">İlanı Kaldır</button></div></td><tr>"
						+ "<div class=\"modal fade\" id=\"modal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel\">"
						+ "<div class=\"modal-dialog\"><div class=\"modal-content\"><div class=\"modal-header\">"
						+ "<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button></div>"
						+ "<div class=\"modal-body\"><p>Kaldırmak istediğinize emin misiniz?</p><p class=\"debug-url\"></p></div>"
						+ "<div class=\"modal-footer\"><button class=\"btn btn-default\" onclick=\"deleteAdvert("
						+ advertids.get(j) + ")\">Evet</button>"
						+ "<button  class=\"btn btn-default\" data-dismiss=\"modal\">Hayır</button></div></div></div></div>";

			}
		}

		html = html + "</tbody></table>";
		response.getWriter().write(html);
	}

}
