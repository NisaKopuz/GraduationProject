package com.huia.service.dao.cv;

import java.io.IOException;

import com.huia.bean.CVInfoBean;

public interface ICvDAO {

	public int AddCvInfo(CVInfoBean cvBean);

	public int AddCvInfoPersonal(CVInfoBean cvBeanPersonal);

	public int AddCvInfoEducation(CVInfoBean cvBeanEducational);

	public int AddCvInfoBusiness(CVInfoBean cvBeanBusiness);

	public int AddCvInfoLanguage(CVInfoBean cvBeanLnguage);

	public int AddCvInfoReference(CVInfoBean cvBeanReference);

	public int AddCvInfoAdditional(CVInfoBean cvBeanAdditional);

	public void insertImage(CVInfoBean image) throws IOException;

	public void DeleteImage(CVInfoBean image, String username);

	public int idContact(String username);

	public int ID(String username);

}
