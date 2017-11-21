package com.tengen.commonalityInfo.servlet;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tengen.commonalityInfo.dao.commonalityInfoDAO;
import com.tengen.commonalityInfo.entity.commonalityInfo;
import com.tengen.commonalityInfo.service.commonalityInfoService;
import com.tengen.commonalityInfo.service.impl.IcommonalityInfoService;
import com.tengen.core.servlet.BaseServlet;

public class commonalityInfoServlet extends BaseServlet<commonalityInfo> {
	private static final long serialVersionUID = 1L;

	private IcommonalityInfoService commonalityInfoService;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public commonalityInfoServlet() {
		super();
		commonalityInfoService = new commonalityInfoService();
		setBaseService(commonalityInfoService);
		urlMap.put("save_ok", "jsp/commonalityMrg/registerStudentInfo.jsp");
		urlMap.put("query_all", "jsp/commonalityMrg/commonalityInfo.jsp");
		urlMap.put("queryById_ok", "jsp/commonalityMrg/detailsInfo.jsp");
		urlMap.put("modify_ok", "jsp/commonalityMrg/detailsInfo.jsp");
	}
	
	/* (non-Javadoc)
	 * @see com.tengen.core.servlet.BaseServlet#valid(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 * 
	 * 检查学生姓名是否存在
	 */
	@Override
	protected void valid(HttpServletRequest req, HttpServletResponse resp) {
		
		String stuName = req.getParameter("id");
		boolean flag = commonalityInfoDAO.validstuName(stuName);
		PrintWriter out = null;
		try {
			out = resp.getWriter();
			out.print(flag);
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			out.close();
		}
	}
}
