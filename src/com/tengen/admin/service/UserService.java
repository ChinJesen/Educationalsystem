package com.tengen.admin.service;

import com.tengen.core.service.BaseService;
import com.tengen.admin.dao.UserDAO;
import com.tengen.admin.dao.impl.IUserDAO;
import com.tengen.admin.entity.UserInfo;
import com.tengen.admin.service.impl.IUserService;

public class UserService extends BaseService<UserInfo> implements IUserService {
	private IUserDAO userDAO;

	public UserService() {
		userDAO = new UserDAO();
		setBaseDAO(userDAO);
	}

}
