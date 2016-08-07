package com.huia.service.dao.map;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.huia.bean.AdBean;
import com.huia.bean.DepartmentBean;
import com.huia.service.db.ConnectionHelper;
import com.mysql.jdbc.Statement;

public class MapDAOImp implements IMapDAO {

	static ConnectionHelper conn = new ConnectionHelper();

	@Override
	public void addDepartment(DepartmentBean dept, String city, String town) {
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int lastid;
		String query = "INSERT INTO tblDepartment(Coords,DepartmentName,CompanyId) VALUES(?,?,?)";
		String query2 = "INSERT INTO tblDepartmentDetails(DepartmentId, City, Town) VALUES(?,?,?)";
		
		try {
			stmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			stmt.setString(1, dept.getCoords());
			stmt.setString(2, dept.getDepartmentname());
			stmt.setInt(3, dept.getCompanyid());
			lastid = stmt.executeUpdate();
			
			rs = stmt.getGeneratedKeys();
			if (rs != null && rs.next()) {
			    lastid = rs.getInt(1);
			}
			
			System.out.println(lastid);
			conn.closeStatement(stmt);
			
			stmt = conn.getStatement(con, query2);
			stmt.setInt(1, lastid);
			stmt.setInt(2, Integer.parseInt(city));
			stmt.setString(3, town);
			stmt.executeUpdate();
			
		} catch (SQLException e1) {
			
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			conn.closeConnection(con);
			conn.closeStatement(stmt);
			conn.closeResultSet(rs);

		}
	}

