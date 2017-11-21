package com.tengen.admin.dao.impl;

import java.util.List;
import java.util.Map;

import com.tengen.core.dao.impl.IBaseDAO;
import com.tengen.admin.entity.UserInfo;

public interface IUserDAO extends IBaseDAO<UserInfo>{
	/**
	 * µÇÂ¼ÑéÖ¤
	 * @param userInfo
	 * @return
	 */
	public UserInfo login(String userno, String password);

	public List<UserInfo> queryAlluser();
	public Map<Integer, String> getUserMap();
	public List<UserInfo> queryuser(String userName);

	public Map<String, String> getCreateUserMap();
}
