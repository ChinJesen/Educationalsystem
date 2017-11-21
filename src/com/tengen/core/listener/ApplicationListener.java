package com.tengen.core.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.tengen.core.util.CommUtil;

public class ApplicationListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub

	}

	/**
	 * 服务器启动时调用
	 */
	@Override
	public void contextInitialized(ServletContextEvent event) {
		ServletContext application = event.getServletContext();

		application.setAttribute("groupMap", CommUtil.newInstance().getGroupMap());
		application.setAttribute("test", CommUtil.newInstance().getDictMap());
		application.setAttribute("roleMap", CommUtil.newInstance().getRoleMap());
		application.setAttribute("departMap", CommUtil.newInstance().getDepartMap());
		application.setAttribute("userMap", CommUtil.newInstance().getUserMap());
		application.setAttribute("createUserMap", CommUtil.newInstance().getCreateUserMap());
		application.setAttribute("classMap", CommUtil.newInstance().getClassMap());
		application.setAttribute("stuNameMap", CommUtil.newInstance().getStuNameMap());
	}

}
