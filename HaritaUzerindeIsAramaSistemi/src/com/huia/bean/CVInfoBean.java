package com.huia.bean;

import javax.servlet.http.Part;

public class CVInfoBean {
	private String userName;
	
	private String Name;
	private String Surname;
	private String Title;
	private String Country;
	private String City;
	private String Town;
	private String District;
	private String HomePhoneNumber;
	private String CellPhoneNumber;
	private String Eposta;
	private String WebPage;
	private String WebPage2;
	
	private String ID;
	private int idContact;
	private int idEducation;
	private int idBusiness;
	private int idLanguage;
	private int idReference;

	
	public int getIdReference() {
		return idReference;
	}

	public void setIdReference(int idReference) {
		this.idReference = idReference;
	}

	public int getIdLanguage() {
		return idLanguage;
	}

	public void setIdLanguage(int idLanguage) {
		this.idLanguage = idLanguage;
	}

	public int getIdEducation() {
		return idEducation;
	}

	public void setIdEducation(int idEducation) {
		this.idEducation = idEducation;
	}
	private String MaritalStatusDrpdwnlst;
	private String genderRadioBttn;
	private String BirthDate;
	private String BirthPlace;
	private String Nationality;
	private String DrivingLicence;
	private String DisabledInfo;
	private String Percentage;
	private String HealthCertificate;
	private String HealthCertificatetxt;
	private String ChronicIlness;
	private String ChronicIlnesstxt;
	private String UsedMedicine;
	private String UsedMedicinetxt;
	private String CommunicableIllness;
	private String CommunicableIllnesstxt;
	private String LossOfConsciousness;
	private String LossOfConsciousnesstxt;
	
	private String EducationLevel;
	private String StartDate;
	private String FinishDate;
	private String Continue;
	private String DiplomaGradeSystem;
	private String DiplomaGrade;
	private String UniversityName;
	private String UniversityTown;
	private String FacultyName;
	private String DepartmentName;
	private String EducationType;
	private String EducationLanguage;
	private String BursaryType;
	private String Minor;
	private String Minortxt;
	private String DoubleMajor;
	private String DoubleMajortxt;
	private String highSchoolName;
	private String highSchoolType;
	private String highSchoolTown;
	private String highSchoolStartDate;
	private String highSchoolFinishDate;
	private String highSchoolDegree;
	
	private String FirmName;
	private String FirmStartDate;
	private String FirmFinishDate;
	private String PositionAtFirm;
	private String FirmContinue;
	private String FirmSector;
	private String BusinessScope;
	private String Explanation;  
	

	private String Language;
	private String Reading;
	private String Writing;
	private String Speaking;
	private String LearningPlace;
	private String NativeLanguageInfoRadio;
	
	private String ReferenceType;
	
	private String ReferenceName;
	private String ReferenceSurname;
	private String ReferansFirmPosition;
	private String ReferenceEmail;
	private String ReferencePhone;
	private String ReferenceFirmName;
	private String ReferenceFirmSector;
	
	
	private String CertificateName;
	private String CertificateDate;
	private String CertificatePlace;
	private String CertificateExplanation;
	private String ExamName;
	private String ExamPlace;
	private String ExamDate;
	private String ExamExplanation;
	private String Skills;
	private String SeminarName;
	private String SeminarPlace;
	private String SeminarStartDate;
	private String SeminarFinishDate;
	private String BursaryExplanation;
	private String FondationInformation;
	private String BloodInfo;
	private String CigaretteInfo;
	private String SalaryExpectation;
    private Part ImagePath;

		public Part getImagePath() {
			return ImagePath;
		}

		public void setImagePath(Part imagePath) {
			this.ImagePath = imagePath;
		}

	
		public String getFirmContinue() {
			return FirmContinue;
		}

		public void setFirmContinue(String firmContinue) {
			FirmContinue = firmContinue;
		}


