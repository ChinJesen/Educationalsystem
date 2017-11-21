package com.tengen.jiuye.service;

import com.tengen.core.service.BaseService;
import com.tengen.jiuye.dao.EmployInfoDAO;
import com.tengen.jiuye.dao.iml.IEmployInfoDAO;
import com.tengen.jiuye.entity.EmployInfo;
import com.tengen.jiuye.service.iml.IEmployService;

public class EmployService extends BaseService<EmployInfo> implements IEmployService {
	private IEmployInfoDAO employInfoDAO;

	public EmployService() {
		employInfoDAO = new EmployInfoDAO();
		setBaseDAO(employInfoDAO);
	}
}
