package com.tengen.jiaowu.service;

import com.tengen.core.service.BaseService;
import com.tengen.jiaowu.dao.SpecialDAO;
import com.tengen.jiaowu.dao.impl.ISpecialDAO;
import com.tengen.jiaowu.entity.Special_situation_Info;
import com.tengen.jiaowu.service.impl.ISpecialService;

public class SpecialService extends BaseService<Special_situation_Info> implements ISpecialService {
	private ISpecialDAO tp;

	public SpecialService() {
		tp = new SpecialDAO();
		setBaseDAO(tp);
	}
}