	public String getCertificateName() {
		return CertificateName;
	}
	public void setCertificateName(String certificateName) {
		CertificateName = certificateName;
	}
	public String getCertificateDate() {
		return CertificateDate;
	}
	public void setCertificateDate(String certificateDate) {
		CertificateDate = certificateDate;
	}
	public String getCertificatePlace() {
		return CertificatePlace;
	}
	public void setCertificatePlace(String certificatePlace) {
		CertificatePlace = certificatePlace;
	}
	public String getCertificateExplanation() {
		return CertificateExplanation;
	}
	public void setCertificateExplanation(String certificateExplanation) {
		CertificateExplanation = certificateExplanation;
	}
	public String getExamName() {
		return ExamName;
	}
	public void setExamName(String examName) {
		ExamName = examName;
	}
	public String getExamPlace() {
		return ExamPlace;
	}
	public void setExamPlace(String examPlace) {
		ExamPlace = examPlace;
	}
	public String getExamDate() {
		return ExamDate;
	}
	public void setExamDate(String examDate) {
		ExamDate = examDate;
	}
	public String getExamExplanation() {
		return ExamExplanation;
	}
	public void setExamExplanation(String examExplanation) {
		ExamExplanation = examExplanation;
	}
	public String getSkills() {
		return Skills;
	}
	public void setSkills(String skills) {
		Skills = skills;
	}
	public String getSeminarName() {
		return SeminarName;
	}
	public void setSeminarName(String seminarName) {
		SeminarName = seminarName;
	}
	public String getSeminarPlace() {
		return SeminarPlace;
	}
	public void setSeminarPlace(String seminarPlace) {
		SeminarPlace = seminarPlace;
	}
	public String getSeminarStartDate() {
		return SeminarStartDate;
	}
	public void setSeminarStartDate(String seminarStartDate) {
		SeminarStartDate = seminarStartDate;
	}
	public String getSeminarFinishDate() {
		return SeminarFinishDate;
	}
	public void setSeminarFinishDate(String seminarFinishDate) {
		SeminarFinishDate = seminarFinishDate;
	}
	public String getBursaryExplanation() {
		return BursaryExplanation;
	}
	public void setBursaryExplanation(String bursaryExplanation) {
		BursaryExplanation = bursaryExplanation;
	}
	public String getFondationInformation() {
		return FondationInformation;
	}
	public void setFondationInformation(String fondationInformation) {
		FondationInformation = fondationInformation;
	}
	public String getBloodInfo() {
		return BloodInfo;
	}
	public void setBloodInfo(String bloodInfo) {
		BloodInfo = bloodInfo;
	}
	public String getCigaretteInfo() {
		return CigaretteInfo;
	}
	public void setCigaretteInfo(String cigaretteInfo) {
		CigaretteInfo = cigaretteInfo;
	}
	public String getSalaryExpectation() {
		return SalaryExpectation;
	}
	public void setSalaryExpectation(String salaryExpectation) {
		SalaryExpectation = salaryExpectation;
	}
	public String getReferenceType() {
		return ReferenceType;
	}
	public void setReferenceType(String referenceType) {
		ReferenceType = referenceType;
	}
	public String getReferenceName() {
		return ReferenceName;
	}
	public void setReferenceName(String referenceName) {
		ReferenceName = referenceName;
	}
	public String getReferenceSurname() {
		return ReferenceSurname;
	}
	public void setReferenceSurname(String referenceSurname) {
		ReferenceSurname = referenceSurname;
	}
	public String getReferansFirmPosition() {
		return ReferansFirmPosition;
	}
	public void setReferansFirmPosition(String referansFirmPosition) {
		ReferansFirmPosition = referansFirmPosition;
	}
	public String getReferenceEmail() {
		return ReferenceEmail;
	}
	public void setReferenceEmail(String referenceEmail) {
		ReferenceEmail = referenceEmail;
	}
	public String getReferencePhone() {
		return ReferencePhone;
	}
	public void setReferencePhone(String referencePhone) {
		ReferencePhone = referencePhone;
	}
	public String getReferenceFirmName() {
		return ReferenceFirmName;
	}
	public void setReferenceFirmName(String referenceFirmName) {
		ReferenceFirmName = referenceFirmName;
	}
	public String getReferenceFirmSector() {
		return ReferenceFirmSector;
	}
	public void setReferenceFirmSector(String referenceFirmSector) {
		ReferenceFirmSector = referenceFirmSector;
	}
	
