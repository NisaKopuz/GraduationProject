package com.huia.service.dao.ad;

import java.util.ArrayList;

import com.huia.bean.AdBean;

public interface IAdDAO {

	public boolean addAdvert(AdBean advert);

	public String showDepartments(int companyId);

	public int getCompanyId(String username);

	public String getCompanyName(int companyid);

	public ArrayList<Integer> getDepartmentIdWithCompanyId(String companyId);

	public ArrayList<Integer> getDepartmentId(String username);

	public ArrayList<Integer> getAdvertIds(int departmentid);

	public ArrayList<String> getAdInformation(int advertid);

	public boolean updateAdvert(AdBean adbean, String advertid);

	public boolean deleteAdvert(String advertid);

	public ArrayList<Integer> getAllDepartmentId();

	public String getAdvertName(int adid);

	public String showDepartmentsWithSelected(int companyId, int dptid);

	public String getCompanyNameWithDepartmentId(int deptid);

	public String getSubmitModal(int adid, String username);

	public void addReference(String username, String companyname,
			String messageuser, int adid);

}