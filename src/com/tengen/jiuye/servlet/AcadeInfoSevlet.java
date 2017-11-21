package com.tengen.jiuye.servlet;

import com.tengen.core.servlet.BaseServlet;
import com.tengen.jiuye.entity.AcadeInfo;
import com.tengen.jiuye.service.AcadeInfoService;
import com.tengen.jiuye.service.iml.IAcadeInfoService;

public class AcadeInfoSevlet extends BaseServlet<AcadeInfo> {

	private static final long serialVersionUID = -6170552503020538607L;
	private IAcadeInfoService acadeInfoService;

	public AcadeInfoSevlet() {
		acadeInfoService = new AcadeInfoService();
		setBaseService(acadeInfoService);
		urlMap.put("save_ok", "jsp/AcadeMrg/AcadeInfoMrg.jsp");
		urlMap.put("query_all", "jsp/AcadeMrg/ShowAcadeInfo.jsp");
		urlMap.put("queryById_ok", "jsp/AcadeMrg/editAcadeInfo.jsp");
		urlMap.put("modify_ok", "jsp/AcadeMrg/editAcadeInfo.jsp");
	}
}
