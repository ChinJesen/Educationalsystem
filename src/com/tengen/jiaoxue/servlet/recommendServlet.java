package com.tengen.jiaoxue.servlet;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tengen.commonalityInfo.dao.commonalityInfoDAO;
import com.tengen.core.servlet.BaseServlet;
import com.tengen.core.util.StringUtil;
import com.tengen.jiaoxue.entity.recommendInfo;
import com.tengen.jiaoxue.service.recommendService;
import com.tengen.jiaoxue.service.impl.IrecommendService;

/**
 * Servlet implementation class recommendServlet
 */
public class recommendServlet extends BaseServlet<recommendInfo> {
	private static final long serialVersionUID = 1L;
	private IrecommendService recommendService;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public recommendServlet() {
		super();
		recommendService = new recommendService();
		setBaseService(recommendService);
		urlMap.put("save_ok", "jsp/jobMrg/recommend.jsp");
		urlMap.put("query_all", "jsp/jobMrg/recommend_search.jsp");
		urlMap.put("queryById_ok", "jsp/jobMrg/recommend_modify.jsp");
		urlMap.put("modify_ok", "jsp/jobMrg/recommend_modify.jsp");
	}

	/* (non-Javadoc)
	 * @see com.tengen.core.servlet.BaseServlet#getClassIdStu(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	protected void getClassIdStu(HttpServletRequest req, HttpServletResponse resp) {
		String classId = req.getParameter("classId");
		Map<Integer,String> stuMap = commonalityInfoDAO.getStuMap(classId);
		String JsonStr = StringUtil.getJsonStr(stuMap);
		 resp.setContentType("text/html;charset=UTF-8");
		 resp.setCharacterEncoding("UTF-8");
		 PrintWriter out;
		 try {
			out = resp.getWriter();
			out.println(JsonStr);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
