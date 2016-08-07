package com.huia.service.dao.map;

import java.io.InputStream;
import java.sql.Date;
import java.util.ArrayList;

import com.huia.bean.AdBean;
import com.huia.service.dao.ad.AdDAOImp;
import com.huia.service.dao.user.UserDAOImp;

public class MapUtilities {

	public String prepareStringForList(int adid, String title,
			String username) {

		/*
		 * if(username == null) { return
		 * "<p id=\"firstHeading\" class=\"firstHeading\" onclick=\"getDetailWindow("
		 * + adid + ")\"><u>" + title +
		 * "<button type=\"button\" class=\"btn btn-xs btn-success pull-right disabled\">Başvur</button></u></p>"
		 * ; } else {
		 * 
		 * return
		 * "<p id=\"firstHeading\" class=\"firstHeading\" onclick=\"getDetailWindow("
		 * + adid + ")\"><u>" + title + "</u></p>" +
		 * ((UserDAOImp.checkReference(username, adid)== false) ?
		 * "<button type=\"button\"  class=\"btn btn-success btn-xs pull-right\"  onclick=\"submitReference("
		 * +adid + ")\">Başvur</button></div></div>" :
		 * "<button type=\"button\"  class=\"btn btn-xs btn-success disabled pull-right\" >Başvurdunuz</button></div></div>"
		 * ); }
		 */

		return "<p id=\"firstHeading\" class=\"firstHeading\" onclick=\"getDetailWindow("
				+ adid + ")\"><u>" + title + "</u></p>";

	}

	public String prepareMultipleSelected(String tablename, String str1,
			String str2, String str3, String str4, String str5) {
		AdDAOImp addao = new AdDAOImp();
		String str = "<ul>";
		if (str1 != null)
			str = str + "<li>" + addao.getNameFromDatabase(tablename,
					Integer.parseInt(str1)) + "</li>";
		if (str2 != null)
			str = str + "<li>" + addao.getNameFromDatabase(tablename,
					Integer.parseInt(str2)) + "</li>";
		if (str3 != null)
			str = str + "<li>" + addao.getNameFromDatabase(tablename,
					Integer.parseInt(str3)) + "</li>";
		if (str4 != null)
			str = str + "<li>" + addao.getNameFromDatabase(tablename,
					Integer.parseInt(str4)) + "</li>";
		if (str5 != null)
			str = str + "<li>" + addao.getNameFromDatabase(tablename,
					Integer.parseInt(str5)) + "</li>";

		return str + "</ul>";
	}

	public String getEducationalLevel(String el) {
		String str = "<ul>";
		if (Character.getNumericValue(el.charAt(0)) == 1)
			str = str + "<li>" + "İlköğretim (Öğrenci) " + "</li>";
		if (Character.getNumericValue(el.charAt(1)) == 1)
			str = str + "<li>" + "İlköğretim (Mezun) " + "</li>";
		if (Character.getNumericValue(el.charAt(2)) == 1)
			str = str + "<li>" + "Lise (Öğrenci) " + "</li>";
		if (Character.getNumericValue(el.charAt(3)) == 1)
			str = str + "<li>" + "Lise (Mezun) " + "</li>";
		if (Character.getNumericValue(el.charAt(4)) == 1)
			str = str + "<li>" + "M.Y.O. (Öğrenci) " + "</li>";
		if (Character.getNumericValue(el.charAt(5)) == 1)
			str = str + "<li>" + "M.Y.O. (Mezun) " + "</li>";
		if (Character.getNumericValue(el.charAt(6)) == 1)
			str = str + "<li>" + "Üniversite (Öğrenci) " + "</li>";
		if (Character.getNumericValue(el.charAt(7)) == 1)
			str = str + "<li>" + "Üniversite (Mezun) " + "</li>";
		if (Character.getNumericValue(el.charAt(8)) == 1)
			str = str + "<li>" + "Yüksek Lisans (Öğrenci) " + "</li>";
		if (Character.getNumericValue(el.charAt(9)) == 1)
			str = str + "<li>" + "YüksekLisans (Mezun) " + "</li>";
		if (Character.getNumericValue(el.charAt(10)) == 1)
			str = str + "<li>" + "Doktora (Öğrenci) " + "</li>";
		if (Character.getNumericValue(el.charAt(11)) == 1)
			str = str + "<li>" + "Doktora (Mezun) " + "</li>";
		if (Character.getNumericValue(el.charAt(12)) == 1)
			str = str + "<li>" + "Doktora ve üstü " + "</li>";

		return str + "</ul>";
	}

