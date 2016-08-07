package com.huia.service.dao.user;

import java.sql.SQLException;
import java.util.ArrayList;

import com.huia.bean.CompanyBean;
import com.huia.bean.UserBean;

public interface IUserDAO {

	public void AddEmployerUser(UserBean user, CompanyBean company)
			throws SQLException;

	public ArrayList<String> getUserInformation(String username);

	public void updateUserRegistrationWithoutPassword(UserBean user);

	public void updateUserRegistration(UserBean user);

	public boolean controlPassword(String username, String password);

	public boolean isUserNameExist(String username);

	public void AddUser(UserBean user);

	public ArrayList<String> getReferencesInformation(String username);

	public String getMessageForUser(int adid, String username);

	public void changeMessageStatusForUser(int adid, String username);

	public void deleteReferences(int adid, String username);

	public void SendMailEmployertoApplicant(String mail, String username,
			int adid);

	public void changeMessageStatusForEmployer(String username, int adid);

	public String getMessageForEmployer(String username, int adid);

	public ArrayList<String> usernameandsurname(String username);
}
