package com.tengen.jiaowu.service;

import com.tengen.core.service.BaseService;
import com.tengen.jiaowu.dao.EvaluationDAO;
import com.tengen.jiaowu.dao.impl.IEvaluationDAO;
import com.tengen.jiaowu.entity.Evaluation_Info;
import com.tengen.jiaowu.service.impl.IEvaluationService;

public class EvaluationService extends BaseService<Evaluation_Info> implements IEvaluationService {
	private IEvaluationDAO ad;

	public EvaluationService() {
		ad = new EvaluationDAO();
		setBaseDAO(ad);
	}
}