	public String getMilitaryStatus(String ms) {
		String str = "<ul>";
		if (Character.getNumericValue(ms.charAt(0)) == 1)
			str = str + "<li>" + "Yapıldı" + "</li>";
		if (Character.getNumericValue(ms.charAt(1)) == 1)
			str = str + "<li>" + "Muaf" + "</li>";
		if (Character.getNumericValue(ms.charAt(2)) == 1)
			str = str + "<li>" + "Yapıldı" + "</li>";
		if (Character.getNumericValue(ms.charAt(3)) == 1)
			str = str + "<li>" + "Tecilli" + "</li>";

		return str + "</ul>";
	}

	public String prepareModal(AdBean advertbean, boolean refEnable, int adid,
			boolean isEmployer) {

		String str = "<div class=\"modal fade\" tabindex=\"-1\" role=\"dialog\""
				+ "aria-labelledby=\"gridSystemModalLabel\" id=\"myModal\" data-backdrop=\"static\" data-keyboard=\"false\">"
				+ "<div class=\"modal-dialog modal-lg\" role=\"document\">"
				+ "<div class=\"modal-content\">"
				+ "<div class=\"modal-header\">"
				+ "<button onclick=\"closeButton()\" type=\"button\" class=\"close\" data-dismiss=\"modal\""
				+ "aria-label=\"Close\">"
				+ "<span aria-hidden=\"true\">&times;</span>" + "</button>"
				+ "<h6 class=\"modal-title\" id=\"gridSystemModalLabel\">"
				+ "<div class=\"row\">" + "<div class=\"col-md-8\"><h2>"
				+ advertbean.getTitle() + "</h2></div>"
				+ "<div class=\"col-md-4\">" 
				/* Sosyal medya kısımları - Didem (izel tarafından eklendi)*/ 
				+ "<div class=\"row\"><br>"
				+ "<div class=\"col-xs-4\">"
				+"<div class=\"fb-share-button\" data-href=\"http://localhost:8080/HaritaUzerindeIsArama/showadvert.jsp?advertId="+adid+"\" data-layout=\"button\" data-mobile-iframe=\"true\"></div>"
				+"</div>"
				+ "<div class=\"col-xs-4\">"
				+"<script type=\"IN/Share\" data-url=\"http://localhost:8080/HaritaUzerindeIsArama/showadvert.jsp?advertId="+ adid +"\"></script>"
				+"</div>"
				+ "<div class=\"col-xs-4\">"
				+"<a href=\"https://twitter.com/share\" class=\"twitter-share-button\" target=\"_blank\" data-url=\"http://localhost:8080/HaritaUzerindeIsArama/showadvert.jsp?advertId="+ adid +"\"data-lang=\"tr\" data-via=\"isburadaa\" ></a>"
				+"</div>"
				+ "</div>"
		
				/* ---- */
				+ "</div>" + "</div>"
				+ "<div class=\"row\">"
				+ "<div class=\"col-md-12 small\"> <h5>İlan Yayınlama Tarihi: <em>"
				+ advertbean.getPostingdate() + "</em></h5></div>" + "</div>"
				+ "<div class=\"row\">"
				+ "<div class=\"col-md-12 small\"> <h5>Son Değiştirme Tarihi: <em>"
				+ advertbean.getUpdateddate() + "</em></h5></div>" + "</div>"
				+ "<div class=\"row\"> <div class=\"col-md-8 small\">"
				+ "<h5>Son Başvuru Tarihi: <em>" + advertbean.getLastapplydate()
				+ "</em></h5></div>" + "<div class=\"col-md-4\">"
				+ ((isEmployer == false)
						? (((refEnable == false)
								? "<button type=\"button\"  class=\"btn btn-success btn-block pull-right\"  onclick=\"submitReference("
										+ adid
										+ ")\">Başvur</button></div></div>"
								: "<button type=\"button\"  class=\"btn btn-success btn-block disabled pull-right\" >Başvurdunuz</button></div></div>"))
						: "</div></div>")
				+ "</div>" + "<div class=\"modal-body\" id=\"expandModal\">"
				+ "<div class=\"container-fluid\">" + "<div class=\"row\">"
				+ "<div class=\"col-md-12\"><strong>Genel Nitelikler :</strong> <br>"
				+ "<div>" + advertbean.getQualifications() + "</div></div>"
				+ "</div>" + "<br><hr>" + "<div class=\"row\">"
				+ "<div class=\"col-md-3\"><strong> İş Alanı : </strong></div>"
				+ "<div class=\"col-md-3\">"
				+ prepareMultipleSelected("tbljobfield",
						advertbean.getJobfield1(), advertbean.getJobfield2(),
						advertbean.getJobfield3(), advertbean.getJobfield4(),
						advertbean.getJobfield5())
				+ " </div>"
				+ "<div class=\"col-md-3\"><strong> Firma Sektörü : </strong></div>"
				+ "<div class=\"col-md-3\">"
				+ prepareMultipleSelected("tblsector", advertbean.getSector1(),
						advertbean.getSector2(), advertbean.getSector3(),
						advertbean.getSector4(), advertbean.getJobfield5())
				+ "</div>" + "</div>" + "<br><hr>" + "<div class=\"row\">"
				+ "<div class=\"col-md-3\"><strong> Pozisyon Tipi : </strong></div>"
				+ "<div class=\"col-md-3\">"
				+ prepareMultipleSelected("tblpositiontype",
						advertbean.getPositiontype(), null, null, null, null)
				+ "</div>"
				+ "<div class=\"col-md-3\"><strong> Pozisyon Seviyesi :  </strong></div>"
				+ "<div class=\"col-md-3\">"
				+ prepareMultipleSelected("tblpositionlevel",
						advertbean.getPositionlevel(), null, null, null, null)
				+ "</div>" + "</div>";
		if ((advertbean.isShownumberofpersonnel() == true)
				|| (advertbean.isShownetsalary() == true)) {
			str += "<br><hr><div class=\"row\">";

			if (advertbean.isShownumberofpersonnel() == true) {
				str += "<div class=\"col-md-3\"><strong> İş Alınacak Personel Sayısı: </strong></div>"
						+ "<div class=\"col-md-3\">"
						+ advertbean.getNumberofpersonnel() + "</div>";
			}
			if (advertbean.isShownetsalary() == true) {

				str += "<div class=\"col-md-3\"><strong> Maaş : </strong></div>"
						+ "<div class=\"col-md-3\">" + advertbean.getNetsalary()
						+ "</div>";
			}
			str += "</div>";
		}

		if (!(advertbean.getEducationallevel().equals("0000000000000"))
				|| !(advertbean.getMilitaryStatus().equals("0000"))) {
			str += "<br><hr><div class=\"row\">";
			if (!(advertbean.getEducationallevel().equals("0000000000000"))) {
				str += "<div class=\"col-md-3\"><strong> Eğitim Durumu : </strong></div>"
						+ "<div class=\"col-md-3\">"
						+ getEducationalLevel(advertbean.getEducationallevel())
						+ "</div>";
			}
			if (!(advertbean.getMilitaryStatus().equals("0000"))) {
				str += "<div class=\"col-md-3\"> <strong>Askerlik Durumu : </strong></div>"
						+ "<div class=\"col-md-3\">"
						+ getMilitaryStatus(advertbean.getMilitaryStatus())
						+ "</div>";
			}
			str += "</div>";
		}

		if (!(advertbean.getExperience().equals(""))
				|| !(advertbean.getGender().equals("")))
			str += "<br><hr><div class=\"row\">";
		{
			if (!(advertbean.getExperience().equals(""))) {
				str += "<div class=\"col-md-3\"><strong> Tecrübe : </strong></div>"
						+ "<div class=\"col-md-3\">"
						+ advertbean.getExperience() + "</div>";
			}
			if (!(advertbean.getGender().equals(""))) {
				str += "<div class=\"col-md-3\"> <strong>Cinsiyet :</strong> </div>"
						+ "<div class=\"col-md-3\">" + advertbean.getGender()
						+ "</div>";
			}
			str += "</div>";
		}

		if (advertbean.getLastposition1() != null
				|| advertbean.getLastsector1() != null) {
			str += "<br><hr><div class=\"row\">";

			if (!(advertbean.getLastposition1().equals(null))) {
				str += "<div class=\"col-md-3\"><strong> İş Tecrübesindeki Geçmiş Pozisyon : </strong></div>"
						+ "<div class=\"col-md-3\">"
						+ prepareMultipleSelected("tblpositionlevel",
								advertbean.getLastposition1(),
								advertbean.getLastposition2(),
								advertbean.getLastposition3(),
								advertbean.getLastposition4(),
								advertbean.getLastposition5())
						+ "</div>";
			}
			if (advertbean.getLastsector1() != null) {
				str += "<div class=\"col-md-3\"> <strong>İş Tecrübesindeki Geçmiş Sektör : </strong></div>"
						+ "<div class=\"col-md-3\">"
						+ prepareMultipleSelected("tblsector",
								advertbean.getLastsector1(),
								advertbean.getLastsector2(),
								advertbean.getLastsector3(),
								advertbean.getLastsector4(),
								advertbean.getLastsector5())
						+ "</div>";
			}
			str += "</div>";
		}

		if (advertbean.getUniversity1() != null
				|| advertbean.getUniversitySection1() != null) {
			str += "<br><hr><div class=\"row\">";

			if (advertbean.getUniversity1() != null) {
				str += "<div class=\"col-md-3\"><strong> Üniversite  : </strong></div>"
						+ "<div class=\"col-md-3\">"
						+ prepareMultipleSelected("tbluniversity",
								advertbean.getUniversity1(),
								advertbean.getUniversity2(),
								advertbean.getUniversity3(),
								advertbean.getUniversity4(),
								advertbean.getUniversity5())
						+ "</div>";
			}
			if (advertbean.getUniversitySection1() != null) {
				str += "<div class=\"col-md-3\"> <strong> Üniversite Bölüm : </strong></div>"
						+ "<div class=\"col-md-3\">"
						+ prepareMultipleSelected("tbluniversitysection",
								advertbean.getUniversitySection1(),
								advertbean.getUniversitySection2(),
								advertbean.getUniversitySection3(),
								advertbean.getUniversitySection4(),
								advertbean.getUniversitySection5())
						+ "</div>";
			}
			str += "</div>";
		}

		if (!(advertbean.getCity().equals("0"))
				|| (advertbean.getMinage() != 0)) {
			str += "<br><hr><div class=\"row\">";
			if (!(advertbean.getCity().equals("0"))) {
				str += "<div class=\"col-md-3\"><strong> Yaşadığı Yer  : </strong></div>"
						+ "<div class=\"col-md-3\">"
						+ prepareMultipleSelected("tblcity",
								advertbean.getCity(), null, null, null, null)
						+ "</div>";
			}
			if (advertbean.getMinage() != 0) {
				str += "<div class=\"col-md-3\"> <strong>Yaş Aralığı : </strong></div>";
				if (advertbean.getMinage() != 0) {
					str += "<div class=\"col-md-3\">" + advertbean.getMinage()
							+ " - " + advertbean.getMaxage() + "</div>"
							+ "</div>" + "<br><hr>";
				} else
					str += "<div class=\"col-md-3\">" + "</div>";

			}
			str += "</div>";
		}

		if (!(advertbean.getDrivinglicence().equals(""))
				|| advertbean.getForeignlanguage1() != null) {
			str += "<br><hr><div class=\"row\">";

			if (!(advertbean.getDrivinglicence().equals(""))) {
				str += "<div class=\"col-md-3\"><strong> Ehliyet  : </strong></div>"
						+ "<div class=\"col-md-3\">"
						+ prepareMultipleSelected("tbldrivinglicence",
								advertbean.getDrivinglicence(), null, null,
								null, null)
						+ "</div>";
			}
			if (advertbean.getForeignlanguage1() != null) {
				str += "<div class=\"col-md-3\"><strong> Yabancı Dil :</strong> </div>"
						+ "<div class=\"col-md-3\">"
						+ 
							 prepareMultipleSelected("tbllanguage",
							 advertbean.getForeignlanguage1(),
							 advertbean.getForeignlanguage2(),
							 advertbean.getForeignlanguage3(),
							  advertbean.getForeignlanguage4(),
							 advertbean.getForeignlanguage5())+
							  "</div>";
			}
			str += "</div>";
		}
		str += "</div></div>"
				// +"<div id=\"modalFooter\"><div class=\"modal-footer\"
				// >"
				// + "<button type=\"button\" class=\"btn btn-default\"
				// data-dismiss=\"modal\">Close</button>"
				// + "<button type=\"button\" class=\"btn
				// btn-primary\">Save
				// changes</button>" + "</div></div>"
				+ "</div></div>";
		return str;

	}

