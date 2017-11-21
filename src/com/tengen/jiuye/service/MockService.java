package com.tengen.jiuye.service;

import com.tengen.core.service.BaseService;
import com.tengen.jiuye.dao.MockDAO;
import com.tengen.jiuye.dao.iml.IMockDAO;
import com.tengen.jiuye.entity.MockInfo;
import com.tengen.jiuye.service.iml.IMockService;

public class MockService extends BaseService<MockInfo> implements IMockService {
	private IMockDAO mockDAO;

	public MockService() {
		mockDAO = new MockDAO();
		setBaseDAO(mockDAO);
	}
}