	public String getLanguage() {
		return Language;
	}
	public void setLanguage(String language) {
		Language = language;
	}
	public String getReading() {
		return Reading;
	}
	public void setReading(String reading) {
		Reading = reading;
	}
	public String getWriting() {
		return Writing;
	}
	public void setWriting(String writing) {
		Writing = writing;
	}
	public String getSpeaking() {
		return Speaking;
	}
	public void setSpeaking(String speaking) {
		Speaking = speaking;
	}
	public String getLearningPlace() {
		return LearningPlace;
	}
	public void setLearningPlace(String learningPlace) {
		LearningPlace = learningPlace;
	}
	public String getNativeLanguageInfoRadio() {
		return NativeLanguageInfoRadio;
	}
	public void setNativeLanguageInfoRadio(String nativeLanguageInfoRadio) {
		NativeLanguageInfoRadio = nativeLanguageInfoRadio;
	}
	public String getFirmName() {
		return FirmName;
	}
	public void setFirmName(String firmName) {
		FirmName = firmName;
	}
	public String getFirmStartDate() {
		return FirmStartDate;
	}
	public void setFirmStartDate(String firmStartDate) {
		FirmStartDate = firmStartDate;
	}
	public String getFirmFinishDate() {
		return FirmFinishDate;
	}
	public void setFirmFinishDate(String firmFinishDate) {
		FirmFinishDate = firmFinishDate;
	}
	public String getPositionAtFirm() {
		return PositionAtFirm;
	}
	public void setPositionAtFirm(String positionAtFirm) {
		PositionAtFirm = positionAtFirm;
	}
	public String getFirmSector() {
		return FirmSector;
	}
	public void setFirmSector(String firmSector) {
		FirmSector = firmSector;
	}
	public String getBusinessScope() {
		return BusinessScope;
	}
	public void setBusinessScope(String businessScope) {
		BusinessScope = businessScope;
	}
	public String getExplanation() {
		return Explanation;
	}
	public void setExplanation(String explanation) {
		Explanation = explanation;
	}
	
