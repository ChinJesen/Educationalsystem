package com.tengen.admin.servlet;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tengen.core.servlet.BaseServlet;
import com.tengen.admin.dao.UserDAO;
import com.tengen.admin.entity.UserInfo;
import com.tengen.admin.service.UserService;
import com.tengen.admin.service.impl.IUserService;

public class Usersevlet extends BaseServlet<UserInfo> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private IUserService userService;

	public Usersevlet() {
		userService = new UserService();
		setBaseService(userService);
		urlMap.put("save_ok", "jsp/userManager/registerUserInfo.jsp");
		urlMap.put("query_all", "jsp/userManager/showUsers.jsp");
		urlMap.put("queryById_ok", "jsp/userManager/editUserInfo.jsp");
		urlMap.put("modify_ok", "jsp/userManager/editUserInfo.jsp");
	}

	UserDAO userDAO = new UserDAO();

	@Override
	protected void login(HttpServletRequest req, HttpServletResponse resp) {
		String msg = "";
		String userno = req.getParameter("userno");
		String password = req.getParameter("password");
		String url = "home.jsp";
		UserInfo userInfo = userDAO.login(userno, password);
		if (userInfo == null) {
			msg = "用户名或者密码错误！";
			url = "Index.jsp";
		}
		req.getSession().setAttribute("userInfo", userInfo);
		req.setAttribute("msg", msg);
		try {
			req.getRequestDispatcher(url).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void valid(HttpServletRequest req, HttpServletResponse resp) {
		String userNo = req.getParameter("userNo");
		boolean flag = userDAO.validUserNo(userNo);
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
