package com.huia.service.dao.user;

import com.huia.bean.CVInfoBean;

public interface ICvDAO {
	
	public void AddCvInfo(CVInfoBean cvBean);
	public void setCvInfo(CVInfoBean cvBean);
	public void AddCvInfoPersonal(CVInfoBean cvBeanPersonal);
	public void setCvInfoPersonal(CVInfoBean cvBeanPersonal);
	public void AddCvInfoEducation(CVInfoBean cvBeanEducational);
	public void setCvInfoEducation(CVInfoBean cvBeanEducational);
	public void AddCvInfoBusiness(CVInfoBean cvBeanBusiness);
	public void setCvInfoBusiness(CVInfoBean cvBeanBusiness);
	public void AddCvInfoLanguage(CVInfoBean cvBeanLnguage);
	public void setCvInfoLanguage(CVInfoBean cvBeanLnguage);
	public void AddCvInfoReference(CVInfoBean cvBeanReference);
	public void setCvInfoReference(CVInfoBean cvBeanReference);
	public void AddCvInfoAdditional(CVInfoBean cvBeanAdditional);
	public void setCvInfoAdditional(CVInfoBean cvBeanAdditional);
	public void insertImage(CVInfoBean image) ;
	public void updateImage(CVInfoBean image);
    public int idContact(String username);
    public int ID(String username);

}
