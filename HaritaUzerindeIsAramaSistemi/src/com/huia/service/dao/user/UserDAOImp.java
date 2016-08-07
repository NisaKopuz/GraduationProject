package com.huia.service.dao.user;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.huia.bean.CompanyBean;
import com.huia.bean.UserBean;
import com.huia.service.db.ConnectionHelper;

public class UserDAOImp implements IUserDAO {

	static ConnectionHelper conn = new ConnectionHelper();

	public void AddEmployerUser(UserBean user, CompanyBean company)
			throws SQLException {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;

		String query = "INSERT INTO tblUserRegistration(UserName,Name,Surname,Email,Password,Cellphone) VALUES(?,?,?,?,?,?)";
		String query2 = "INSERT INTO tblCompanyInformation(Name,Sector,PhoneNumber,City,Town,District,UserName) VALUES(?,?,?,?,?,?,?)";
		String query3 = "INSERT INTO tblUser_Roles(UserName,RoleName) VALUES(?,?)";
		try {

			con.setAutoCommit(false);

			stmt = conn.getStatement(con, query);

			stmt.setString(1, user.getUsername());
			stmt.setString(2, user.getName());
			stmt.setString(3, user.getSurname());
			stmt.setString(4, user.getEmail());
			stmt.setString(5, user.getPassword());
			stmt.setString(6, user.getCellphone());

			stmt.executeUpdate();

			conn.closeStatement(stmt);
			stmt = conn.getStatement(con, query2);

			stmt.setString(1, company.getName());
			stmt.setString(2, company.getSector());
			stmt.setString(3, company.getPhonenumber());
			stmt.setString(4, company.getCity());
			stmt.setString(5, company.getTown());
			stmt.setString(6, company.getDistrict());
			stmt.setString(7, user.getUsername());

			stmt.executeUpdate();

			conn.closeStatement(stmt);
			stmt = conn.getStatement(con, query3);

			stmt.setString(1, user.getUsername());
			stmt.setString(2, "employer");

			stmt.executeUpdate();

			con.commit();
		} catch (

		SQLException e)

		{

			e.printStackTrace();

			con.rollback();

		} finally {
			conn.closeConnection(con);
			conn.closeStatement(stmt);

		}
	}

