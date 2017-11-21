package com.tengen.jiaowu.servlet;

import com.tengen.core.servlet.BaseServlet;
import com.tengen.jiaowu.entity.Class_Info;
import com.tengen.jiaowu.service.ClassService;
import com.tengen.jiaowu.service.impl.IClassService;

@SuppressWarnings("serial")
public class ClassServlet extends BaseServlet<Class_Info>{

	private IClassService adService;
	public ClassServlet()
	{
		super();
		adService = new ClassService();
		setBaseService(adService);
		
		urlMap.put("save_ok","jsp/ClassInfo/registerClassInfo.jsp");
		urlMap.put("query_all", "jsp/ClassInfo/showClassInfo.jsp");
		urlMap.put("queryById_ok", "jsp/ClassInfo/editClassInfo.jsp");
		urlMap.put("modify_ok", "jsp/ClassInfo/editClassInfo.jsp");
	}
}