	public int getIdForEducation() {
		return idForEducation;
	}
	public void setIdForEducation(int idForEducation) {
		this.idForEducation = idForEducation;
	}
	private int idForEducation;
	public String getEducationLevel() {
		return EducationLevel;
	}
	public void setEducationLevel(String educationLevel) {
		this.EducationLevel = educationLevel;
	}
	public String getStartDate() {
		return StartDate;
	}
	public void setStartDate(String startDate) {
		this.StartDate = startDate;
	}
	public String getFinishDate() {
		return FinishDate;
	}
	public void setFinishDate(String finishDate) {
		this.FinishDate = finishDate;
	}
	public String getContinue() {
		return Continue;
	}
	public void setContinue(String continue1) {
		this.Continue = continue1;
	}
	public String getDiplomaGradeSystem() {
		return DiplomaGradeSystem;
	}
	public void setDiplomaGradeSystem(String diplomaGradeSystem) {
		this.DiplomaGradeSystem = diplomaGradeSystem;
	}
	public String getDiplomaGrade() {
		return DiplomaGrade;
	}
	public void setDiplomaGrade(String diplomaGrade) {
		this.DiplomaGrade = diplomaGrade;
	}
	public String getUniversityName() {
		return UniversityName;
	}
	public void setUniversityName(String universityName) {
		this.UniversityName = universityName;
	}
	public String getUniversityTown() {
		return UniversityTown;
	}
	public void setUniversityTown(String universityTown) {
		this.UniversityTown = universityTown;
	}
	public String getFacultyName() {
		return FacultyName;
	}
	public void setFacultyName(String facultyName) {
		this.FacultyName = facultyName;
	}
	public String getDepartmentName() {
		return DepartmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.DepartmentName = departmentName;
	}
	public String getEducationType() {
		return EducationType;
	}
	public void setEducationType(String educationType) {
		this.EducationType = educationType;
	}
	public String getEducationLanguage() {
		return EducationLanguage;
	}
	public void setEducationLanguage(String educationLanguage) {
		this.EducationLanguage = educationLanguage;
	}
	public String getBursaryType() {
		return BursaryType;
	}
	public void setBursaryType(String bursaryType) {
		this.BursaryType = bursaryType;
	}
	public String getMinor() {
		return Minor;
	}
	public void setMinor(String minor) {
		this.Minor = minor;
	}
	public String getMinortxt() {
		return Minortxt;
	}
	public void setMinortxt(String minortxt) {
		this.Minortxt = minortxt;
	}
	public String getDoubleMajor() {
		return DoubleMajor;
	}
	public void setDoubleMajor(String doubleMajor) {
		this.DoubleMajor = doubleMajor;
	}
	public String getDoubleMajortxt() {
		return DoubleMajortxt;
	}
	public void setDoubleMajortxt(String doubleMajortxt) {
		this.DoubleMajortxt = doubleMajortxt;
	}

	
	
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	
	public int getIdContact() {
		return idContact;
	}
	public void setIdContact(int idContact) {
		this.idContact = idContact;
	}
	public String getMaritalStatusDrpdwnlst() {
		return MaritalStatusDrpdwnlst;
	}
	public void setMaritalStatusDrpdwnlst(String maritalStatusDrpdwnlst) {
		MaritalStatusDrpdwnlst = maritalStatusDrpdwnlst;
	}
	public String getGenderRadioBttn() {
		return genderRadioBttn;
	}
	public void setGenderRadioBttn(String genderRadioBttn) {
		this.genderRadioBttn = genderRadioBttn;
	}
	public String getBirthDate() {
		return BirthDate;
	}
	public void setBirthDate(String birthDate) {
		BirthDate = birthDate;
	}
	public String getBirthPlace() {
		return BirthPlace;
	}
	public void setBirthPlace(String birthPlace) {
		BirthPlace = birthPlace;
	}
	public String getNationality() {
		return Nationality;
	}
	public void setNationality(String nationality) {
		Nationality = nationality;
	}
	public String getDrivingLicence() {
		return DrivingLicence;
	}
	public void setDrivingLicence(String drivingLicence) {
		DrivingLicence = drivingLicence;
	}
	public String getDisabledInfo() {
		return DisabledInfo;
	}
	public void setDisabledInfo(String disabledInfo) {
		DisabledInfo = disabledInfo;
	}
	public String getPercentage() {
		return Percentage;
	}
	public void setPercentage(String percentage) {
		Percentage = percentage;
	}
	public String getHealthCertificate() {
		return HealthCertificate;
	}
	public void setHealthCertificate(String healthCertificate) {
		HealthCertificate = healthCertificate;
	}
	public String getHealthCertificatetxt() {
		return HealthCertificatetxt;
	}
	public void setHealthCertificatetxt(String healthCertificatetxt) {
		HealthCertificatetxt = healthCertificatetxt;
	}
	public String getChronicIlness() {
		return ChronicIlness;
	}
	public void setChronicIlness(String chronicIlness) {
		ChronicIlness = chronicIlness;
	}
	public String getChronicIlnesstxt() {
		return ChronicIlnesstxt;
	}
	public void setChronicIlnesstxt(String chronicIlnesstxt) {
		ChronicIlnesstxt = chronicIlnesstxt;
	}
	public String getUsedMedicine() {
		return UsedMedicine;
	}
	public void setUsedMedicine(String usedMedicine) {
		UsedMedicine = usedMedicine;
	}
	public String getUsedMedicinetxt() {
		return UsedMedicinetxt;
	}
	public void setUsedMedicinetxt(String usedMedicinetxt) {
		UsedMedicinetxt = usedMedicinetxt;
	}
	public String getCommunicableIllness() {
		return CommunicableIllness;
	}
	public void setCommunicableIllness(String communicableIllness) {
		CommunicableIllness = communicableIllness;
	}
	public String getCommunicableIllnesstxt() {
		return CommunicableIllnesstxt;
	}
	public void setCommunicableIllnesstxt(String communicableIllnesstxt) {
		CommunicableIllnesstxt = communicableIllnesstxt;
	}
	public String getLossOfConsciousness() {
		return LossOfConsciousness;
	}
	public void setLossOfConsciousness(String lossOfConsciousness) {
		LossOfConsciousness = lossOfConsciousness;
	}
	public String getLossOfConsciousnesstxt() {
		return LossOfConsciousnesstxt;
	}
	public void setLossOfConsciousnesstxt(String lossOfConsciousnesstxt) {
		LossOfConsciousnesstxt = lossOfConsciousnesstxt;
	}

	
	
	
	
	
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
public String getName() {
	return Name;
}
public void setName(String name) {
	this.Name = name;
}
public String getSurname() {
	return Surname;
}
public void setSurname(String surname) {
	this.Surname = surname;
}
public String getTitle() {
	return Title;
}
public void setTitle(String title) {
	this.Title = title;
}
public String getCountry() {
	return Country;
}
public void setCountry(String country) {
	this.Country = country;
}
public String getCity() {
	return City;
}
public void setCity(String city) {
	this.City = city;
}
public String getTown() {
	return Town;
}
public void setTown(String town) {
	this.Town = town;
}
public String getDistrict() {
	return District;
}
public void setDistrict(String district) {
	this.District = district;
}
public String getHomePhoneNumber() {
	return HomePhoneNumber;
}
public void setHomePhoneNumber(String homePhoneNumber) {
	this.HomePhoneNumber = homePhoneNumber;
}
public String getCellPhoneNumber() {
	return CellPhoneNumber;
}
public void setCellPhoneNumber(String cellPhoneNumber) {
	this.CellPhoneNumber = cellPhoneNumber;
}
public String getEposta() {
	return Eposta;
}
public void setEposta(String eposta) {
	this.Eposta = eposta;
}
public String getWebPage() {
	return WebPage;
}
public void setWebPage(String webPage) {
	this.WebPage = webPage;
}
public String getWebPage2() {
	return WebPage2;
}
public void setWebPage2(String webPage2) {
	this.WebPage2 = webPage2;
}

public String getHighSchoolName() {
	return highSchoolName;
}

public void setHighSchoolName(String highSchoolName) {
	this.highSchoolName = highSchoolName;
}

public String getHighSchoolType() {
	return highSchoolType;
}

public void setHighSchoolType(String highSchoolType) {
	this.highSchoolType = highSchoolType;
}

public String getHighSchoolTown() {
	return highSchoolTown;
}

public void setHighSchoolTown(String highSchoolTown) {
	this.highSchoolTown = highSchoolTown;
}

public String getHighSchoolStartDate() {
	return highSchoolStartDate;
}

public void setHighSchoolStartDate(String highSchoolStartDate) {
	this.highSchoolStartDate = highSchoolStartDate;
}

public String getHighSchoolFinishDate() {
	return highSchoolFinishDate;
}

public void setHighSchoolFinishDate(String highSchoolFinishDate) {
	this.highSchoolFinishDate = highSchoolFinishDate;
}

public String getHighSchoolDegree() {
	return highSchoolDegree;
}

public void setHighSchoolDegree(String highSchoolDegree) {
	this.highSchoolDegree = highSchoolDegree;
}

public int getIdBusiness() {
	return idBusiness;
}

public void setIdBusiness(int idBusiness) {
	this.idBusiness = idBusiness;
}

}
