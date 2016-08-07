package com.huia.service.dao.map;

import java.sql.SQLException;

import com.huia.bean.AdBean;
import com.huia.bean.DepartmentBean;

public interface IMapDAO {

	public void addDepartment(DepartmentBean dept, String city, String town);

	public String getAdListWithDepartmentId(int deptid, String username)
			throws SQLException;

	public String getAdDetailsWithAdId(int adid, String username)
			throws SQLException;

	public String getMarkerCoords(int deptid) throws SQLException;

	public int getCompanyId(String companyname);

	public String getCompanyName(int deptid);

	public AdBean getAdvertModal(int adid) throws SQLException;
}
