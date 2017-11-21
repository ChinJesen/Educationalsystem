package com.tengen.jiaowu.servlet;

import com.tengen.core.servlet.BaseServlet;
import com.tengen.jiaowu.entity.Special_situation_Info;
import com.tengen.jiaowu.service.SpecialService;
import com.tengen.jiaowu.service.impl.ISpecialService;

public class SpecialServlet extends BaseServlet<Special_situation_Info> {

	private static final long serialVersionUID = 1L;
	private ISpecialService ipService;

	public SpecialServlet() {
		super();
		ipService = new SpecialService();
		setBaseService(ipService);

		urlMap.put("save_ok", "jsp/Special/registerSpecialInfo.jsp");
		urlMap.put("query_all", "jsp/Special/showSpecialInfo.jsp");
		urlMap.put("queryById_ok", "jsp/Special/editSpecialInfo.jsp");
		urlMap.put("modify_ok", "jsp/Special/editSpecialInfo.jsp");

	}

}
