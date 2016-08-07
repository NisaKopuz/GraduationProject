package com.huia.service.dao.ad;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import com.huia.bean.AdBean;
import com.huia.bean.CompanyBean;
import com.huia.service.dao.map.MapUtilities;
import com.huia.service.db.ConnectionHelper;

public class AdDAOImp implements IAdDAO {

	static ConnectionHelper conn = new ConnectionHelper();

	public boolean addAdvert(AdBean advert) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		boolean status = false;

		String query = "INSERT INTO tblAdvert(Title,"
				+ "JobField1, JobField2, JobField3, JobField4, JobField5,"
				+ "PositionType, Qualifications,"
				+ "Sector1, Sector2, Sector3, Sector4, Sector5,"
				+ "PositionLevel,NumberOfPersonnel,ShowNumberOfPersonnel,"
				+ "NetSalary,ShowNetSalary,EducationalLevel,"
				+ "LastPosition1,LastPosition2,LastPosition3,LastPosition4,LastPosition5,"
				+ "LastSector1,LastSector2,LastSector3,LastSector4,LastSector5,"
				+ "University1, University2,University3,University4,University5,"
				+ "UniversitySection1,UniversitySection2,UniversitySection3,UniversitySection4,UniversitySection5,"
				+ "MilitaryStatus,Experience,"
				+ "Gender,City,MinAge,MaxAge,DrivingLicence,"
				+ "ForeignLanguage1,ForeignLanguage2,ForeignLanguage3,ForeignLanguage4,ForeignLanguage5,"
				+ "PostingDate,UpdatedDate,LastApplyDate,DepartmentId,Status"
				+ ") VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		stmt = conn.getStatement(con, query);

		try {

			stmt.setString(1, advert.getTitle());
			stmt.setString(2, advert.getJobfield1());
			stmt.setString(3, advert.getJobfield2());
			stmt.setString(4, advert.getJobfield3());
			stmt.setString(5, advert.getJobfield4());
			stmt.setString(6, advert.getJobfield5());
			stmt.setString(7, advert.getPositiontype());
			stmt.setString(8, advert.getQualifications());
			stmt.setString(9, advert.getSector1());
			stmt.setString(10, advert.getSector2());
			stmt.setString(11, advert.getSector3());
			stmt.setString(12, advert.getSector4());
			stmt.setString(13, advert.getSector5());
			stmt.setString(14, advert.getPositionlevel());
			stmt.setInt(15, advert.getNumberofpersonnel());
			stmt.setBoolean(16, advert.isShownumberofpersonnel());
			stmt.setString(17, advert.getNetsalary());
			stmt.setBoolean(18, advert.isShownetsalary());
			stmt.setString(19, advert.getEducationallevel());
			stmt.setString(20, advert.getLastposition1());
			stmt.setString(21, advert.getLastposition2());
			stmt.setString(22, advert.getLastposition3());
			stmt.setString(23, advert.getLastposition4());
			stmt.setString(24, advert.getLastposition5());
			stmt.setString(25, advert.getLastsector1());
			stmt.setString(26, advert.getLastsector2());
			stmt.setString(27, advert.getLastsector3());
			stmt.setString(28, advert.getLastsector4());
			stmt.setString(29, advert.getLastsector5());
			stmt.setString(30, advert.getUniversity1());
			stmt.setString(31, advert.getUniversity2());
			stmt.setString(32, advert.getUniversity3());
			stmt.setString(33, advert.getUniversity4());
			stmt.setString(34, advert.getUniversity5());
			stmt.setString(35, advert.getUniversitySection1());
			stmt.setString(36, advert.getUniversitySection2());
			stmt.setString(37, advert.getUniversitySection3());
			stmt.setString(38, advert.getUniversitySection4());
			stmt.setString(39, advert.getUniversitySection5());
			stmt.setString(40, advert.getMilitaryStatus());
			stmt.setString(41, advert.getExperience());
			stmt.setString(42, advert.getGender());
			stmt.setString(43, advert.getCity());
			stmt.setInt(44, advert.getMinage());
			stmt.setInt(45, advert.getMaxage());
			stmt.setString(46, advert.getDrivinglicence());
			stmt.setString(47, advert.getForeignlanguage1());
			stmt.setString(48, advert.getForeignlanguage2());
			stmt.setString(49, advert.getForeignlanguage3());
			stmt.setString(50, advert.getForeignlanguage4());
			stmt.setString(51, advert.getForeignlanguage5());
			stmt.setDate(52, (Date) advert.getPostingdate());
			stmt.setDate(53, (Date) advert.getUpdateddate());
			stmt.setDate(54, (Date) advert.getLastapplydate());
			stmt.setInt(55, advert.getDepartmentId());
			stmt.setBoolean(56, true);

			stmt.executeUpdate();

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally {

			conn.closeStatement(stmt);
			conn.closeConnection(con);
		}
		return status;

	}

