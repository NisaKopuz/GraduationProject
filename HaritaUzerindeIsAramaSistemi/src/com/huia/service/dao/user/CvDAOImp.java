package com.huia.service.dao.user;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.Part;

import com.huia.bean.CVInfoBean;
import com.huia.service.db.ConnectionHelper;

public class CvDAOImp implements ICvDAO {
	static ConnectionHelper conn = new ConnectionHelper();
	// cv contact bilgilerini veri tabanına kaydeder
	
	public void setCvInfoReference(CVInfoBean cvBeanReference)
	{
		
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		String query = "UPDATE  tblReferenceInformation SET ReferenceType=?,ReferenceName=?,ReferenceSurname=?,ReferansFirmPosition=?,ReferenceEmail=?,ReferencePhone=?,ReferenceFirmName=?,ReferenceFirmSector=? WHERE UserName=?";
		stmt = conn.getStatement(con, query);
		try {
			stmt.setString(1, cvBeanReference.getReferenceType());
			stmt.setString(2, cvBeanReference.getReferenceName());
			stmt.setString(3, cvBeanReference.getReferenceSurname());
			stmt.setString(4, cvBeanReference.getReferansFirmPosition());
			stmt.setString(5, cvBeanReference.getReferenceEmail());
			stmt.setString(6, cvBeanReference.getReferencePhone());
			stmt.setString(7, cvBeanReference.getReferenceFirmName());
			stmt.setString(8, cvBeanReference.getReferenceFirmSector());
			stmt.setString(9, cvBeanReference.getUserName());
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
	public void setCvInfoLanguage(CVInfoBean cvBeanLnguage){
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		String query = "UPDATE  tblForeignLanguage SET Language=?,Reading=?,Writing=?,Speaking=?,LearningPlace=?,NativeLanguageInfo=? WHERE UserName=?";
		stmt = conn.getStatement(con, query);
		try {
		stmt.setString(1, cvBeanLnguage.getLanguage());
		stmt.setString(2, cvBeanLnguage.getReading());
		stmt.setString(3, cvBeanLnguage.getWriting());
		stmt.setString(4, cvBeanLnguage.getSpeaking());
		stmt.setString(5, cvBeanLnguage.getLearningPlace());
		stmt.setString(6, cvBeanLnguage.getNativeLanguageInfoRadio());
		stmt.setString(7, cvBeanLnguage.getUserName());
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
	public void setCvInfoBusiness(CVInfoBean cvBeanBusiness){
		
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		String query = "UPDATE  tblBusinessInformation SET FirmName=?,FirmStartDate=?,FirmFinishDate=?,PositionAtFirm=?,FirmSector=?,BusinessScope=?,Explanation=? WHERE UserName=?";
		stmt = conn.getStatement(con, query);
		try {
			stmt.setString(1, cvBeanBusiness.getFirmName());
			stmt.setString(2, cvBeanBusiness.getFirmStartDate());
			stmt.setString(3, cvBeanBusiness.getFirmFinishDate());
			stmt.setString(4, cvBeanBusiness.getPositionAtFirm());
			stmt.setString(5, cvBeanBusiness.getFirmSector());
			stmt.setString(6, cvBeanBusiness.getBusinessScope());
			stmt.setString(7, cvBeanBusiness.getExplanation());
			stmt.setString(8, cvBeanBusiness.getUserName());
			
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
	public void setCvInfoEducation(CVInfoBean cvBeanEducational)
	{
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		String query = "UPDATE  tblEducationalInformation SET EducationLevel=?,StartDate=?,FinishDate=?,DiplomaGradeSystem=?,DiplomaGrade=?,UniversityName=?,UniversityTown=?,FacultyName=?,DepartmentName=?,EducationType=?,EducationLanguage=?,BursaryType=?,Minortxt=?,DoubleMajortxt=? WHERE UserName=?";
		stmt = conn.getStatement(con, query);
		try {
		
			stmt.setString(1, cvBeanEducational.getEducationLevel());
			stmt.setString(2, cvBeanEducational.getStartDate());
			stmt.setString(3, cvBeanEducational.getFinishDate());
			stmt.setString(4, cvBeanEducational.getDiplomaGradeSystem());
			stmt.setString(5, cvBeanEducational.getDiplomaGrade());
			stmt.setString(6, cvBeanEducational.getUniversityName());
			stmt.setString(7, cvBeanEducational.getUniversityTown());
			stmt.setString(8, cvBeanEducational.getFacultyName());
			stmt.setString(9, cvBeanEducational.getDepartmentName());
			stmt.setString(10, cvBeanEducational.getEducationType());
			stmt.setString(11, cvBeanEducational.getEducationLanguage());
			stmt.setString(12, cvBeanEducational.getBursaryType());
			stmt.setString(13, cvBeanEducational.getMinortxt());
			stmt.setString(14, cvBeanEducational.getDoubleMajortxt());
			stmt.setString(15, cvBeanEducational.getUserName());
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
	
	public void setCvInfo(CVInfoBean cvBean){
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		String query = "UPDATE  tblContactInformation SET userName=?,Name=?,Surname=?,Title=?,Country=?,City=?,Town=?,District=?,HomePhoneNumber=?,CellPhoneNumber=?,Eposta=?,webPage=?,WepPage2=? WHERE UserName=?";
		stmt = conn.getStatement(con, query);
		try {
			stmt.setString(1, cvBean.getUserName());
			stmt.setString(2, cvBean.getName());
			stmt.setString(3, cvBean.getSurname());
			stmt.setString(4, cvBean.getTitle());
			stmt.setString(5, cvBean.getCountry());
			stmt.setString(6, cvBean.getCity());
			stmt.setString(7, cvBean.getTown());
			stmt.setString(8, cvBean.getDistrict());
			stmt.setString(9, cvBean.getHomePhoneNumber());
			stmt.setString(10, cvBean.getCellPhoneNumber());
			stmt.setString(11, cvBean.getEposta());
			stmt.setString(12, cvBean.getWebPage());
			stmt.setString(13, cvBean.getWebPage2());
			stmt.setString(14, cvBean.getUserName());
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
	
	public void AddCvInfoPersonal(CVInfoBean cvBeanPersonal) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		PreparedStatement stmt2 = null;
		ResultSet rs = null;
		String query = "INSERT INTO tblPersonalInformation (ID,idContact,MaritalStatus,Gender,BirthDate,BirthPlace,Nationality,DrivingLicence,DisabledInfo,DisabledPercentage,HealthCertificate,HealthCertificatetxt,ChronicIlness,ChronicIlnesstxt,UsedMedicine,UsedMedicinetxt,CommunicableIllness,CommunicableIllnesstxt,LossOfConsciousness,LossOfConsciousnesstxt,userName) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		String query2= "SELECT * FROM tblPersonalInformation WHERE UserName=?";
		stmt2 = conn.getStatement(con, query2);
		int count=0;
		try {

			con.setAutoCommit(false);
			stmt = conn.getStatement(con, query);
			stmt2.setString(1, cvBeanPersonal.getUserName());
			rs = stmt2.executeQuery();

			while (rs.next()) {
				rs.getString("userName");
				count ++;
			}
			if(count == 0){
			stmt.setString(1, cvBeanPersonal.getID());
			stmt.setInt(2, cvBeanPersonal.getIdContact());
			stmt.setString(3, cvBeanPersonal.getMaritalStatusDrpdwnlst());
			stmt.setString(4, cvBeanPersonal.getGenderRadioBttn());
			stmt.setString(5, cvBeanPersonal.getBirthDate());
			stmt.setString(6, cvBeanPersonal.getBirthPlace());
			stmt.setString(7, cvBeanPersonal.getNationality());
			stmt.setString(8, cvBeanPersonal.getDrivingLicence());
			stmt.setString(9, cvBeanPersonal.getDisabledInfo());
			stmt.setString(10, cvBeanPersonal.getPercentage());
			stmt.setString(11, cvBeanPersonal.getHealthCertificate());
			stmt.setString(12, cvBeanPersonal.getHealthCertificatetxt());
			stmt.setString(13, cvBeanPersonal.getChronicIlness());
			stmt.setString(14, cvBeanPersonal.getChronicIlnesstxt());
			stmt.setString(15, cvBeanPersonal.getUsedMedicine());
			stmt.setString(16, cvBeanPersonal.getUsedMedicinetxt());
			stmt.setString(17, cvBeanPersonal.getCommunicableIllness());
			stmt.setString(18, cvBeanPersonal.getCommunicableIllnesstxt());
			stmt.setString(19, cvBeanPersonal.getLossOfConsciousness());
			stmt.setString(20, cvBeanPersonal.getLossOfConsciousnesstxt());

			stmt.setString(21, cvBeanPersonal.getUserName());

			stmt.executeUpdate();
			con.commit();
			}
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
			conn.closeStatement(stmt2);
			conn.closeResultSet(rs);

		}

	}
		public void setCvInfoPersonal(CVInfoBean cvBeanPersonal){
			
			Connection con = conn.getConnection();
			PreparedStatement stmt = null;
			String query = "UPDATE  tblPersonalInformation SET ID=?,idContact=?,MaritalStatus=?,Gender=?,BirthDate=?,BirthPlace=?,Nationality=?,DrivingLicence=?,DisabledInfo=?,DisabledPercentage=?,HealthCertificate=?,HealthCertificatetxt=?,ChronicIlness=?,ChronicIlnesstxt=?,UsedMedicine=?,UsedMedicinetxt=?,CommunicableIllness=?,CommunicableIllnesstxt=?,LossOfConsciousness=?,LossOfConsciousnesstxt=? WHERE UserName=?";
			stmt = conn.getStatement(con, query);
			try {
				stmt.setString(1, cvBeanPersonal.getID());
				stmt.setInt(2, cvBeanPersonal.getIdContact());
				stmt.setString(3, cvBeanPersonal.getMaritalStatusDrpdwnlst());
				stmt.setString(4, cvBeanPersonal.getGenderRadioBttn());
				stmt.setString(5, cvBeanPersonal.getBirthDate());
				stmt.setString(6, cvBeanPersonal.getBirthPlace());
				stmt.setString(7, cvBeanPersonal.getNationality());
				stmt.setString(8, cvBeanPersonal.getDrivingLicence());
				stmt.setString(9, cvBeanPersonal.getDisabledInfo());
				stmt.setString(10, cvBeanPersonal.getPercentage());
				stmt.setString(11, cvBeanPersonal.getHealthCertificate());
				stmt.setString(12, cvBeanPersonal.getHealthCertificatetxt());
				stmt.setString(13, cvBeanPersonal.getChronicIlness());
				stmt.setString(14, cvBeanPersonal.getChronicIlnesstxt());
				stmt.setString(15, cvBeanPersonal.getUsedMedicine());
				stmt.setString(16, cvBeanPersonal.getUsedMedicinetxt());
				stmt.setString(17, cvBeanPersonal.getCommunicableIllness());
				stmt.setString(18, cvBeanPersonal.getCommunicableIllnesstxt());
				stmt.setString(19, cvBeanPersonal.getLossOfConsciousness());
				stmt.setString(20, cvBeanPersonal.getLossOfConsciousnesstxt());
				stmt.setString(21, cvBeanPersonal.getUserName());
				
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
		public void AddCvInfo(CVInfoBean cvBean) {
			Connection con = conn.getConnection();
			PreparedStatement stmt = null;
			PreparedStatement stmt2 = null;
			ResultSet rs = null;
			String query = "INSERT INTO tblContactInformation (userName,Name,Surname,Title,Country,City,Town,District,HomePhoneNumber,CellPhoneNumber,Eposta,webPage,WepPage2) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			String query2= "SELECT * FROM tblContactInformation WHERE UserName=?";
			stmt2 = conn.getStatement(con, query2);
			int count=0;  
			try {
				stmt2.setString(1,cvBean.getUserName());
				rs = stmt2.executeQuery();
				con.setAutoCommit(false);
				stmt = conn.getStatement(con, query);	
				//Bir kullan�c�n�n yaln�zca bir contact bilgisi olabilir. Bunun kontrol�n� yapar
				while (rs.next()) {
					rs.getString("userName");
					count ++;
				}
				if(count == 0){
				stmt.setString(1, cvBean.getUserName());
				stmt.setString(2, cvBean.getName());
				stmt.setString(3, cvBean.getSurname());
				stmt.setString(4, cvBean.getTitle());
				stmt.setString(5, cvBean.getCountry());
				stmt.setString(6, cvBean.getCity());
				stmt.setString(7, cvBean.getTown());
				stmt.setString(8, cvBean.getDistrict());
				stmt.setString(9, cvBean.getHomePhoneNumber());
				stmt.setString(10, cvBean.getCellPhoneNumber());
				stmt.setString(11, cvBean.getEposta());
				stmt.setString(12, cvBean.getWebPage());
				stmt.setString(13, cvBean.getWebPage2());
			    stmt.executeUpdate();
				con.commit();
				}
			} catch (SQLException e){
				e.printStackTrace();
				try {
					con.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			} finally {
				conn.closeConnection(con);
				conn.closeStatement(stmt2);
				conn.closeStatement(stmt);
				conn.closeResultSet(rs);
			}
		}

		public void updateImage(CVInfoBean image) {
			// TODO Auto-generated method stub

		}

	public void insertImage(CVInfoBean image) {

		Connection con = conn.getConnection();
		PreparedStatement statement = null;
		String firstName = image.getUserName();

		InputStream inputStream = null; // input stream of the upload file

		// obtains the upload file part in this multipart request
		Part filePart = image.getImagePath();
		if (filePart != null && filePart.getSize()< 16177215 ) {//max 16 mb can upload
			// prints out some information for debugging
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());

			// obtains input stream of the upload file
			try {
				inputStream = filePart.getInputStream();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			System.out.println("Resim Y�klenemedi");
			
		}

		String sql = "INSERT INTO tblProfileImage (UserName, Photo) values (?, ?)";
		try {

			statement = conn.getStatement(con, sql);
			// constructs SQL statement

			statement.setString(1, firstName);

			if (inputStream != null) {
				// fetches input stream of the upload file for the blob column
				statement.setBlob(2, inputStream);
			}

			// sends the statement to the database server
			int row = statement.executeUpdate();
			if (row > 0) {
				System.out.println("File uploaded and saved into database");
			}
		} catch (SQLException ex) {

			ex.printStackTrace();
		} finally {

			conn.closeConnection(con);
			conn.closeStatement(statement);

		}

	}

	public void updateImage(CVInfoBean image, String username) {
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;

		String query = "DELETE FROM tblProfileImage  WHERE UserName=?";
		stmt = conn.getStatement(con, query);

		try {
			stmt.setString(1, image.getUserName());
			stmt.executeUpdate();

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

	public void AddCvInfoAdditional(CVInfoBean cvBeanAdditional) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;

		String query = "INSERT INTO tblAdditionalInformation (CertificateName,CertificateDate,CertificatePlace,CertificateExplanation,ExamName,ExamPlace,ExamDate,ExamExplanation,Skills,SeminarName,SeminarPlace,SeminarStartDate,SeminarFinishDate,BursaryExplanation,FondationInformation,BloodInfo,CigaretteInfo,SalaryExpectation,userName) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {

			con.setAutoCommit(false);
			stmt = conn.getStatement(con, query);

			stmt.setString(1, cvBeanAdditional.getCertificateName());
			stmt.setString(2, cvBeanAdditional.getCertificateDate());
			stmt.setString(3, cvBeanAdditional.getCertificatePlace());
			stmt.setString(4, cvBeanAdditional.getCertificateExplanation());
			stmt.setString(5, cvBeanAdditional.getExamName());
			stmt.setString(6, cvBeanAdditional.getExamPlace());
			stmt.setString(7, cvBeanAdditional.getExamDate());
			stmt.setString(8, cvBeanAdditional.getExamExplanation());
			stmt.setString(9, cvBeanAdditional.getSkills());
			stmt.setString(10, cvBeanAdditional.getSeminarName());
			stmt.setString(11, cvBeanAdditional.getSeminarPlace());
			stmt.setString(12, cvBeanAdditional.getSeminarStartDate());
			stmt.setString(13, cvBeanAdditional.getSeminarFinishDate());
			stmt.setString(14, cvBeanAdditional.getBursaryExplanation());
			stmt.setString(15, cvBeanAdditional.getFondationInformation());
			stmt.setString(16, cvBeanAdditional.getBloodInfo());
			stmt.setString(17, cvBeanAdditional.getCigaretteInfo());
			stmt.setString(18, cvBeanAdditional.getSalaryExpectation());
			stmt.setString(19, cvBeanAdditional.getUserName());
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
	public void setCvInfoAdditional(CVInfoBean cvBeanAdditional){
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		String query = "UPDATE  tblAdditionalInformation SET CertificateName=?,CertificateDate=?,CertificatePlace=?,CertificateExplanation=?,ExamName=?,ExamPlace=?,ExamDate=?,ExamExplanation=?,Skills=?,SeminarName=?,SeminarPlace=?,SeminarStartDate=?,SeminarFinishDate=?,BursaryExplanation=?,FondationInformation=?,BloodInfo=?,CigaretteInfo=?,SalaryExpectation=? WHERE UserName=?";
		stmt = conn.getStatement(con, query);
		try {
			stmt.setString(1, cvBeanAdditional.getCertificateName());
			stmt.setString(2, cvBeanAdditional.getCertificateDate());
			stmt.setString(3, cvBeanAdditional.getCertificatePlace());
			stmt.setString(4, cvBeanAdditional.getCertificateExplanation());
			stmt.setString(5, cvBeanAdditional.getExamName());
			stmt.setString(6, cvBeanAdditional.getExamPlace());
			stmt.setString(7, cvBeanAdditional.getExamDate());
			stmt.setString(8, cvBeanAdditional.getExamExplanation());
			stmt.setString(9, cvBeanAdditional.getSkills());
			stmt.setString(10, cvBeanAdditional.getSeminarName());
			stmt.setString(11, cvBeanAdditional.getSeminarPlace());
			stmt.setString(12, cvBeanAdditional.getSeminarStartDate());
			stmt.setString(13, cvBeanAdditional.getSeminarFinishDate());
			stmt.setString(14, cvBeanAdditional.getBursaryExplanation());
			stmt.setString(15, cvBeanAdditional.getFondationInformation());
			stmt.setString(16, cvBeanAdditional.getBloodInfo());
			stmt.setString(17, cvBeanAdditional.getCigaretteInfo());
			stmt.setString(18, cvBeanAdditional.getSalaryExpectation());
			stmt.setString(19, cvBeanAdditional.getUserName());
			
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

	public void AddCvInfoReference(CVInfoBean cvBeanReference) {
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		String query = "INSERT INTO tblReferenceInformation (ReferenceType,ReferenceName,ReferenceSurname,ReferansFirmPosition,ReferenceEmail,ReferencePhone,ReferenceFirmName,ReferenceFirmSector,UserName) VALUES(?,?,?,?,?,?,?,?,?)";

		try {

			con.setAutoCommit(false);
			stmt = conn.getStatement(con, query);

			stmt.setString(1, cvBeanReference.getReferenceType());
			stmt.setString(2, cvBeanReference.getReferenceName());
			stmt.setString(3, cvBeanReference.getReferenceSurname());
			stmt.setString(4, cvBeanReference.getReferansFirmPosition());
			stmt.setString(5, cvBeanReference.getReferenceEmail());
			stmt.setString(6, cvBeanReference.getReferencePhone());
			stmt.setString(7, cvBeanReference.getReferenceFirmName());
			stmt.setString(8, cvBeanReference.getReferenceFirmSector());
			stmt.setString(9, cvBeanReference.getUserName());

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

	public void AddCvInfoLanguage(CVInfoBean cvBeanLnguage) {
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		String query = "INSERT INTO tblForeignLanguage (Language,Reading,Writing,Speaking,LearningPlace,NativeLanguageInfo,UserName) VALUES(?,?,?,?,?,?,?)";

		try {

			con.setAutoCommit(false);
			stmt = conn.getStatement(con, query);

			stmt.setString(1, cvBeanLnguage.getLanguage());
			stmt.setString(2, cvBeanLnguage.getReading());
			stmt.setString(3, cvBeanLnguage.getWriting());
			stmt.setString(4, cvBeanLnguage.getSpeaking());
			stmt.setString(5, cvBeanLnguage.getLearningPlace());
			stmt.setString(6, cvBeanLnguage.getNativeLanguageInfoRadio());
			stmt.setString(7, cvBeanLnguage.getUserName());

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

	public void AddCvInfoBusiness(CVInfoBean cvBeanBusiness) {
		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		String query = "INSERT INTO tblBusinessInformation (FirmName,FirmStartDate,FirmFinishDate,ContinueSituation,PositionAtFirm,FirmSector,BusinessScope,Explanation,userName) VALUES(?,?,?,?,?,?,?,?,?)";

		try {

			con.setAutoCommit(false);
			stmt = conn.getStatement(con, query);

			stmt.setString(1, cvBeanBusiness.getFirmName());
			stmt.setString(2, cvBeanBusiness.getFirmStartDate());
			stmt.setString(3, cvBeanBusiness.getFirmFinishDate());
			stmt.setString(4, cvBeanBusiness.getFirmContinue());
			stmt.setString(5, cvBeanBusiness.getPositionAtFirm());
			stmt.setString(6, cvBeanBusiness.getFirmSector());
			stmt.setString(7, cvBeanBusiness.getBusinessScope());
			stmt.setString(8, cvBeanBusiness.getExplanation());
			stmt.setString(9, cvBeanBusiness.getUserName());

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

	public void AddCvInfoEducation(CVInfoBean cvBeanEducational) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;

		String query = "INSERT INTO tblEducationalInformation (ID,EducationLevel,StartDate,FinishDate,ContinueSituation,DiplomaGradeSystem,DiplomaGrade,UniversityName,UniversityTown,FacultyName,DepartmentName,EducationType,EducationLanguage,BursaryType,Minor,Minortxt,DoubleMajor,DoubleMajortxt,userName) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {

			con.setAutoCommit(false);
			stmt = conn.getStatement(con, query);

			stmt.setInt(1, cvBeanEducational.getIdForEducation());
			stmt.setString(2, cvBeanEducational.getEducationLevel());
			stmt.setString(3, cvBeanEducational.getStartDate());
			stmt.setString(4, cvBeanEducational.getFinishDate());
			stmt.setString(5, cvBeanEducational.getContinue());
			stmt.setString(6, cvBeanEducational.getDiplomaGradeSystem());
			stmt.setString(7, cvBeanEducational.getDiplomaGrade());
			stmt.setString(8, cvBeanEducational.getUniversityName());
			stmt.setString(9, cvBeanEducational.getUniversityTown());
			stmt.setString(10, cvBeanEducational.getFacultyName());
			stmt.setString(11, cvBeanEducational.getDepartmentName());
			stmt.setString(12, cvBeanEducational.getEducationType());
			stmt.setString(13, cvBeanEducational.getEducationLanguage());
			stmt.setString(14, cvBeanEducational.getBursaryType());
			stmt.setString(15, cvBeanEducational.getMinor());
			stmt.setString(16, cvBeanEducational.getMinortxt());
			stmt.setString(17, cvBeanEducational.getDoubleMajor());
			stmt.setString(18, cvBeanEducational.getDoubleMajortxt());
			stmt.setString(19, cvBeanEducational.getUserName());
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

	public int ID(String username) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int idForEducation = 0;
		String query2 = "Select idContact from tblContactInformation where userName=?";
		stmt = conn.getStatement(con, query2);
		try {
			stmt.setString(1, username);
			rs = stmt.executeQuery();
			while (rs.next()) {

				idForEducation = rs.getInt("idContact");
			}

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
		return idForEducation;

	}

	public int idContact(String username) {

		Connection con = conn.getConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int idContact = 0;
		String query2 = "Select idContact from tblContactInformation where userName=?";
		stmt = conn.getStatement(con, query2);
		try {
			stmt.setString(1, username);
			rs = stmt.executeQuery();
			while (rs.next()) {

				idContact = rs.getInt("idContact");
			}

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
		return idContact;
	}

	

}
