package com.huia.servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.huia.bean.AdBean;
import com.huia.service.dao.ad.AdDAOImp;

/**
 * Servlet implementation class UpdateAdvert
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/UpdateAdvert",
		"/updateadvert" })
public class UpdateAdvert extends HttpServlet {

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

		AdBean advertbean = new AdBean();
		AdDAOImp addao = new AdDAOImp();
		String[] jobfield = request
				.getParameterValues("jobfield-multiple-selected");
		String[] sectors = request
				.getParameterValues("sector-multiple-selected");
		String[] lastposition = request
				.getParameterValues("pastpositions-multiple-selected");
		String[] lastsector = request
				.getParameterValues("pastsectors-multiple-selected");
		String[] university = request
				.getParameterValues("university-multiple-selected");
		String[] universitysection = request
				.getParameterValues("universitysection-multiple-selected");
		String[] lang = request.getParameterValues("lang-multiple-selected");
		String educationallevel = "";
		String militarystatus = "";
		String adid = request.getParameter("adid");


		boolean shownumberofpersonnel = (request
				.getParameter("numberofpersonnelcheckbox") == null) ? false
						: true;

		boolean shownetsalarycheckbox = (request
				.getParameter("netsalarycheckbox") == null) ? false : true;

		educationallevel = educationallevel
				+ ((request.getParameter("psstudent") == null) ? "0" : "1");
		educationallevel = educationallevel
				+ ((request.getParameter("psgraduated") == null) ? "0" : "1");
		educationallevel = educationallevel
				+ ((request.getParameter("hsstudent") == null) ? "0" : "1");
		educationallevel = educationallevel
				+ ((request.getParameter("hsgraduated") == null) ? "0" : "1");
		educationallevel = educationallevel
				+ ((request.getParameter("vsstudent") == null) ? "0" : "1");
		educationallevel = educationallevel
				+ ((request.getParameter("vsgraduated") == null) ? "0" : "1");
		educationallevel = educationallevel
				+ ((request.getParameter("ugstudent") == null) ? "0" : "1");
		educationallevel = educationallevel
				+ ((request.getParameter("uggraduated") == null) ? "0" : "1");
		educationallevel = educationallevel
				+ ((request.getParameter("pgstudent") == null) ? "0" : "1");
		educationallevel = educationallevel
				+ ((request.getParameter("pggraduated") == null) ? "0" : "1");
		educationallevel = educationallevel
				+ ((request.getParameter("phstudent") == null) ? "0" : "1");
		educationallevel = educationallevel
				+ ((request.getParameter("phgraduated") == null) ? "0" : "1");
		educationallevel = educationallevel
				+ ((request.getParameter("upperph") == null) ? "0" : "1");

		militarystatus = militarystatus
				+ ((request.getParameter("msperformed") == null) ? "0" : "1");
		militarystatus = militarystatus
				+ ((request.getParameter("msprivileged") == null) ? "0" : "1");
		militarystatus = militarystatus
				+ ((request.getParameter("msnotperformed") == null) ? "0"
						: "1");
		militarystatus = militarystatus
				+ ((request.getParameter("msprobated") == null) ? "0" : "1");

String exp[]=request.getParameterValues("exp");
		
		if(exp.length>0){
			
			if(exp[0].equals("expsame"))
				advertbean.setExperience("Farketmez");
			else if(exp[0].equals("notexp"))
				advertbean.setExperience("Tecrübesiz");
			else
				advertbean.setExperience("Tecrübeli");
			
			
		}
		else 
			advertbean.setExperience("");
		
		String gender[]=request.getParameterValues("gender");
		
		if(gender.length>0)
		{
			if(gender[0].equals("gendersame"))
				advertbean.setGender("Farketmez");
			else if(gender[0].equals("genderwoman"))
				advertbean.setGender("Kadın");
			else
				advertbean.setGender("Erkek");
			
			
			
		}
		else
			advertbean.setGender("");
		
			
		


		advertbean.setTitle(request.getParameter("title"));

		try {
			if (jobfield[0] != null)
				advertbean.setJobfield1(jobfield[0]);
			if (jobfield[1] != null)
				advertbean.setJobfield2(jobfield[1]);
			if (jobfield[2] != null)
				advertbean.setJobfield3(jobfield[2]);
			if (jobfield[3] != null)
				advertbean.setJobfield4(jobfield[3]);
			if (jobfield[4] != null)
				advertbean.setJobfield5(jobfield[4]);
		} catch (ArrayIndexOutOfBoundsException aioobe) {

		}
		;
		try {
			if (sectors[0] != null)
				advertbean.setSector1(sectors[0]);
			if (sectors[1] != null)
				advertbean.setSector2(sectors[1]);
			if (sectors[2] != null)
				advertbean.setSector3(sectors[2]);
			if (sectors[3] != null)
				advertbean.setSector4(sectors[3]);
			if (sectors[4] != null)
				advertbean.setSector5(sectors[4]);
		} catch (ArrayIndexOutOfBoundsException aioobe) {

		}
		;
		try {

			if (lastposition != null) {
				if (lastposition[0] != null)
					advertbean.setLastposition1(lastposition[0]);
				if (lastposition[1] != null)
					advertbean.setLastposition2(lastposition[1]);
				if (lastposition[2] != null)
					advertbean.setLastposition3(lastposition[2]);
				if (lastposition[3] != null)
					advertbean.setLastposition4(lastposition[3]);
				if (lastposition[4] != null)
					advertbean.setLastposition5(lastposition[4]);
			}
		} catch (ArrayIndexOutOfBoundsException aioobe) {

		}
		;
		try {

			if (lastsector != null) {
				if (lastsector[0] != null)
					advertbean.setLastsector1(lastsector[0]);
				if (lastsector[1] != null)
					advertbean.setLastsector2(lastsector[1]);
				if (lastsector[2] != null)
					advertbean.setLastsector3(lastsector[2]);
				if (lastsector[3] != null)
					advertbean.setLastsector4(lastsector[3]);
				if (lastsector[4] != null)
					advertbean.setLastsector5(lastsector[4]);
			}
		} catch (ArrayIndexOutOfBoundsException aioobe) {

		}
		;
		try {

			if (university != null) {
				if (university[0] != null)
					advertbean.setUniversity1(university[0]);
				if (university[1] != null)
					advertbean.setUniversity2(university[1]);
				if (university[2] != null)
					advertbean.setUniversity3(university[2]);
				if (university[3] != null)
					advertbean.setUniversity4(university[3]);
				if (university[4] != null)
					advertbean.setUniversity5(university[4]);
			}
		} catch (ArrayIndexOutOfBoundsException aioobe) {

		}
		;
		try {
			if (universitysection != null) {
				if (universitysection[0] != null)
					advertbean.setUniversitySection1(universitysection[0]);
				if (universitysection[1] != null)
					advertbean.setUniversitySection2(universitysection[1]);
				if (universitysection[2] != null)
					advertbean.setUniversitySection3(universitysection[2]);
				if (universitysection[3] != null)
					advertbean.setUniversitySection4(universitysection[3]);
				if (universitysection[4] != null)
					advertbean.setUniversitySection5(universitysection[4]);
			}
		} catch (ArrayIndexOutOfBoundsException aioobe) {

		}
		;
		try {
			if (lang != null) {
				if (lang[0] != null)
					advertbean.setForeignlanguage1(lang[0]);
				if (lang[1] != null)
					advertbean.setForeignlanguage2(lang[1]);
				if (lang[2] != null)
					advertbean.setForeignlanguage3(lang[2]);
				if (lang[3] != null)
					advertbean.setForeignlanguage4(lang[3]);
				if (lang[4] != null)
					advertbean.setForeignlanguage5(lang[4]);
			}
		} catch (ArrayIndexOutOfBoundsException aioobe) {

		}
		;

		advertbean.setPositiontype(request.getParameter("positiontype"));
		advertbean.setQualifications(request.getParameter("qualifications"));

		advertbean.setPositionlevel(request.getParameter("positionlevel"));
		advertbean.setNumberofpersonnel(
				Integer.parseInt(request.getParameter("numberofpersonnel")));
		advertbean.setShownumberofpersonnel(shownumberofpersonnel);
		advertbean.setNetsalary(request.getParameter("netsalary"));
		advertbean.setShownetsalary(shownetsalarycheckbox);
		advertbean.setEducationallevel(educationallevel);

		advertbean.setMilitaryStatus(militarystatus);
		if (request.getParameter("province") != null)
			advertbean.setCity(request.getParameter("province"));
		else
			advertbean.setCity("0");

		if (request.getParameter("minage") != ""
				&& request.getParameter("maxage") != "") {
			advertbean.setMinage(
					Integer.parseInt(request.getParameter("minage")));
			advertbean.setMaxage(
					Integer.parseInt(request.getParameter("maxage")));
		} else {
			advertbean.setMinage(0);
			advertbean.setMaxage(0);
		}
		if (request.getParameter("dlicence") != null)
			advertbean.setDrivinglicence(request.getParameter("dlicence"));
		else
			advertbean.setDrivinglicence("");

		System.out.println(request.getParameter("departments"));
		advertbean.setDepartmentId(
				Integer.parseInt(request.getParameter("departments")));

		try {
			java.util.Date date = Calendar.getInstance().getTime();
			java.util.Date lastapplydate = new SimpleDateFormat("dd/MM/yyyy")
					.parse(request.getParameter("lastapplydate"));

			java.util.Date applydate = new SimpleDateFormat("dd/MM/yyyy")
					.parse(request.getParameter("lastapplydate"));

			java.sql.Date sqlapplydate = new java.sql.Date(applydate.getTime());

			java.sql.Date sqlupdateddate = new java.sql.Date(date.getTime());
			java.sql.Date sqllastapplydate = new java.sql.Date(
					lastapplydate.getTime());

			advertbean.setLastapplydate(sqllastapplydate);
			advertbean.setPostingdate(sqlapplydate);
			advertbean.setUpdateddate(sqlupdateddate);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		boolean status = addao.updateAdvert(advertbean, adid);
		if (!status)
			response.sendRedirect("/HaritaUzerindeIsArama/employerhome.jsp");
		else
			System.out.println("İlan güncellenemedi.");

	}

}