	public String getNameFromDatabase(String tablename, int id) {
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String query = "SELECT * FROM " + tablename + " WHERE id = ?";
		stmt = conn.getStatement(con, query);
		
		try {
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			while (rs.next()) {
				return rs.getString(2);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			conn.closeResultSet(rs);
			conn.closeStatement(stmt);
			conn.closeConnection(con);
		}

		return null;
	}

	public String showDepartments(int companyId) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String query = "SELECT DepartmentName,DepartmentId FROM tblDepartment WHERE CompanyId=?";
		stmt = conn.getStatement(con, query);

		String list = null;
		int departmentid = 0;
		list = "<select class=\"form-control\" id=\"city\" name=\"departments\" onchange=\"getMap(value)\" >";
		list += "<option selected disabled>Seçiniz</option>";
		try {
			stmt.setInt(1, companyId);
			rs = stmt.executeQuery();
			while (rs.next()) {
				departmentid = rs.getInt("DepartmentId");
				list += "<option value=\"" + departmentid + "\">"
						+ rs.getString("DepartmentName") + "</option>";
			}

			list += "</select>";

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally {

			conn.closeStatement(stmt);
			conn.closeConnection(con);
			conn.closeResultSet(rs);
		}
		return list;
	}

	public String showDepartmentsWithSelected(int companyId, int dptid) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String query = "SELECT DepartmentName,DepartmentId FROM tblDepartment WHERE CompanyId=?";
		stmt = conn.getStatement(con, query);

		String list = null;
		int departmentid = 0;
		list = "<select class=\"form-control\" id=\"departments\" name=\"departments\" onchange=\"getMap(value)\" disabled>";
		list += "<option value=\"\"></option>";
		try {
			stmt.setInt(1, companyId);
			rs = stmt.executeQuery();
			while (rs.next()) {
				departmentid = rs.getInt("DepartmentId");
				if (departmentid == dptid)
					list += "<option  value=\"" + departmentid + "\" selected>"
							+ rs.getString("DepartmentName") + "</option>";
				else
					list += "<option value=\"" + departmentid + "\">"
							+ rs.getString("DepartmentName") + "</option>";
			}

			list += "</select>";

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally {

			conn.closeStatement(stmt);
			conn.closeConnection(con);
			conn.closeResultSet(rs);
		}
		return list;
	}

	public int getCompanyId(String username) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int companyId = 0;
		String query = "SELECT CompanyId FROM tblCompanyInformation WHERE UserName=?";
		stmt = conn.getStatement(con, query);
		try {
			stmt.setString(1, username);
			rs = stmt.executeQuery();
			while (rs.next()) {
				companyId = rs.getInt("CompanyId");
			}

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally {

			conn.closeStatement(stmt);
			conn.closeConnection(con);
			conn.closeResultSet(rs);
		}
		return companyId;

	}

	public String getCompanyName(int companyid) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String companyname = null;

		String query = "SELECT Name FROM tblCompanyInformation WHERE CompanyId=?";
		stmt = conn.getStatement(con, query);
		try {
			stmt.setInt(1, companyid);
			rs = stmt.executeQuery();
			while (rs.next()) {
				companyname = rs.getString("Name");
			}

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally {

			conn.closeStatement(stmt);
			conn.closeConnection(con);
			conn.closeResultSet(rs);
		}
		return companyname;

	}

	public ArrayList<Integer> getDepartmentIdWithCompanyId(String companyId) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;

		ArrayList<Integer> departmentids = new ArrayList<Integer>();

		String query = "SELECT DepartmentId  FROM tblDepartment WHERE CompanyId=?";
		stmt = conn.getStatement(con, query);
		try {
			stmt.setInt(1, Integer.parseInt(companyId));
			rs = stmt.executeQuery();
			while (rs.next()) {
				departmentids.add(rs.getInt("DepartmentId"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conn.closeResultSet(rs);
			conn.closeStatement(stmt);
			conn.closeConnection(con);

		}
		return departmentids;
	}

	public ArrayList<Integer> getDepartmentId(String username) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int companyId = getCompanyId(username);

		ArrayList<Integer> departmentids = new ArrayList<Integer>();

		String query = "SELECT DepartmentId  FROM tblDepartment WHERE CompanyId=?";
		stmt = conn.getStatement(con, query);
		try {
			stmt.setInt(1, companyId);
			rs = stmt.executeQuery();
			while (rs.next()) {

				departmentids.add(rs.getInt("DepartmentId"));

			}

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally {

			conn.closeStatement(stmt);
			conn.closeConnection(con);
			conn.closeResultSet(rs);
		}
		return departmentids;
	}

	public ArrayList<Integer> getAdvertIds(int departmentid) {

		ArrayList<Integer> advertids = new ArrayList<Integer>();

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String query = "SELECT AdId FROM tblAdvert WHERE  DepartmentId=?";
		try {

			stmt = conn.getStatement(con, query);

			stmt.setInt(1, departmentid);
			rs = stmt.executeQuery();
			while (rs.next()) {

				advertids.add(rs.getInt("AdId"));

			}

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally

		{
			conn.closeResultSet(rs);
			conn.closeStatement(stmt);
			conn.closeConnection(con);

		}
		return advertids;

	}

	public ArrayList<Integer> getAllActiveDepartmentId() {
		ArrayList<Integer> departmentids = new ArrayList<Integer>();

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String query = "SELECT DepartmentId FROM tblAdvert WHERE  Status=?";
		try {

			stmt = conn.getStatement(con, query);

			stmt.setBoolean(1, true);
			rs = stmt.executeQuery();
			while (rs.next()) {

				departmentids.add(rs.getInt("DepartmentId"));

			}

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally

		{
			conn.closeResultSet(rs);
			conn.closeStatement(stmt);
			conn.closeConnection(con);

		}
		return departmentids;

	}

	public ArrayList<Integer> getActiveAdvertId(int departmentid) {

		ArrayList<Integer> advertids = new ArrayList<Integer>();

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String query = "SELECT AdId,Status FROM tblAdvert WHERE  DepartmentId=?";
		try {

			stmt = conn.getStatement(con, query);

			stmt.setInt(1, departmentid);
			rs = stmt.executeQuery();
			while (rs.next()) {
				if (rs.getBoolean("Status"))
					advertids.add(rs.getInt("AdId"));

			}

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally

		{
			conn.closeResultSet(rs);
			conn.closeStatement(stmt);
			conn.closeConnection(con);

		}
		return advertids;

	}
	public ArrayList<Integer> getReferencesAdvertId(int departmentid) {

		ArrayList<Integer> advertids = new ArrayList<Integer>();

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
/*
		String query = "SELECT tblReferences.AdId,tblAdvert.Status FROM tblAdvert INNER JOIN tblReferences ON tblAdvert.AdId=tblReferences.AdId WHERE  DepartmentId=?";
		*/
		String query="SELECT AdId FROM tblAdvert WHERE DepartmentId=? ";

		try {

			stmt = conn.getStatement(con, query);

			stmt.setInt(1, departmentid);
			rs = stmt.executeQuery();
			while (rs.next()) {
				
					advertids.add(rs.getInt("AdId"));

			}
		
			

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally

		{
			conn.closeResultSet(rs);
			conn.closeStatement(stmt);
			conn.closeConnection(con);

		}
		return advertids;

	}

	public ArrayList<String> getAdInformation(int advertid) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;

		ArrayList<String> adinformation = new ArrayList<String>();

		String query = "SELECT *  FROM tblAdvert WHERE  AdId=?";

		stmt = conn.getStatement(con, query);
		try {
			stmt.setInt(1, advertid);
			rs = stmt.executeQuery();
			DateFormat df = new SimpleDateFormat("MM/dd/yyyy");

			while (rs.next()) {

				adinformation.add(rs.getString("Title"));
				adinformation.add(df.format(rs.getDate("PostingDate")));
				adinformation.add(df.format(rs.getDate("LastApplyDate")));
				adinformation
						.add(Integer.toString(rs.getInt("NumberOfPersonnel")));
				adinformation.add(rs.getString("Sector"));
				adinformation.add(rs.getString("PositionType"));
				adinformation.add(rs.getString("Description"));
				adinformation.add(rs.getString("Qualifications"));
				adinformation.add(rs.getString("JobField"));
				adinformation.add(rs.getString("PositionLevel"));
				adinformation.add(rs.getString("Experience"));
				adinformation.add(rs.getString("EducationalLevel"));

			}

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally {

			conn.closeStatement(stmt);
			conn.closeConnection(con);
			conn.closeResultSet(rs);
		}
		return adinformation;
	}

	public boolean deleteAdvert(String advertid) {
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		boolean status = false;

		String query = "DELETE FROM tblAdvert WHERE AdId=?";
		stmt = conn.getStatement(con, query);
		try {

			stmt.setInt(1, (Integer.parseInt(advertid)));
			status = stmt.execute();

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally {

			conn.closeStatement(stmt);
			conn.closeConnection(con);
		}
		return status;
	}

	public boolean updateAdvert(AdBean advert, String advertid) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		boolean status = false;

		String query = "UPDATE tblAdvert SET"
				+ " Title=?, JobField1=?, JobField2=?, JobField3=?, JobField4=?, JobField5=?,"
				+ "PositionType=?, Qualifications=?,"
				+ "Sector1=?, Sector2=?, Sector3=?, Sector4=?, Sector5=?,"
				+ "PositionLevel=?,NumberOfPersonnel=?,ShowNumberOfPersonnel=?,"
				+ "NetSalary=?,ShowNetSalary=?,EducationalLevel=?,"
				+ "LastPosition1=?,LastPosition2=?,LastPosition3=?,LastPosition4=?,LastPosition5=?,"
				+ "LastSector1=?,LastSector2=?,LastSector3=?,LastSector4=?,LastSector5=?,"
				+ "University1=?, University2=?,University3=?,University4=?,University5=?,"
				+ "UniversitySection1=?,UniversitySection2=?,UniversitySection3=?,UniversitySection4=?,UniversitySection5=?,"
				+ "MilitaryStatus=?,Experience=?,"
				+ "Gender=?,City=?,MinAge=?,MaxAge=?,DrivingLicence=?,"
				+ "ForeignLanguage1=?,ForeignLanguage2=?,ForeignLanguage3=?,ForeignLanguage4=?,ForeignLanguage5=?,"
				+ "PostingDate=?,UpdatedDate=?,LastApplyDate=?,DepartmentId=? WHERE AdId=?";

		stmt = conn.getStatement(con, query);

		try {

			stmt.setString(1, advert.getTitle());
			stmt.setString(2, advert.getJobfield1());
			stmt.setString(3, advert.getJobfield2());
			stmt.setString(4, advert.getJobfield3());
			stmt.setString(5, advert.getJobfield4());
			stmt.setString(6, advert.getJobfield5());
			stmt.setString(7, advert.getPositiontype());
			stmt.setString(8, advert.getQualifications());
			stmt.setString(9, advert.getSector1());
			stmt.setString(10, advert.getSector2());
			stmt.setString(11, advert.getSector3());
			stmt.setString(12, advert.getSector4());
			stmt.setString(13, advert.getSector5());
			stmt.setString(14, advert.getPositionlevel());
			stmt.setInt(15, advert.getNumberofpersonnel());
			stmt.setBoolean(16, advert.isShownumberofpersonnel());
			stmt.setString(17, advert.getNetsalary());
			stmt.setBoolean(18, advert.isShownetsalary());
			stmt.setString(19, advert.getEducationallevel());
			stmt.setString(20, advert.getLastposition1());
			stmt.setString(21, advert.getLastposition2());
			stmt.setString(22, advert.getLastposition3());
			stmt.setString(23, advert.getLastposition4());
			stmt.setString(24, advert.getLastposition5());
			stmt.setString(25, advert.getLastsector1());
			stmt.setString(26, advert.getLastsector2());
			stmt.setString(27, advert.getLastsector3());
			stmt.setString(28, advert.getLastsector4());
			stmt.setString(29, advert.getLastsector5());
			stmt.setString(30, advert.getUniversity1());
			stmt.setString(31, advert.getUniversity2());
			stmt.setString(32, advert.getUniversity3());
			stmt.setString(33, advert.getUniversity4());
			stmt.setString(34, advert.getUniversity5());
			stmt.setString(35, advert.getUniversitySection1());
			stmt.setString(36, advert.getUniversitySection2());
			stmt.setString(37, advert.getUniversitySection3());
			stmt.setString(38, advert.getUniversitySection4());
			stmt.setString(39, advert.getUniversitySection5());
			stmt.setString(40, advert.getMilitaryStatus());
			stmt.setString(41, advert.getExperience());
			stmt.setString(42, advert.getGender());
			stmt.setString(43, advert.getCity());
			stmt.setInt(44, advert.getMinage());
			stmt.setInt(45, advert.getMaxage());
			stmt.setString(46, advert.getDrivinglicence());
			stmt.setString(47, advert.getForeignlanguage1());
			stmt.setString(48, advert.getForeignlanguage2());
			stmt.setString(49, advert.getForeignlanguage3());
			stmt.setString(50, advert.getForeignlanguage4());
			stmt.setString(51, advert.getForeignlanguage5());
			stmt.setDate(52, (Date) advert.getPostingdate());
			stmt.setDate(53, (Date) advert.getUpdateddate());
			stmt.setDate(54, (Date) advert.getLastapplydate());
			stmt.setInt(55, advert.getDepartmentId());
			stmt.setInt(56, Integer.parseInt(advertid));

			status = stmt.execute();

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally {

			conn.closeStatement(stmt);
			conn.closeConnection(con);
		}
		return status;
	}

	public String getSubmitModal(int adid, String username) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String advertname = "";
		String qualifications = "";
		String companyname = "";

		String query = "SELECT Title,Qualifications,DepartmentId FROM tblAdvert WHERE adId=?";
		stmt = conn.getStatement(con, query);

		try {
			stmt.setInt(1, adid);
			rs = stmt.executeQuery();

			while (rs.next()) {
				advertname = rs.getString(1);
				qualifications = rs.getString(2);
				companyname = getCompanyNameWithDepartmentId(rs.getInt(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conn.closeResultSet(rs);
			conn.closeStatement(stmt);
			conn.closeConnection(con);
		}

		String modal = "<div class=\"modal-dialog\">"
				+ "<div class=\"modal-content\">"
				+ "<form  method=\"POST\" action=\"upload\" enctype=\"multipart/form-data\" >"
				+ "<div class=\"modal-body\">"
				+ "<div class=\"container-fluid\">" + "<br>"
				+ "<input type=\"hidden\" name=\"AdId\" value=\"" + adid + "\">"
				+ "<div class=\"row\">" + "<div class=\"col-xs-12\">" + "<h3>"
				+ advertname + "</h3>" + "</div>" + "</div>"
				+ "<div class=\"row\">" + "<div class=\"col-xs-12\">" + "<h5>"
				+ companyname + "</h5>" + "</div>" + "</div>"
				+ "<div class=\"row\">" + "<div class=\"col-xs-12\">" + "<h6>"
				+ qualifications + "</h6>" + "</div>" + "</div>" + "<br><br>"
				+ "<div class=\"row\">" + "<div class=\"col-xs-12\">"
				+ "<div class=\"checkbox\">"
				+ "<label><input type=\"checkbox\" id=\"addMessage\" name=\"addMessage\" onclick=\"enable_text(this.checked)\" value=\"1\">Ön yazı eklemek istiyorum.</label>"
				+ "</div>" + "</div> </div>"
				+ "<div class=\"row\"> <div class=\"col-xs-12\">"
				+ "<div class=\"checkbox\">"
				+ "<label><input type=\"checkbox\" id=\"addCv\" name=\"addCv\" onclick=\"enable_cv(this.checked)\" value=\"1\">Özgeçmiş eklemek istiyorum.<br>"
				+ "<div class=\"fileinput fileinput-new\" data-provides=\"fileinput\"><span class=\"btn btn-default btn-file\"><span>Dosya Seç</span>"
				+ "<input type=\"file\" onchange=\"fileName()\" id=\"file\" name=\"file\"  accept=\".doc,.docx,.xml,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document\" disabled>"
				+ "</span><span class=\"fileinput-filename\"></span><span id=\"chosenFilePath\" class=\"fileinput-new\">Dosya seçilmedi.</span></div></label>"
				+ "</div>" + "</div>" + "</div>" + "</div>"
				+ "<div class=\"container-fluid\">" + "<br>"
				+ "<div class=\"form-group\">"
				+ "<label for=\"message\">Önyazı:</label>"
				+ "<textarea class=\"form-control\" rows=\"5\" id=\"message\" name=\"message\" disabled></textarea>"
				+ "</div>" + "</div>" + "</div>"
				+ "<div class=\"modal-footer\">"
				+ "<input type=\"submit\" class=\"btn btn-success\" value=\"Başvuruyu Gerçekleştir\" class=\"close\" onclick=\"commitReference("
				+ adid + ",\'" + companyname + "\')\"/>"
				// + "<button type=\"button\" class=\"btn btn-success\"
				// onclick=\"commitReference(" + adid + ",\"" + companyname +
				// "\")\">Ba�vuruyu Ger�ekle�tir</button>"
				+ "<button type=\"button\" class=\"btn btn-danger\" onclick=\"cancelReference()\">Vazgeç</button>"
				+ "</div>" + "</form></div>" + "</div>";

		return modal;
	}

	public void addReference(String username, String companyname,
			String messageuser, int adid) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;

		java.util.Date date = Calendar.getInstance().getTime();
		java.sql.Date referencesdate = new java.sql.Date(date.getTime());
		String query = "INSERT INTO tblReferences(UserName,ReferencesDate,CompanyName,PositionName,ReferencesAction,LetterStatus,MessageEmployer,AdId,LetterStatusEmployer,UserScore)"
				+ " VALUES(?,?,?,?,?,?,?,?,?,?)";

		stmt = conn.getStatement(con, query);

		try {

			stmt.setString(1, username);
			stmt.setDate(2, (Date) referencesdate);
			stmt.setString(3, companyname);
			stmt.setString(4, "posname"); // ne olacak?
			stmt.setInt(5, 0);
			stmt.setInt(6, 0);
			stmt.setString(7, messageuser);
			stmt.setInt(8, adid);
			stmt.setInt(9, 1);
			stmt.setInt(10, 0);

			if (stmt.executeUpdate() != 0) {

				AddScoreToReferencesTable(username);
			}

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally {

			conn.closeStatement(stmt);
			conn.closeConnection(con);
		}

	}

	public ArrayList<Integer> getAllDepartmentId() {
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;

		ArrayList<Integer> departmentids = new ArrayList<Integer>();

		String query = "SELECT DISTINCT DepartmentId  FROM tblDepartment ";
		stmt = conn.getStatement(con, query);
		try {

			rs = stmt.executeQuery();
			while (rs.next()) {

				departmentids.add(rs.getInt("DepartmentId"));

			}

		} catch (

		SQLException e)

		{
			e.printStackTrace();

		} finally {

			conn.closeStatement(stmt);
			conn.closeConnection(con);
			conn.closeResultSet(rs);
		}
		return departmentids;
	}

	public String getAdvertName(int adid) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String advertname = null;

		String query = "SELECT Title FROM tblAdvert WHERE AdId=?";
		stmt = conn.getStatement(con, query);
		try {
			stmt.setInt(1, adid);
			rs = stmt.executeQuery();
			while (rs.next()) {
				advertname = rs.getString(1);

			}

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally {
			conn.closeResultSet(rs);
			conn.closeStatement(stmt);
			conn.closeConnection(con);

		}
		return advertname;

	}

	public void changeStatus() throws ParseException {

		Connection con = conn.getConnection();
		PreparedStatement stmt, stmt2 = null;
		ResultSet rs = null;
		java.util.Date date = new java.util.Date();

		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, +1);
		cal.clear(Calendar.HOUR_OF_DAY);
		cal.clear(Calendar.AM_PM);
		cal.clear(Calendar.MINUTE);
		cal.clear(Calendar.SECOND);
		cal.clear(Calendar.MILLISECOND);
		date = cal.getTime();
		String query = "SELECT LastApplyDate,AdId FROM tbladvert";
		String query2 = "UPDATE tbladvert SET Status=? WHERE AdId=?";
		stmt = conn.getStatement(con, query);
		stmt2 = conn.getStatement(con, query2);

		try {

			rs = stmt.executeQuery();
			while (rs.next()) {

				if (rs.getDate("LastApplyDate").compareTo(date) <= 0) {
					stmt2.setBoolean(1, false);
					stmt2.setInt(2, rs.getInt("AdId"));
					stmt2.executeUpdate();
				}

			}
		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally {
			conn.closeResultSet(rs);
			conn.closeStatement(stmt);
			conn.closeConnection(con);

		}
	}

	public ArrayList<String> getApplicants(int adId) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;

		DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
		String getreferencesdate = "";

		ArrayList<String> applicantinformation = new ArrayList<String>();

		String query = "SELECT ReferencesDate,UserName,LetterStatusEmployer,ID FROM tblReferences WHERE AdId=? ORDER BY ReferencesDate DESC";
		stmt = conn.getStatement(con, query);
		try {
			stmt.setInt(1, adId);
			rs = stmt.executeQuery();

			while (rs.next()) {
				applicantinformation.add(Integer.toString(rs.getInt("ID")));
				getreferencesdate = df.format(rs.getDate("ReferencesDate"));
				applicantinformation.add(rs.getString("UserName"));
				applicantinformation.add(getreferencesdate);
				applicantinformation.add(
						Integer.toString(rs.getInt("LetterStatusEmployer")));

			}

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally {
			conn.closeResultSet(rs);
			conn.closeStatement(stmt);
			conn.closeConnection(con);

		}
		return applicantinformation;

	}

	public ArrayList<String> getApplicantsOrderByBonusFeature(int adId) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;

		DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
		String getreferencesdate = "";

		ArrayList<String> applicantinformation = new ArrayList<String>();

		String query = "SELECT ID,ReferencesDate,UserName,LetterStatusEmployer,UserScore FROM tblReferences WHERE AdId=?  ORDER BY UserScore DESC,ReferencesDate";
		stmt = conn.getStatement(con, query);
		try {
			stmt.setInt(1, adId);
			rs = stmt.executeQuery();

			while (rs.next()) {
				applicantinformation.add(Integer.toString(rs.getInt("ID")));
				getreferencesdate = df.format(rs.getDate("ReferencesDate"));
				applicantinformation.add(rs.getString("UserName"));
				applicantinformation.add(getreferencesdate);
				applicantinformation.add(
						Integer.toString(rs.getInt("LetterStatusEmployer")));
				applicantinformation
						.add(Integer.toString(rs.getInt("UserScore")));

			}

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally {
			conn.closeResultSet(rs);
			conn.closeStatement(stmt);
			conn.closeConnection(con);

		}
		return applicantinformation;

	}

	public int getCountReferences(int adid) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int count = 0;

		String query = "SELECT COUNT(AdId) FROM tblreferences WHERE AdId=?";
		stmt = conn.getStatement(con, query);
		try {
			stmt.setInt(1, adid);
			rs = stmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally {
			conn.closeResultSet(rs);
			conn.closeStatement(stmt);
			conn.closeConnection(con);

		}
		return count;

	}

	public String getCompanyNameWithDepartmentId(int deptid) {
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String companyname = null;
		String query = "SELECT name FROM tblcompanyinformation WHERE CompanyId = (SELECT CompanyId FROM tbldepartment WHERE DepartmentId = ?)";
		stmt = conn.getStatement(con, query);
		try {
			stmt.setInt(1, deptid);
			rs = stmt.executeQuery();
			while (rs.next()) {
				companyname = rs.getString("Name");
			}

		} catch (

		SQLException e)

		{
			e.printStackTrace();

		}
		return companyname;
	}

	public String getApplyDateForAdvert(int adid) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String applydate = null;
		DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
		String query = "SELECT PostingDate FROM tblAdvert WHERE AdId=?";
		stmt = conn.getStatement(con, query);
		try {
			stmt.setInt(1, adid);
			rs = stmt.executeQuery();
			while (rs.next()) {
				applydate = df.format(rs.getDate(1));
			}

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally {
			conn.closeResultSet(rs);
			conn.closeStatement(stmt);
			conn.closeConnection(con);

		}
		return applydate;
	}

	public void addPhoto(InputStream img, int adid, String username) {
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		java.util.Date date = Calendar.getInstance().getTime();
		java.sql.Date currentdate = new java.sql.Date(date.getTime());

		String query = "INSERT INTO tblComment(Photo,AdId,CommentDate,UserName,Text,Location)"
				+ " VALUES(?,?,?,?,?,?)";
		try {

			stmt = conn.getStatement(con, query);
			try {
				if (img != null) {
					// fetches input stream of the upload file for the blob
					// column

					stmt.setBinaryStream(1, img, img.available());
					stmt.setInt(2, adid);
					stmt.setDate(3, (Date) currentdate);
					stmt.setString(4, username);
					stmt.setString(5, "");
					stmt.setString(6, "");
					stmt.executeUpdate();

				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} catch (SQLException ex) {

			ex.printStackTrace();
		} finally {

			conn.closeStatement(stmt);
			conn.closeConnection(con);
		}

	}

	public void addComment(Date d, String text, String lct, int adid,
			String username) throws IOException {
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;

		String query = "INSERT INTO tblComment(CommentDate,Text,Location,AdId,UserName)"
				+ " VALUES(?,?,?,?,?)";

		stmt = conn.getStatement(con, query);

		try {

			stmt.setDate(1, (Date) d);
			stmt.setString(2, text);
			stmt.setString(3, lct);

			stmt.setInt(4, adid);
			stmt.setString(5, username);

			stmt.execute();

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally {

			conn.closeStatement(stmt);
			conn.closeConnection(con);
		}

	}

	// @TODO Comment fonksiyonu commentNumber == 0 ise hepsini g�sterir.
	public String getComments(int adid, int commentNumber) {
		MapUtilities mu = new MapUtilities();
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String result = "";

		String query = "SELECT * FROM tblComment WHERE AdId=? ORDER BY CommentDate DESC";
		stmt = conn.getStatement(con, query);
		try {
			stmt.setInt(1, adid);
			rs = stmt.executeQuery();
			if (commentNumber == 0) {
				while (rs.next()) {
					result += mu.prepareComments(rs.getInt(1), rs.getDate(2),
							rs.getString(3), rs.getString(4),
							rs.getBinaryStream(5), rs.getString(7));
				}
			} else {
				int k = 0;
				while (rs.next() && (k != commentNumber)) {
					result += mu.prepareComments(rs.getInt(1), rs.getDate(2),
							rs.getString(3), rs.getString(4),
							rs.getBinaryStream(5), rs.getString(7));
					k++;
				}
			}
		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally {
			conn.closeResultSet(rs);
			conn.closeStatement(stmt);
			conn.closeConnection(con);

		}
		return "<ul class=\"commentList\">" + result + "</ul>";
	}

	// @TODO Filtreleme
	public ArrayList<Integer> filterAdverts(String experience, String sector,
			String jobfield, String city, String positiontype,
			String positionlevel, String educationallevel, String postingdate,
			String netsalary, String companyname) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;

		ArrayList<Integer> departmentids = new ArrayList<Integer>();

		String query = "SELECT DepartmentId FROM tblAdvert ";
		String experienceclause = null;
		String sectorclause = null;
		String jobfieldclause = null;
		String cityclause = null;
		String positiontypeclause = null;
		String positionlevelclause = null;
		String educationallevelclause = null;
		String postingdateclause = null;
		String netsalaryclause = null;
		String companynameclause = null;

		boolean first = true; // ikinciye ge�ti�imde false

		if (experience != null) {
			if (first == true) {
				experienceclause = " WHERE (Experience = '" + experience
						+ "' ) ";
				query = query + experienceclause;
				first = false;
			} else {
				experienceclause = " AND (Experience = '" + experience + "' ) ";
				query = query + experienceclause;
			}
		}

		if (sector != null) {
			if (first == true) {
				sectorclause = " WHERE (Sector1 IN" + sector + "OR Sector2 IN"
						+ sector + "OR Sector3 IN" + sector + "OR Sector4 IN"
						+ sector + "OR Sector5 IN" + sector + ") ";
				query = query + sectorclause;
				first = false;
			} else {
				sectorclause = " AND (Sector1 IN" + sector + "OR Sector2 IN"
						+ sector + "OR Sector3 IN" + sector + "OR Sector4 IN"
						+ sector + "OR Sector5 IN" + sector + ") ";
				query = query + sectorclause;
			}
		}

		if (jobfield != null) {
			if (first == true) {
				jobfieldclause = " WHERE (JobField1 IN" + jobfield
						+ "OR JobField2 IN" + jobfield + "OR JobField3 IN"
						+ jobfield + "OR JobField4 IN" + jobfield
						+ "OR JobField5 IN" + jobfield + ") ";
				query = query + jobfieldclause;
				first = false;
			} else {
				jobfieldclause = " AND (JobField1 IN" + jobfield
						+ "OR JobField2 IN" + jobfield + "OR JobField3 IN"
						+ jobfield + "OR JobField4 IN" + jobfield
						+ "OR JobField5 IN" + jobfield + ") ";
				query = query + jobfieldclause;
			}
		}

		if (city != null) {
			if (first == true) {
				cityclause = " WHERE (DepartmentId IN (select td.DepartmentId from tbldepartmentdetails td where td.City IN("
						+ city + "))) ";
				query = query + cityclause;
				first = false;
			} else {
				cityclause = " AND (DepartmentId IN (select td.DepartmentId from tbldepartmentdetails td where td.City IN("
						+ city + "))) ";
				query = query + cityclause;
			}
		}

		if (positiontype != null) {
			if (first == true) {
				positiontypeclause = " WHERE (PositionType IN" + positiontype
						+ ") ";
				query = query + positiontypeclause;
				first = false;
			} else {
				positiontypeclause = " AND (PositionType IN" + positiontype
						+ ") ";
				query = query + positiontypeclause;
			}
		}

		if (positionlevel != null) {
			if (first == true) {
				positionlevelclause = " WHERE (PositionLevel IN" + positionlevel
						+ ") ";
				query = query + positionlevelclause;
				first = false;
			} else {
				positionlevelclause = " AND (PositionLevel IN" + positionlevel
						+ ") ";
				query = query + positionlevelclause;
			}
		}

		if (educationallevel != null) {
			if (first == true) {
				educationallevelclause = " WHERE (EducationalLevel LIKE '"
						+ educationallevel + "%') ";
				query = query + educationallevelclause;
				first = false;
			} else {
				educationallevelclause = " AND (EducationalLevel LIKE '"
						+ educationallevel + "%') ";
				query = query + educationallevelclause;
			}
		}

		if (postingdate != null) {
			if (first == true) {
				postingdateclause = " WHERE (PostingDate BETWEEN " + postingdate
						+ ") ";
				query = query + postingdateclause;
				first = false;
			} else {
				postingdateclause = " AND (PostingDate BETWEEN " + postingdate
						+ ") ";
				query = query + postingdateclause;
			}
		}

		if (netsalary != null) {
			if (first == true) {
				netsalaryclause = " WHERE (NetSalary IN" + netsalary + ") ";
				query = query + netsalaryclause;
				first = false;
			} else {
				netsalaryclause = " AND (NetSalary IN" + netsalary + ") ";
				query = query + netsalaryclause;
			}
		}

		if (companyname != null) {
			if (first == true) {
				companynameclause = " WHERE (DepartmentId IN (select td.DepartmentId from tbldepartment td"
						+ " where td.CompanyId IN (select tci.CompanyId from tblcompanyinformation tci"
						+ " where LOWER(tci.Name) LIKE LOWER('%" + companyname
						+ "%')))) ";
				query = query + companynameclause;
				first = false;
			} else {
				companynameclause = " AND (DepartmentId IN (select td.DepartmentId from tbldepartment td"
						+ " where td.CompanyId IN (select tci.CompanyId from tblcompanyinformation tci"
						+ " where LOWER(tci.Name) LIKE LOWER('%" + companyname
						+ "%')))) ";
				query = query + companynameclause;
			}
		}

		// query = query + experienceclause + sectorclause + jobfieldclause +
		// cityclause +
		// positiontypeclause + positionlevelclause + educationallevelclause +
		// postingdateclause + netsalaryclause;
		//

		System.out.println(query);

		if (first == true)
			return null;

		stmt = conn.getStatement(con, query);
		try {

			rs = stmt.executeQuery();
			while (rs.next()) {

				departmentids.add(rs.getInt("DepartmentId"));

			}

		} catch (

		SQLException e)

		{
			e.printStackTrace();

		} finally {
			conn.closeResultSet(rs);
			conn.closeStatement(stmt);
			conn.closeConnection(con);

		}
		return departmentids;
	}

	public InputStream getPhoto(int adid) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;

		InputStream inputStream = null;

		String query = "SELECT Photo FROM tblComment WHERE CommentId=? ORDER BY CommentDate DESC";
		stmt = conn.getStatement(con, query);
		try {
			stmt.setInt(1, adid);
			rs = stmt.executeQuery();

			while (rs.next()) {

				inputStream = rs.getBinaryStream("Photo");

			}
		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally {
			conn.closeResultSet(rs);
			conn.closeStatement(stmt);
			conn.closeConnection(con);

		}
		return inputStream;

	}

	public void AddScoreToReferencesTable(String username) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int score = 0;
		String getscorequery = "SELECT Score FROM tblscore WHERE UserName=?";
		String putReferencestablequery = "UPDATE tblreferences SET UserScore=? WHERE UserName=?";
		stmt = conn.getStatement(con, getscorequery);

		try

		{
			stmt.setString(1, username);

			rs = stmt.executeQuery();
			while (rs.next()) {
				score = rs.getInt("Score");
			}

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally

		{

			conn.closeStatement(stmt);
			conn.closeResultSet(rs);
		}

		// second state
		if (score != 0) {
			stmt = conn.getStatement(con, putReferencestablequery);
			try

			{
				stmt.setInt(1, score);
				stmt.setString(2, username);

				stmt.executeUpdate();
			} catch (

			SQLException e)

			{

				e.printStackTrace();

			} finally

			{

				conn.closeStatement(stmt);
				conn.closeConnection(con);

			}
		} else
			conn.closeConnection(con);

	}
	
	
	// Didem
	public void AddCompanyDetails(CompanyBean cb){
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		
		String query = "INSERT INTO tblCompanyDetails (CompanyName,CompanyId,CompanyHistory,CompanyWebsite,CompanyCountry,CompanyCity,CompanyTown,CompanyDistrict) VALUES(?,?,?,?,?,?,?,?)";
		

		
		try {

			con.setAutoCommit(false);
			stmt = conn.getStatement(con, query);
			
			stmt.setString(1, cb.getName());
			stmt.setInt(2, cb.getCompanyID());
			stmt.setString(3, cb.getCompanyHistory());
			stmt.setString(4, cb.getCompanyWebsite());
			stmt.setString(5, cb.getCompanyCountry());
			stmt.setString(6, cb.getCompanyCity());
			stmt.setString(7, cb.getCompanyTown());
			stmt.setString(8, cb.getCompanyDistrict());

			stmt.executeUpdate();
			con.commit();

		} catch (

		SQLException e)

		{

			e.printStackTrace();

			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

		} finally {
			conn.closeConnection(con);
			conn.closeStatement(stmt);

		}
		
		
	}
}
