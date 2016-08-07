package com.huia.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.huia.service.dao.user.UserDAOImp;

/**
 * Servlet implementation class BonusFeature
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/BonusFeature",
		"/bonusfeature" })
public class BonusFeature extends HttpServlet {

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

		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");

		int internshipcount = 0;
		int certificatecount = 0;
		int seminarcount = 0;
		String positionvalue = null;
		UserDAOImp user = new UserDAOImp();

		// Count internship
		String[] jobs = request.getParameterValues("jobs");
		String[] partjobs = jobs[0].split(",");
		for (int i = 0; i < partjobs.length; i += 4) {
			if (Integer.parseInt(partjobs[i + 1]) == 7) {
				internshipcount += 1;
			}

		}

		// Birtday
		String[] birthdaydate = request.getParameterValues("birthdaydate");

		// Certificate Count
		String[] certificates = request.getParameterValues("certificate");
		if (certificates[0] != "") {
			String[] partcertificate = certificates[0].split(",");
			certificatecount = partcertificate.length;
		}
		// Seminar Count
		String[] seminars = request.getParameterValues("seminar");
		if (seminars[0] != "") {
			String[] partseminar = seminars[0].split(",");
			seminarcount = partseminar.length;
		}
		// Add Grading Table

		user.AddBonusFeature(username, birthdaydate[0], certificatecount,
				internshipcount, seminarcount);

		// AddUniversity to Database
		String[] universities = request.getParameterValues("universities");
		String[] parts = universities[0].split(",");

		for (int i = 0; i < parts.length; i += 3) {
			user.AddBonusFeatureOfUniversity(username, parts[i], parts[i + 1],
					parts[i + 2]);

		}

		// Add Language to Database
		String[] language = request.getParameterValues("language");
		String[] partlanguage = language[0].split(",");
		for (int i = 0; i < partlanguage.length; i += 4) {

			user.AddBonusFeatureOfLanguage(username, partlanguage[i],
					partlanguage[i + 1], partlanguage[i + 2],
					partlanguage[i + 3]);

		}

		// Add Job Experience to Database

		for (int i = 0; i < partjobs.length; i += 4) {
			if (Integer.parseInt(partjobs[i + 1]) == 7) {
				positionvalue = "0";
			} else {
				positionvalue = partjobs[i + 1];
				user.AddBonusFeatureOfJobExperience(username, partjobs[i],
						positionvalue, partjobs[i + 2], partjobs[i + 3]);

			}
		}

		// Call procedure
		try {
			user.callOracleStoredProcOUTParameter(username);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (user.isUserExistInReferencesTable(username))
			user.AddScoreToReferencesTable(username);
	}

}