	public String prepareStringForDetails(AdBean advertbean, int adid,
			String username) {
		AdDAOImp addao = new AdDAOImp();

		String str = "<div class=\"container-fluid\">" + "<div class=\"row\">"
				+ "<div class=\"col-md-8\"><h3>" + advertbean.getTitle()
				+ "</h3></div>"
				+ "<div class=\"col-md-4\"><br><button type=\"button\" class=\"btn btn-primary \" data-toggle=\"modal\" data-target=\"#myModal\">Detaylar</button></div>"
				+ prepareModal(advertbean,
						UserDAOImp.checkReference(username, adid), adid,
						UserDAOImp.isEmployer(username))
				+ "</div>" + "<div class=\"row\">"
				+ "<div class=\"col-md-12 small\"> İlan Yayınlama Tarihi: <em>"
				+ advertbean.getPostingdate() + "</em></div>" + "</div>"
				+ "<div class=\"row\">"
				+ "<div class=\"col-md-12 small\"> Son Başvuru Tarihi: <em>"
				+ advertbean.getLastapplydate() + "</em></div>" + "</div>"
				+ "</div>" + "<hr>" + "<div class=\"row\">"
				+ "<div class=\"col-md-12\"><strong>Genel Nitelikler :</strong> <br>"
				+ "<div class=\"pre-scrollable\" style=\"max-height:150px\">"
				+ advertbean.getQualifications() + "</div></div>" + "</div>" +

		"<br>" + "<div class=\"row\">" + "<div class=\"col-md-12\">"
				+ "<div class=\"detailBox\">" + "<div class=\"titleBox\">"
				+ "<button type=\"button\" class=\"btn \" data-toggle=\"modal\""
				+ "data-target=\"#myCommentModal\">"
				+ "<span class=\"glyphicon glyphicon-expand\"></span>"
				+ "</button>" + "</div>" + "<div class=\"actionBox\">"
				+ "<input type=\"hidden\" id=\"AdId\" name=\"AdId\" value=\""
				+ adid + "\">" + addao.getComments(adid, 2)
				// get comments here

				+ "</div>" + "</div>" + "</div>"
				+ "<div id=\"myCommentModal\" class=\"modal fade\" role=\"dialog\">"
				+ "<div class=\"modal-dialog\">"
				+ "<div class=\"modal-content\">"
				+ "<div class=\"modal-header\">"
				+ "<a class=\"close\" data-dismiss=\"modal\">&times;</a>"
				+ "<h4 class=\"modal-title text-center\">"
				+ "<strong>YORUMLAR</strong>" + "</h4>" + "</div>"
				+ "<div class=\"modal-body\">"
				+ "<ul id=\"modalList\" class=\"commentList\">"
				+ addao.getComments(adid, 0) + "</ul>" + "</div>"

				+ "<div class=\"modal-footer\">"
				+ "<form action=\"AddPhoto\" method=\"post\" class=\"form-inline\"  enctype=\"multipart/form-data\">"
				+ "<div class=\"form-group pull-left\">"
				+ "<input type=\"hidden\" id=\"AdId\" name=\"AdId\" value=\""
				+ adid + "\">"
				+ "<input class=\"form-control\" style=\"width: 350px;\" type=\"text\" id=\"commentText\" maxlength=\"250\" value=\"\" name=\"commentText\""
				+ "placeholder=\"Yorum Giriniz\" />" + "</div>"
				+ "<div class=\"form-group\">"
				+ "<button type=\"button\" class=\"btn btn-default\" onclick=\"getLocation()\" id=\"findLocation\" name=\"findLocation\">"
				+ "<span class=\"glyphicon glyphicon-pushpin\"></span>"
				+ "</button>"
				+ "<input type=\"hidden\" name=\"location\" id=\"location\">"
				+ "</div>" + "<div class=\"form-group\">"
				+ "<span class=\"btn btn-default btn-file\">"
				+ "<span class=\"glyphicon glyphicon-picture\"></span> <input type=\"file\"   name=\"photo\" accept=\"image/*\"/>"
				+ "</span>" + "</div>" + "<div class=\"form-group\">"
				+ "<button type=\"submit\" id=\"yorumeklebtn\"  onclick=\"addComment()\" class=\"btn btn-default\">Yorum Ekle</button>"
				+ "</div>" + "</form>" + "</div>" +
				/*
				 * "<div class=\"col-md-3\"><strong> Ýþ Alaný : </strong></div>"
				 * + "<div class=\"col-md-3\">" +
				 * prepareMultipleSelected("tbljobfield",
				 * advertbean.getJobfield1(), advertbean.getJobfield2(),
				 * advertbean.getJobfield3(), advertbean.getJobfield4(),
				 * advertbean.getJobfield5()) + " </div>"+
				 * "<div class=\"col-md-3\"><strong> Firma Sektörü : </strong></div>"
				 * + "<div class=\"col-md-3\">" +
				 * prepareMultipleSelected("tblsector", advertbean.getSector1(),
				 * advertbean.getSector2(), advertbean.getSector3(),
				 * advertbean.getSector4(), advertbean.getJobfield5()) +
				 * "</div>"+ "</div>"+ "<br>"+ "<div class=\"row\">"+
				 * "<div class=\"col-md-3\"><strong> Pozisyon Tipi : </strong></div>"
				 * + "<div class=\"col-md-3\">"+
				 * prepareMultipleSelected("tblpositiontype",
				 * advertbean.getPositiontype(), null, null, null, null)+
				 * "</div>"+
				 * "<div class=\"col-md-3\"><strong> Pozisyon Seviyesi :  </strong></div>"
				 * + "<div class=\"col-md-3\">"+
				 * prepareMultipleSelected("tblpositionlevel",
				 * advertbean.getPositionlevel(), null, null, null, null)+
				 * "</div>"+ "</div>"+ "<br>"+ "<div class=\"row\">"+
				 * "<div class=\"col-md-3\"><strong> Ýþe Alýnacak Personel Sayýsý : </strong></div>"
				 * + "<div class=\"col-md-3\">" + (
				 * (advertbean.isShownumberofpersonnel()== true) ?
				 * advertbean.getNumberofpersonnel() : " - " ) + "</div>"+
				 * "<div class=\"col-md-3\"><strong> Maaþ : </strong></div>"+
				 * "<div class=\"col-md-3\">" + (
				 * (advertbean.isShownetsalary()== true) ?
				 * advertbean.getNetsalary() : " - " ) + "</div>"+ "</div>"+
				 * "<br>"+ "<div class=\"row\">"+
				 * "<div class=\"col-md-3\"><strong> Eðitim Durumu : </strong></div>"
				 * + "<div class=\"col-md-3\">" +
				 * getEducationalLevel(advertbean.getEducationallevel()) +
				 * "</div>"+
				 * "<div class=\"col-md-3\"> <strong>Askerlik Durumu : </strong></div>"
				 * + "<div class=\"col-md-3\">" +
				 * getMilitaryStatus(advertbean.getMilitaryStatus()) + "</div>"+
				 * "</div>"+ "<br>"+ "<div class=\"row\">"+
				 * "<div class=\"col-md-3\"><strong> Tecrübe : </strong></div>"+
				 * "<div class=\"col-md-3\">" + advertbean.getExperience() +
				 * "</div>"+
				 * "<div class=\"col-md-3\"> <strong>Cinsiyet :</strong> </div>"
				 * + "<div class=\"col-md-3\">" + advertbean.getGender() +
				 * "</div>"+ "</div>"+ "<br>"+ "<div class=\"row\">"+
				 * "<div class=\"col-md-3\"><strong> Ýþ Tecrübesindeki Geçmiþ Pozisyon : </strong></div>"
				 * + "<div class=\"col-md-3\">" +
				 * prepareMultipleSelected("tblpositiontype",
				 * advertbean.getLastposition1(), advertbean.getLastposition2(),
				 * advertbean.getLastposition3(), advertbean.getLastposition4(),
				 * advertbean.getLastposition5()) + "</div>"+
				 * "<div class=\"col-md-3\"> <strong>Ýþ Tecrübesindeki Geçmiþ Sektör : </strong></div>"
				 * + "<div class=\"col-md-3\">" +
				 * prepareMultipleSelected("tblsector",
				 * advertbean.getLastsector1(), advertbean.getLastsector2(),
				 * advertbean.getLastsector3(), advertbean.getLastsector4(),
				 * advertbean.getLastsector5()) + "</div>"+ "</div>"+ "<br>"+
				 * "<div class=\"row\">"+
				 * "<div class=\"col-md-3\"><strong> Üniversite  : </strong></div>"
				 * + "<div class=\"col-md-3\">" +
				 * prepareMultipleSelected("tbluniversity",
				 * advertbean.getUniversity1(), advertbean.getUniversity2(),
				 * advertbean.getUniversity3(), advertbean.getUniversity4(),
				 * advertbean.getUniversity5()) + "</div>"+
				 * "<div class=\"col-md-3\"> <strong>Üniversite Bölüm : </strong></div>"
				 * + "<div class=\"col-md-3\">" +
				 * prepareMultipleSelected("tbluniversitysection",
				 * advertbean.getUniversitySection1(),
				 * advertbean.getUniversitySection2(),
				 * advertbean.getUniversitySection3(),
				 * advertbean.getUniversitySection4(),
				 * advertbean.getUniversitySection5()) + "</div>"+ "</div>"+
				 * "<br>"+ "<div class=\"row\">"+
				 * "<div class=\"col-md-3\"><strong> Yaþadýðý Yer  : </strong></div>"
				 * + "<div class=\"col-md-3\">"+
				 * prepareMultipleSelected("tblcity", advertbean.getCity(),
				 * null, null, null, null)+ "</div>"+
				 * "<div class=\"col-md-3\"> <strong>Yaþ Aralýgý : </strong></div>"
				 * + "<div class=\"col-md-3\">" + advertbean.getMinage() + " - "
				 * + advertbean.getMaxage() + "</div>"+ "</div>"+ "<br>"+
				 * "<div class=\"row\">"+
				 * "<div class=\"col-md-3\"><strong> Ehliyet  : </strong></div>"
				 * + "<div class=\"col-md-3\">"+
				 * prepareMultipleSelected("tbldrivinglicence",
				 * advertbean.getDrivinglicence(), null, null, null, null)+
				 * "</div>"+
				 * "<div class=\"col-md-3\"><strong> Yabancý Dil :</strong> </div>"
				 * + "<div class=\"col-md-3\">"+
				 * prepareMultipleSelected("tbllanguage",
				 * advertbean.getForeignlanguage1(),
				 * advertbean.getForeignlanguage2(),
				 * advertbean.getForeignlanguage3(),
				 * advertbean.getForeignlanguage4(),
				 * advertbean.getForeignlanguage5())+ "</div>"+ "</div>"
				 */"";

		return str;

	}

