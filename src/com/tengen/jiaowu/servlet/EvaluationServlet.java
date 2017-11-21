package com.tengen.jiaowu.servlet;

import com.tengen.core.servlet.BaseServlet;
import com.tengen.jiaowu.entity.Evaluation_Info;
import com.tengen.jiaowu.service.EvaluationService;
import com.tengen.jiaowu.service.impl.IEvaluationService;

public class EvaluationServlet extends BaseServlet<Evaluation_Info> {
	private static final long serialVersionUID = -7283856823426998990L;

	private IEvaluationService adService;

	public EvaluationServlet() {
		super();
		adService = new EvaluationService();
		setBaseService(adService);

		urlMap.put("save_ok", "jsp/Evaluation/registerEvaluationInfo.jsp");
		urlMap.put("query_all", "jsp/Evaluation/showEvaluationInfo.jsp");
		urlMap.put("queryById_ok", "jsp/Evaluation/editEvaluationInfo.jsp");
		urlMap.put("modify_ok", "jsp/Evaluation/editEvaluationInfo.jsp");
	}
}
