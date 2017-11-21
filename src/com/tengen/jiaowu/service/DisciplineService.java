package com.tengen.jiaowu.service;

import com.tengen.core.service.BaseService;
import com.tengen.jiaowu.dao.DisciplineDAO;
import com.tengen.jiaowu.dao.impl.IDisciplineDAO;
import com.tengen.jiaowu.entity.Discipline_Info;
import com.tengen.jiaowu.service.impl.IDisciplineService;

public class DisciplineService extends BaseService<Discipline_Info> implements IDisciplineService {
	private IDisciplineDAO tp;

	public DisciplineService() {
		tp = new DisciplineDAO();
		setBaseDAO(tp);
	}
}