	public String prepareComments(int commentid, Date d, String text,
			String lct, InputStream photo, String username) {
		UserDAOImp udao = new UserDAOImp();

		String rtn = "";
		ArrayList<String> userinfo = udao.usernameandsurname(username);
		if (!udao.isUserHavePicture(username)) {
			rtn = "<li>" + "<div class=\"commenterImage\">"
					+ "<img src=\"http://vignette3.wikia.nocookie.net/glee-new-beginnings/images/f/fd/Unknown.gif/revision/latest?cb=20130205144914\" />"
					+ "</div>";
		} else {
			rtn = "<li>" + "<div class=\"commenterImage\">"
					+ "<img src=\"ProfileImage.jsp\" alt=\"Photo\">"
					+ "</div>";

		}

		rtn += "<div class=\"commentText\">" + "<p class=\"\"> <b>"
				+ userinfo.get(0) + " " + userinfo.get(1) + "</b>  ";

		if (text != null) {
			rtn += text;
		}
		rtn += "</p>";
		if (photo != null)
			rtn += "<br/><img height=\"45\" width=\"45\"  src=\"/HaritaUzerindeIsArama/GetPhoto?adid="
					+ commentid + "\" />";
		rtn += "<br/>";
		rtn += "<span class=\"date sub-text\">" + d;
		if (lct != null) {
			rtn += " &#8226 " + lct;
			rtn += "</span>" + "</div>" + "</li>";
		}
		return rtn;

	}
}
