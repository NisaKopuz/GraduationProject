package com.huia.servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.huia.service.dao.ad.AdDAOImp;

/**
 * Servlet implementation class Filter
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/Filter", "/filter" })
public class Filter extends HttpServlet {

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

		ArrayList<Integer> departmentids = new ArrayList<Integer>();

		String[] sector = request.getParameterValues("sector");
		String[] jobfield = request.getParameterValues("jobfield");
		String[] city = request.getParameterValues("city");
		String[] positiontype = request.getParameterValues("positiontype");
		String[] positionlevel = request.getParameterValues("positionlevel");
		String[] educationlevel = request.getParameterValues("educationlevel");
		String[] netsalary = request.getParameterValues("netsalary");
		String[] postingdate = request.getParameterValues("postingdate");
		String company = request.getParameter("company");
		String exp = request.getParameter("exp");
		String notexp = request.getParameter("notexp");
		String expsame = request.getParameter("expsame");

		int[] educationalLevel = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
		Calendar cal = Calendar.getInstance();
		Calendar today = Calendar.getInstance();

		/// Edited values for query
		String Experience;
		String Sector;
		String JobField;
		String City;
		String PositionType;
		String PositionLevel;
		String EducationalLevel;
		String PostingDate = null;
		String NetSalary;
		String CompanyName = null;

		AdDAOImp ad = new AdDAOImp();

		// Experience Column
		if (exp.length() == 1) // Tecrübeli
			Experience = "Tecrübeli";
		else if (notexp.length() == 1) // Tecrübesiz
			Experience = "Tecrübesiz";
		else if (expsame.length() == 1) // Farketmez
			Experience = "Farketmez";
		else
			Experience = null;

		// Company
		if (company != "") {
			CompanyName = company;
		}

		// Sector1-5 Columns
		if (sector[0] != "")
			Sector = "(" + (String.join(",", sector)) + ") ";
		else
			Sector = null;

		// JobField1-5 Columns
		if (jobfield[0] != "")
			JobField = "(" + (String.join(",", jobfield)) + ") ";
		else
			JobField = null;

		// City Column
		if (city[0] != "")
			City = "(" + (String.join(",", city)) + ") ";
		else
			City = null;

		// PositionType Column
		if (positiontype[0] != "")
			PositionType = "(" + (String.join(",", positiontype)) + ") ";
		else
			PositionType = null;

		// PositionLevel Column
		if (positionlevel[0] != "")
			PositionLevel = "(" + (String.join(",", positionlevel)) + ") ";
		else
			PositionLevel = null;

		System.out.println();
		if (educationlevel[0] != "") {
			String[] temp = educationlevel[0].split(",");
			for (int i = 0; i < temp.length; i++) {
				educationalLevel[Integer.parseInt(temp[i])] = 1;
			}
			EducationalLevel = Arrays.toString(educationalLevel);
			EducationalLevel = EducationalLevel.replaceAll(", ", "");
			EducationalLevel = EducationalLevel.substring(1,
					EducationalLevel.length() - 1);
		} else
			EducationalLevel = null;

		// düzenle
		if (postingdate[0] != "") {
			SimpleDateFormat dt1 = new SimpleDateFormat("yyyy-MM-dd");
			if (Integer.parseInt(postingdate[0]) == 0)
				PostingDate = null;
			else if (Integer.parseInt(postingdate[0]) == 1)
				PostingDate = "'" + dt1.format(today.getTime()) + "'";
			else if (Integer.parseInt(postingdate[0]) == 2) {
				cal.add(Calendar.DATE, -1);
				PostingDate = "'" + dt1.format(cal.getTime()) + "'" + " AND "
						+ "'" + dt1.format(today.getTime()) + "'";
			} else if (Integer.parseInt(postingdate[0]) == 3) {
				cal.add(Calendar.DATE, -3);
				PostingDate = "'" + dt1.format(cal.getTime()) + "'" + " AND "
						+ "'" + dt1.format(today.getTime()) + "'";
			} else if (Integer.parseInt(postingdate[0]) == 7) {
				cal.add(Calendar.DATE, -7);
				PostingDate = "'" + dt1.format(cal.getTime()) + "'" + " AND "
						+ "'" + dt1.format(today.getTime()) + "'";
			} else if (Integer.parseInt(postingdate[0]) == 14) {
				cal.add(Calendar.DATE, -14);
				PostingDate = "'" + dt1.format(cal.getTime()) + "'" + " AND "
						+ "'" + dt1.format(today.getTime()) + "'";
			} else if (Integer.parseInt(postingdate[0]) == 30) {
				cal.add(Calendar.DATE, -30);
				PostingDate = "'" + dt1.format(cal.getTime()) + "'" + " AND "
						+ "'" + dt1.format(today.getTime()) + "'";
			}

		} else
			PostingDate = null;

		// düzenle
		if (netsalary[0] != "") {
			NetSalary = " (" + (String.join(",", netsalary)) + ") ";
		} else
			NetSalary = null;

		departmentids = ad.filterAdverts(Experience, Sector, JobField, City,
				PositionType, PositionLevel, EducationalLevel, PostingDate,
				NetSalary, CompanyName);

		if (departmentids != null) {
			Map<Integer, Integer> ind = new LinkedHashMap<Integer, Integer>();
			for (int i = 0; i < departmentids.size(); i++) {
				ind.put(i, departmentids.get(i));
			}
			String json = null;
			json = new Gson().toJson(ind);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		}

	}
}