	public void AddUser(UserBean user) {
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;

		String query = "INSERT INTO tblUserRegistration(UserName,Name,Surname,Email,Password,Cellphone) VALUES(?,?,?,?,?,?)";
		String query2 = "INSERT INTO tblUser_Roles(UserName,RoleName) VALUES(?,?)";
		try {

			con.setAutoCommit(false);

			stmt = conn.getStatement(con, query);

			stmt.setString(1, user.getUsername());
			stmt.setString(2, user.getName());
			stmt.setString(3, user.getSurname());
			stmt.setString(4, user.getEmail());
			stmt.setString(5, user.getPassword());
			stmt.setString(6, user.getCellphone());

			stmt.executeUpdate();

			conn.closeStatement(stmt);
			stmt = conn.getStatement(con, query2);

			stmt.setString(1, user.getUsername());
			stmt.setString(2, "user");

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

	public ArrayList<String> getUserInformation(String username) {
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;

		ArrayList<String> userinformation = new ArrayList<String>();

		String query = "SELECT Name,Surname,Email,Cellphone FROM tbluserregistration WHERE UserName=?";
		stmt = conn.getStatement(con, query);
		try {
			stmt.setString(1, username);
			rs = stmt.executeQuery();
			while (rs.next()) {

				userinformation.add(rs.getString("Name"));
				userinformation.add(rs.getString("Surname"));
				userinformation.add(rs.getString("Email"));
				userinformation.add(rs.getString("Cellphone"));

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

		return userinformation;

	}

	public boolean controlPassword(String username, String password) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String userpassword = null;

		String query = "SELECT Password FROM tbluserregistration WHERE UserName=?";
		stmt = conn.getStatement(con, query);
		try {
			stmt.setString(1, username);
			rs = stmt.executeQuery();
			while (rs.next()) {

				userpassword = rs.getString("Password");

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

		if ((userpassword.compareTo(password)) == 0)
			return true;
		else
			return false;

	}

	public void updateUserRegistration(UserBean user) {
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;

		String query = "UPDATE  tbluserregistration SET Name=?,Surname=?,Email=?,Password=?,Cellphone=? WHERE UserName=?";
		stmt = conn.getStatement(con, query);
		try {

			stmt.setString(1, user.getName());
			stmt.setString(2, user.getSurname());
			stmt.setString(3, user.getEmail());
			stmt.setString(4, user.getPassword());
			stmt.setString(5, user.getCellphone());
			stmt.setString(6, user.getUsername());
			stmt.executeUpdate();

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally {

			conn.closeStatement(stmt);
			conn.closeConnection(con);

		}

	}

	public void updateUserRegistrationWithoutPassword(UserBean user) {
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;

		String query = "UPDATE  tbluserregistration SET Name=?,Surname=?,Email=?,Cellphone=?  WHERE UserName=?";
		stmt = conn.getStatement(con, query);
		try {

			stmt.setString(1, user.getName());
			stmt.setString(2, user.getSurname());
			stmt.setString(3, user.getEmail());
			stmt.setString(4, user.getCellphone());
			stmt.setString(5, user.getUsername());
			stmt.executeUpdate();

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally {

			conn.closeStatement(stmt);
			conn.closeConnection(con);

		}

	}

	public boolean isUserNameExist(String username) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		boolean isexist = false;

		String query = "SELECT 1 FROM tbluserregistration WHERE UserName=?";
		stmt = conn.getStatement(con, query);
		try {
			stmt.setString(1, username);
			rs = stmt.executeQuery();
			if (rs.next())
				isexist = true;
			else
				isexist = false;

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally {

			conn.closeStatement(stmt);
			conn.closeConnection(con);
			conn.closeResultSet(rs);
		}

		return isexist;
	}

	public ArrayList<String> getReferencesInformation(String username)

	{
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		// Date format
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");

		ArrayList<String> refencesinformation = new ArrayList<String>();

		String query = "SELECT * FROM  tblreferences WHERE UserName=?";
		stmt = conn.getStatement(con, query);
		try

		{
			stmt.setString(1, username);
			rs = stmt.executeQuery();
			while (rs.next()) {
				refencesinformation.add(Integer.toString((rs.getInt("AdId"))));
				refencesinformation
						.add(df.format(rs.getDate("ReferencesDate")));
			
				refencesinformation.add(rs.getString("CompanyName"));
				refencesinformation
						.add(String.valueOf(rs.getBoolean("ReferencesAction")));
				refencesinformation
						.add(Integer.toString((rs.getInt("LetterStatus"))));

			}

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally

		{

			conn.closeStatement(stmt);
			conn.closeConnection(con);
			conn.closeResultSet(rs);
		}

		return refencesinformation;
	}

	public String getMessageForUser(int adid, String username) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String message = "";
		String query = "SELECT MessageUser FROM  tblreferences WHERE AdId=? && UserName=? ";
		stmt = conn.getStatement(con, query);
		try

		{
			stmt.setInt(1, adid);
			stmt.setString(2, username);
			rs = stmt.executeQuery();
			while (rs.next()) {
				message = rs.getString("MessageUser");
			}

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally

		{

			conn.closeStatement(stmt);
			conn.closeConnection(con);
			conn.closeResultSet(rs);
		}

		return message;

	}

	public String getMessageForEmployer(String username, int adid) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String message = "";
		String query = "SELECT MessageEmployer FROM  tblreferences WHERE UserName=? && AdId=?";
		stmt = conn.getStatement(con, query);
		try

		{
			stmt.setString(1, username);
			stmt.setInt(2, adid);
			rs = stmt.executeQuery();
			while (rs.next()) {
				message = rs.getString("MessageEmployer");
			}

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally

		{

			conn.closeStatement(stmt);
			conn.closeConnection(con);
			conn.closeResultSet(rs);
		}

		return message;

	}

	public void changeMessageStatusForUser(int adid, String username) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;

		String query = "UPDATE tblreferences SET LetterStatus=? WHERE AdId=? && UserName=?";
		stmt = conn.getStatement(con, query);
		try

		{
			stmt.setInt(1, 2);
			stmt.setInt(2, adid);
			stmt.setString(3, username);
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
	}

	public void changeMessageStatusForEmployer(String username, int adid) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;

		String query = "UPDATE tblreferences SET LetterStatusEmployer=? WHERE Username=? && AdId=?";
		stmt = conn.getStatement(con, query);
		try

		{
			stmt.setInt(1, 2);
			stmt.setString(2, username);
			stmt.setInt(3, adid);

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
	}

	public void deleteReferences(int adid, String username) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;

		String query = "DELETE FROM tblreferences  WHERE  Username=? && AdId=?";
		stmt = conn.getStatement(con, query);
		try

		{
			stmt.setString(1, username);
			stmt.setInt(2, adid);

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
	}

	public void SendMailEmployertoApplicant(String mail, String username,
			int adid) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;

		String query = "UPDATE tblreferences SET MessageUser=?,LetterStatus=? WHERE AdId=? && UserName=?";
		stmt = conn.getStatement(con, query);
		try

		{
			stmt.setString(1, mail);
			stmt.setInt(2, 1);
			stmt.setInt(3, adid);
			stmt.setString(4, username);
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

	}


	public static boolean checkReference(String username, int adid) {
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int result = 0;

		String query = "SELECT EXISTS(SELECT * FROM tblreferences WHERE UserName = ? AND AdId = ?)";
		stmt = conn.getStatement(con, query);
		try {
			stmt.setString(1, username);
			stmt.setInt(2, adid);
			rs = stmt.executeQuery();
			while (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conn.closeStatement(stmt);
			conn.closeConnection(con);
			conn.closeResultSet(rs);
		}

		if (result == 0)
			return false;
		else
			return true;

	}

	public static boolean isEmployer(String username) {
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int result = 0;

		String query = "SELECT EXISTS(SELECT * FROM tbluser_roles WHERE UserName = ? AND RoleName= ?)";
		stmt = conn.getStatement(con, query);
		try {
			stmt.setString(1, username);
			stmt.setString(2, "employer");
			rs = stmt.executeQuery();
			while (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			conn.closeStatement(stmt);
			conn.closeConnection(con);
			conn.closeResultSet(rs);
		}

		if (result == 0)
			return false;
		else
			return true;
	}

	public ArrayList<String> usernameandsurname(String username) {
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<String> userinformation = new ArrayList<String>();
		String query = "SELECT Name,Surname FROM  tbluserregistration WHERE  UserName=? ";
		stmt = conn.getStatement(con, query);
		try

		{

			stmt.setString(1, username);
			rs = stmt.executeQuery();
			while (rs.next()) {
				userinformation.add(rs.getString("Name"));
				userinformation.add(rs.getString("Surname"));
			}

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally

		{

			conn.closeStatement(stmt);
			conn.closeConnection(con);
			conn.closeResultSet(rs);
		}

		return userinformation;

	}

	public ArrayList<Integer> findingSectorInAdvertTable(String[] sector) {
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Integer> departmentid = new ArrayList<Integer>();
		String query = "SELECT DepartmentId  FROM  tbladvert WHERE  Sector1=? OR Sector2=? OR Sector3=? OR Sector4=? OR Sector5=? ";
		stmt = conn.getStatement(con, query);
		try

		{
			for (int i = 0; i < sector.length; i++) {
				stmt.setInt(1, Integer.parseInt(sector[i]));
				stmt.setInt(2, Integer.parseInt(sector[i]));
				stmt.setInt(3, Integer.parseInt(sector[i]));
				stmt.setInt(4, Integer.parseInt(sector[i]));
				stmt.setInt(5, Integer.parseInt(sector[i]));

				rs = stmt.executeQuery();
				while (rs.next()) {
					departmentid.add(rs.getInt("DepartmentId"));

				}
			}
		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally

		{

			conn.closeStatement(stmt);
			conn.closeConnection(con);

		}

		return departmentid;

	}

	public void AddBonusFeatureOfUniversity(String username,
			String universityname, String educationtype, String degree) {
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;

		String query = "INSERT INTO tblGradingEducation(UserName,EducationType,University,Degree) VALUES(?,?,?,?)";
		try {

			stmt = conn.getStatement(con, query);

			stmt.setString(1, username);
			stmt.setInt(2, Integer.parseInt(educationtype));
			stmt.setInt(3, Integer.parseInt(universityname));
			stmt.setDouble(4, Double.parseDouble(degree));

			stmt.executeUpdate();

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally {
			conn.closeConnection(con);
			conn.closeStatement(stmt);

		}

	}

	public void AddBonusFeatureOfLanguage(String username, String language,
			String reading, String writing, String speaking) {
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;

		String query = "INSERT INTO tblgradinglanguage(UserName,Language,Reading,Writing,Speaking) VALUES(?,?,?,?,?)";
		try {

			stmt = conn.getStatement(con, query);

			stmt.setString(1, username);
			stmt.setInt(2, Integer.parseInt(language));
			stmt.setInt(3, Integer.parseInt(reading));
			stmt.setInt(4, Integer.parseInt(writing));
			stmt.setInt(5, Integer.parseInt(speaking));

			stmt.executeUpdate();

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally {
			conn.closeConnection(con);
			conn.closeStatement(stmt);

		}

	}

	public void AddBonusFeatureOfJobExperience(String username,
			String companyname, String position, String startdate,
			String enddate) {
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy");

		String query = "INSERT INTO tblGradingJobExperience(UserName,CompanyName,Position,StartDate,EndDate) VALUES(?,?,?,?,?)";
		try {

			stmt = conn.getStatement(con, query);

			stmt.setString(1, username);
			stmt.setString(2, companyname);
			stmt.setInt(3, Integer.parseInt(position));
			java.sql.Date sqlstartdate = new java.sql.Date(
					formatter.parse(startdate).getTime());
			java.sql.Date sqlenddate = new java.sql.Date(
					formatter.parse(enddate).getTime());
			stmt.setDate(4, sqlstartdate);
			stmt.setDate(5, sqlenddate);

			stmt.executeUpdate();

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} catch (ParseException ex) {
			ex.printStackTrace();
		} finally {
			conn.closeConnection(con);
			conn.closeStatement(stmt);

		}

	}

	public void AddBonusFeature(String username, String age,
			int certificatecount, int internshipcount, int seminarcount) {
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy");
		String query = "INSERT INTO tblGrading(UserName,Age,certificatecount,Internshipcount,seminarcount) VALUES(?,?,?,?,?)";
		try {

			stmt = conn.getStatement(con, query);

			stmt.setString(1, username);
			java.sql.Date sqlage = new java.sql.Date(
					formatter.parse(age).getTime());
			stmt.setDate(2, sqlage);

			stmt.setInt(3, certificatecount);
			stmt.setInt(4, internshipcount);
			stmt.setInt(5, seminarcount);

			stmt.executeUpdate();

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} catch (ParseException ex) {
			ex.printStackTrace();
		} finally {
			conn.closeConnection(con);
			conn.closeStatement(stmt);

		}

	}

	public void callOracleStoredProcOUTParameter(String username)
			throws SQLException {

		Connection con = conn.getConnection();
		CallableStatement callableStatement = null;

		String getDBGradeUserByUserName = "{call gradeUser(?)}";

		try {
			callableStatement = con.prepareCall(getDBGradeUserByUserName);
			callableStatement.setString(1, username);
			callableStatement.executeUpdate();

		} finally {
			if (callableStatement != null)
				callableStatement.close();
			con.close();
		}

	}

	public boolean isUserExistInReferencesTable(String username) {
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		boolean exist = false;
		String query = "SELECT 1 FROM tblreferences WHERE UserName=?";
		stmt = conn.getStatement(con, query);

		try

		{
			stmt.setString(1, username);

			rs = stmt.executeQuery();
			if (rs.next())
				exist = true;

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally

		{

			conn.closeStatement(stmt);
			conn.closeResultSet(rs);
			conn.closeConnection(con);
		}
		return exist;

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

	public boolean isBonusFeatureUsed(String username) {
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		boolean exist = false;
		String query = "SELECT 1 FROM tblgrading WHERE UserName=?";
		stmt = conn.getStatement(con, query);

		try

		{
			stmt.setString(1, username);

			rs = stmt.executeQuery();
			if (rs.next())
				exist = true;

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally

		{

			conn.closeStatement(stmt);
			conn.closeResultSet(rs);
			conn.closeConnection(con);
		}
		return exist;
	}

	public void AddUserCV(int adid, String username, String path) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String query = "INSERT INTO tblusercv(adid,username,filepath) VALUES(?,?,?)";
		stmt = conn.getStatement(con, query);
		try {

			stmt = conn.getStatement(con, query);

			stmt.setInt(1, adid);
			stmt.setString(2, username);
			stmt.setString(3, path);

			stmt.executeUpdate();

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally {
			conn.closeConnection(con);
			conn.closeStatement(stmt);

		}

	}

	public String getUserCV(int adid, String username) {
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String filepath = null;
		String query = "SELECT filepath FROM tblusercv WHERE AdId=? AND Username=?";
		stmt = conn.getStatement(con, query);
		try {

			stmt = conn.getStatement(con, query);

			stmt.setInt(1, adid);
			stmt.setString(2, username);
			rs = stmt.executeQuery();
			while (rs.next()) {
				filepath = rs.getString("filepath");
			}

		} catch (

		SQLException e)

		{

			e.printStackTrace();

		} finally {
			conn.closeConnection(con);
			conn.closeResultSet(rs);
			conn.closeStatement(stmt);

		}
		return filepath;
	}
	
	public boolean isUserHavePicture(String username) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		boolean havepicture = false;
		String query = "SELECT 1 FROM tblProfileImage WHERE UserName=?";
		stmt = conn.getStatement(con, query);
		try {
			stmt.setString(1, username);
			rs = stmt.executeQuery();
			if (rs.next())
				havepicture = true;
			else
				havepicture = false;
		} catch (

		SQLException e)

		{
			e.printStackTrace();

		} finally {

			conn.closeStatement(stmt);
			conn.closeConnection(con);

		}
		return havepicture;

	}
	
	/* izel tarafından eklendi 24.05.2016 */ 
	
	public String getUserPassword(String username, String email) {

		Connection con = conn.getConnection();
		String userPassword = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String query = "SELECT Password FROM tbluserregistration WHERE UserName LIKE ? AND Email LIKE ? ";
		stmt = conn.getStatement(con, query);
		try {
			stmt.setString(1, username);
			stmt.setString(2, email);
			rs = stmt.executeQuery();
			if (rs.next())
				userPassword = rs.getString("Password");
		} catch (

		SQLException e)

		{
			e.printStackTrace();

		} finally {

			conn.closeStatement(stmt);
			conn.closeConnection(con);

		}
		return userPassword;

	}
	
	public void sendEmail(String s_to, String messageSubject , String messageBody) {
		 // Recipient's email ID needs to be mentioned.
	      String to = s_to;//change accordingly

	      // Sender's email ID needs to be mentioned
	      String from = "isburadacomtr@gmail.com";//change accordingly
	      final String username = "isburadacomtr";//change accordingly
	      final String password = "MaltepeProje";//change accordingly

	      // Assuming you are sending email through relay.jangosmtp.net
	      String host = "smtp.gmail.com";

	      Properties props = new Properties();
	      props.put("mail.smtp.auth", "true");
	      props.put("mail.smtp.starttls.enable", "true");
	      props.put("mail.smtp.host", host);
	      props.put("mail.smtp.port", "587");

	      // Get the Session object.
	      Session session = Session.getInstance(props,
	      new javax.mail.Authenticator() {
	         protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(username, password);
	         }
	      });

	      try {
	         // Create a default MimeMessage object.
	         Message message = new MimeMessage(session);

	         // Set From: header field of the header.
	         message.setFrom(new InternetAddress(from));

	         // Set To: header field of the header.
	         message.setRecipients(Message.RecipientType.TO,
	         InternetAddress.parse(to));

	         // Set Subject: header field
	         message.setSubject(messageSubject);

	         // Now set the actual message
	         message.setContent(messageBody, "text/html; charset=utf-8");

	         // Send message
	         Transport.send(message);
	         
	         //Başarılı

	      } catch (MessagingException e) {
	            throw new RuntimeException(e);
	      }
	}
}