	@Override
	public String getAdListWithDepartmentId(int deptid, String username)
			throws SQLException {
		MapUtilities mu = new MapUtilities();
		Connection con = conn.getConnection();
		con.setAutoCommit(false);
		PreparedStatement stmt = null;
		PreparedStatement stmt2 = null;
		ResultSet rs = null;
		String query = "SELECT adid, title FROM tblAdvert WHERE DepartmentId = ?";
		String dnamequery = "SELECT departmentname FROM tbldepartment WHERE DepartmentId = ?";
		String cnamequery = "SELECT name FROM tblcompanyinformation WHERE CompanyId = (SELECT CompanyId FROM tbldepartment WHERE DepartmentId = ?)";
		String cname = null;
		String dname = null;
		String list = null;

		stmt = conn.getStatement(con, cnamequery);
		stmt2 = conn.getStatement(con, dnamequery);

		try {
			stmt.setInt(1, deptid);
			stmt2.setInt(1, deptid);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

		rs = conn.getResultSet(stmt);

		try {
			while (rs.next()) {
				cname = rs.getString(1);
			}
		} catch (SQLException e) {
			return null;
		}

		rs = conn.getResultSet(stmt2);

		try {
			while (rs.next()) {
				dname = rs.getString(1);
			}
		} catch (SQLException e) {
			return null;
		}

		stmt = conn.getStatement(con, query);
		try {
			stmt.setInt(1, deptid);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

		rs = conn.getResultSet(stmt);

		list = "<div id=\"content\" style=\"width:300px;\">"
				+ "<div class=\"page-header\">" + "<h2>" + cname
				+ "<br><small><small>" + dname
				+ " Şubesi </small></small></h2></div>";
		try {
			while (rs.next()) {
				list += mu.prepareStringForList(rs.getInt(1), rs.getString(2),
						username);
			}
		} catch (SQLException e) {
			return null;
		}

		list += "</div>";
		con.setAutoCommit(true);
		conn.closeResultSet(rs);
		conn.closeStatement(stmt);
		conn.closeStatement(stmt2);
		conn.closeConnection(con);

		return list;

	}

	@Override
	public String getAdDetailsWithAdId(int adid, String username)
			throws SQLException {
		AdBean advertbean = new AdBean();
		MapUtilities mu = new MapUtilities();
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM tblAdvert WHERE AdId = ?";
		String details = null;

		stmt = conn.getStatement(con, query);

		try {
			stmt.setInt(1, adid);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

		rs = conn.getResultSet(stmt);
		try {
			while (rs.next()) {
				advertbean.setTitle(rs.getString(2));
				advertbean.setJobfield1(rs.getString(3));
				advertbean.setJobfield2(rs.getString(4));
				advertbean.setJobfield3(rs.getString(5));
				advertbean.setJobfield4(rs.getString(6));
				advertbean.setJobfield5(rs.getString(7));
				advertbean.setPositiontype(rs.getString(8));
				advertbean.setQualifications(rs.getString(9));
				advertbean.setSector1(rs.getString(10));
				advertbean.setSector2(rs.getString(11));
				advertbean.setSector3(rs.getString(12));
				advertbean.setSector4(rs.getString(13));
				advertbean.setSector5(rs.getString(14));
				advertbean.setPositionlevel(rs.getString(15));
				advertbean.setNumberofpersonnel(rs.getInt(16));
				advertbean.setShownumberofpersonnel(rs.getBoolean(17));
				advertbean.setNetsalary(rs.getString(18));
				advertbean.setShownetsalary(rs.getBoolean(19));
				advertbean.setEducationallevel(rs.getString(20));
				advertbean.setLastposition1(rs.getString(21));
				advertbean.setLastposition2(rs.getString(22));
				advertbean.setLastposition3(rs.getString(23));
				advertbean.setLastposition4(rs.getString(24));
				advertbean.setLastposition5(rs.getString(25));
				advertbean.setLastsector1(rs.getString(26));
				advertbean.setLastsector2(rs.getString(27));
				advertbean.setLastsector3(rs.getString(28));
				advertbean.setLastsector4(rs.getString(29));
				advertbean.setLastsector5(rs.getString(30));
				advertbean.setUniversity1(rs.getString(31));
				advertbean.setUniversity2(rs.getString(32));
				advertbean.setUniversity3(rs.getString(33));
				advertbean.setUniversity4(rs.getString(34));
				advertbean.setUniversity5(rs.getString(35));
				advertbean.setUniversitySection1(rs.getString(36));
				advertbean.setUniversitySection2(rs.getString(37));
				advertbean.setUniversitySection3(rs.getString(38));
				advertbean.setUniversitySection4(rs.getString(39));
				advertbean.setUniversitySection5(rs.getString(40));
				advertbean.setMilitaryStatus(rs.getString(41));
				advertbean.setExperience(rs.getString(42));
				advertbean.setGender(rs.getString(43));
				advertbean.setCity(rs.getString(44));
				advertbean.setMinage(rs.getInt(45));
				advertbean.setMaxage(rs.getInt(46));
				advertbean.setDrivinglicence(rs.getString(47));
				advertbean.setForeignlanguage1(rs.getString(48));
				advertbean.setForeignlanguage2(rs.getString(49));
				advertbean.setForeignlanguage3(rs.getString(50));
				advertbean.setForeignlanguage4(rs.getString(51));
				advertbean.setForeignlanguage5(rs.getString(52));
				advertbean.setPostingdate(rs.getDate(53));
				advertbean.setUpdateddate(rs.getDate(54));
				advertbean.setLastapplydate(rs.getDate(55));
				advertbean.setDepartmentId(rs.getShort(56));
				details = mu.prepareStringForDetails(advertbean, adid,
						username);
			}
		} catch (SQLException e) {
			System.out.println("patladı");
			return null;
		}

		conn.closeResultSet(rs);
		conn.closeStatement(stmt);
		conn.closeConnection(con);

		return details;
	}

	@Override
	public AdBean getAdvertModal(int adid) throws SQLException {
		AdBean advertbean = new AdBean();
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM tblAdvert WHERE AdId = ?";

		stmt = conn.getStatement(con, query);

		try {
			stmt.setInt(1, adid);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

		rs = conn.getResultSet(stmt);
		try {
			while (rs.next()) {
				advertbean.setTitle(rs.getString(2));
				advertbean.setJobfield1(rs.getString(3));
				advertbean.setJobfield2(rs.getString(4));
				advertbean.setJobfield3(rs.getString(5));
				advertbean.setJobfield4(rs.getString(6));
				advertbean.setJobfield5(rs.getString(7));
				advertbean.setPositiontype(rs.getString(8));
				advertbean.setQualifications(rs.getString(9));
				advertbean.setSector1(rs.getString(10));
				advertbean.setSector2(rs.getString(11));
				advertbean.setSector3(rs.getString(12));
				advertbean.setSector4(rs.getString(13));
				advertbean.setSector5(rs.getString(14));
				advertbean.setPositionlevel(rs.getString(15));
				advertbean.setNumberofpersonnel(rs.getInt(16));
				advertbean.setShownumberofpersonnel(rs.getBoolean(17));
				advertbean.setNetsalary(rs.getString(18));
				advertbean.setShownetsalary(rs.getBoolean(19));
				advertbean.setEducationallevel(rs.getString(20));
				advertbean.setLastposition1(rs.getString(21));
				advertbean.setLastposition2(rs.getString(22));
				advertbean.setLastposition3(rs.getString(23));
				advertbean.setLastposition4(rs.getString(24));
				advertbean.setLastposition5(rs.getString(25));
				advertbean.setLastsector1(rs.getString(26));
				advertbean.setLastsector2(rs.getString(27));
				advertbean.setLastsector3(rs.getString(28));
				advertbean.setLastsector4(rs.getString(29));
				advertbean.setLastsector5(rs.getString(30));
				advertbean.setUniversity1(rs.getString(31));
				advertbean.setUniversity2(rs.getString(32));
				advertbean.setUniversity3(rs.getString(33));
				advertbean.setUniversity4(rs.getString(34));
				advertbean.setUniversity5(rs.getString(35));
				advertbean.setUniversitySection1(rs.getString(36));
				advertbean.setUniversitySection2(rs.getString(37));
				advertbean.setUniversitySection3(rs.getString(38));
				advertbean.setUniversitySection4(rs.getString(39));
				advertbean.setUniversitySection5(rs.getString(40));
				advertbean.setMilitaryStatus(rs.getString(41));
				advertbean.setExperience(rs.getString(42));
				advertbean.setGender(rs.getString(43));
				advertbean.setCity(rs.getString(44));
				advertbean.setMinage(rs.getInt(45));
				advertbean.setMaxage(rs.getInt(46));
				advertbean.setDrivinglicence(rs.getString(47));
				advertbean.setForeignlanguage1(rs.getString(48));
				advertbean.setForeignlanguage2(rs.getString(49));
				advertbean.setForeignlanguage3(rs.getString(50));
				advertbean.setForeignlanguage4(rs.getString(51));
				advertbean.setForeignlanguage5(rs.getString(52));
				advertbean.setPostingdate(rs.getDate(53));
				advertbean.setUpdateddate(rs.getDate(54));
				advertbean.setLastapplydate(rs.getDate(55));
				advertbean.setDepartmentId(rs.getInt(56));

			}
		} catch (SQLException e) {
			System.out.println("patladı");
			return null;
		} finally {

			conn.closeResultSet(rs);
			conn.closeStatement(stmt);
			conn.closeConnection(con);
		}

		return advertbean;
	}

	@Override
	public String getMarkerCoords(int deptid) throws SQLException {
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String query = "SELECT coords FROM tblDepartment WHERE DepartmentId = ?";
		String coord = null;

		stmt = conn.getStatement(con, query);

		try {
			stmt.setInt(1, deptid);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

		rs = conn.getResultSet(stmt);
		try {
			while (rs.next()) {
				coord = rs.getString(1);
			}
		} catch (SQLException e) {
			return null;
		}

		conn.closeResultSet(rs);
		conn.closeStatement(stmt);
		conn.closeConnection(con);

		return coord;
	}

	@Override
	public int getCompanyId(String username) {
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int companyid = 0;
		String query = "SELECT CompanyId FROM tblCompanyInformation WHERE UserName LIKE ?";
		stmt = conn.getStatement(con, query);
		try {
			stmt.setString(1, username);
			rs = stmt.executeQuery();
			while (rs.next()) {
				companyid = rs.getInt("CompanyId");
			}

		} catch (

		SQLException e)

		{
			e.printStackTrace();

		}
		return companyid;
	}

	@Override
	public String getCompanyName(int deptid) {
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

}