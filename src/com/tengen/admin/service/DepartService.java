package com.tengen.admin.service;

import com.tengen.core.service.BaseService;
import com.tengen.admin.dao.DepartMargDAO;
import com.tengen.admin.dao.impl.IDepartMargDAO;
import com.tengen.admin.entity.DePartInfo;
import com.tengen.admin.service.impl.IDepartService;

public class DepartService extends BaseService<DePartInfo> implements IDepartService {
	private IDepartMargDAO dpDAO;

	public DepartService() {
		dpDAO = new DepartMargDAO();
		setBaseDAO(dpDAO);

	}
}
