package com.tengen.jiuye.servlet;

import com.tengen.core.servlet.BaseServlet;
import com.tengen.jiuye.entity.EmployInfo;
import com.tengen.jiuye.service.EmployService;
import com.tengen.jiuye.service.iml.IEmployService;

public class EmploySevlet extends BaseServlet<EmployInfo> {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6527002781473893562L;
	private IEmployService employService;

	public EmploySevlet() {
		employService = new EmployService();
		setBaseService(employService);
		urlMap.put("save_ok", "jsp/EmployMrg/Employ.jsp");
		urlMap.put("query_all", "jsp/EmployMrg/ShowEmploy.jsp");
		urlMap.put("queryById_ok", "jsp/EmployMrg/editEmploy.jsp");
		urlMap.put("modify_ok", "jsp/EmployMrg/editEmploy.jsp");
	}
}
