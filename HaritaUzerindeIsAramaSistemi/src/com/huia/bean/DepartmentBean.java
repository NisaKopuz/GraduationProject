package com.huia.bean;

public class DepartmentBean {

	private String coords;
	private String departmentname;
	private int companyid;

	public String getCoords() {
		return coords;
	}

	public void setCoords(String coords) {
		this.coords = coords;
	}

	public int getCompanyid() {
		return companyid;
	}

	public void setCompanyid(int companyid) {
		this.companyid = companyid;
	}

	public String getDepartmentname() {
		return departmentname;
	}

	public void setDepartmentname(String departmentname) {
		this.departmentname = departmentname;
	}

	public double getCoordX() {
		String[] temp = getCoords().split(";");
		return Double.parseDouble(temp[0]);
	}

	public double getCoordY() {
		String[] temp = getCoords().split(";");
		return Double.parseDouble(temp[1]);
	}
}