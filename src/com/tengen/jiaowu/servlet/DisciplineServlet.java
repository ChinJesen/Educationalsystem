package com.tengen.jiaowu.servlet;

import com.tengen.core.servlet.BaseServlet;
import com.tengen.jiaowu.entity.Discipline_Info;
import com.tengen.jiaowu.service.DisciplineService;
import com.tengen.jiaowu.service.impl.IDisciplineService;

public class DisciplineServlet extends BaseServlet<Discipline_Info> {
	private static final long serialVersionUID = -7283856823426998990L;

	private IDisciplineService dpService;

	public DisciplineServlet() {
		super();
		dpService = new DisciplineService();
		setBaseService(dpService);

		urlMap.put("save_ok", "jsp/Discipline/registerDisciplineInfo.jsp");
		urlMap.put("query_all", "jsp/Discipline/showDisciplineInfo.jsp");
		urlMap.put("queryById_ok", "jsp/Discipline/editDisciplineInfo.jsp");
		urlMap.put("modify_ok", "jsp/Discipline/editDisciplineInfo.jsp");
	}
}
