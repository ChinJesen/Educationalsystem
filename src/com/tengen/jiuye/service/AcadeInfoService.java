package com.tengen.jiuye.service;

import com.tengen.core.service.BaseService;
import com.tengen.jiuye.dao.AcadeInfoDAO;
import com.tengen.jiuye.dao.iml.IAcadeInfoDAO;
import com.tengen.jiuye.entity.AcadeInfo;
import com.tengen.jiuye.service.iml.IAcadeInfoService;

public class AcadeInfoService extends BaseService<AcadeInfo> implements IAcadeInfoService {
	private IAcadeInfoDAO acadeInfoDAO;

	public AcadeInfoService() {
		acadeInfoDAO = new AcadeInfoDAO();
		setBaseDAO(acadeInfoDAO);
	}
}
