package com.tengen.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tengen.core.servlet.BaseServlet;
import com.tengen.admin.dao.DepartMargDAO;
import com.tengen.admin.dao.UserDAO;
import com.tengen.admin.entity.DePartInfo;
import com.tengen.admin.entity.UserInfo;
import com.tengen.admin.service.DepartService;
import com.tengen.admin.service.impl.IDepartService;

public class Departsevlet extends BaseServlet<DePartInfo> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6914122802386559036L;
	private IDepartService dpService;

	public Departsevlet() {
		dpService = new DepartService();
		setBaseService(dpService);
		urlMap.put("save_ok", "jsp/departManager/registerDepartInfo.jsp");
		urlMap.put("query_all", "jsp/departManager/showDepartInfo.jsp");
		urlMap.put("queryById_ok", "jsp/departManager/editDepartInfo.jsp");
		urlMap.put("modify_ok", "jsp/departManager/editDepartInfo.jsp");
	}

	// @Override
	protected void valid(HttpServletRequest req, HttpServletResponse resp) {
		DepartMargDAO departDAO = new DepartMargDAO();
		String departName = req.getParameter("departName");
		boolean flag = departDAO.validDepartName(departName);
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

	@Override
	protected void queryusers(HttpServletRequest req, HttpServletResponse resp) {
		UserDAO userDAO = new UserDAO();
		String userName = req.getParameter("userName");
		List<UserInfo> userList = userDAO.queryuser(userName);
		if (userList != null && userList.size() > 0) {
			StringBuffer s = new StringBuffer();
			s.append("{\"item\":[");
			for (UserInfo userInfo : userList) {
				s.append("{");
				s.append("\"userId\":\"").append(userInfo.getUserId()).append("\",");
				s.append("\"phone\":\"").append(userInfo.getPhone()).append("\",");
				s.append("\"userName\":\"").append(userInfo.getUserName()).append("\"");
				s.append("},");
			}
			if (s.lastIndexOf(",") != -1) {
				s = new StringBuffer(s.substring(0, s.length() - 1));
			}
			s.append("]}");

			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("text/html; charset=utf-8");

			PrintWriter out;
			try {
				out = resp.getWriter();
				out.print(s);
				out.flush();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
