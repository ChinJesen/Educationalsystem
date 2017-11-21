package com.tengen.core.util;

import java.util.List;
import java.util.Map;

import com.tengen.admin.dao.DepartMargDAO;
import com.tengen.admin.dao.DictMargDAO;
import com.tengen.admin.dao.RoleMrgDAO;
import com.tengen.admin.dao.UserDAO;
import com.tengen.admin.dao.impl.IDepartMargDAO;
import com.tengen.admin.dao.impl.IDictMargDAO;
import com.tengen.admin.dao.impl.IRoleMrgDAO;
import com.tengen.admin.dao.impl.IUserDAO;
import com.tengen.admin.entity.DictItem;
import com.tengen.commonalityInfo.dao.commonalityInfoDAO;
import com.tengen.commonalityInfo.dao.impl.IcommonalityInfoDAO;
import com.tengen.jiaowu.dao.ClassDAO;
import com.tengen.jiaowu.dao.impl.IClassDAO;

public class CommUtil {
	private static CommUtil commutil;
	private Map<String, Map<String, String>> dictMap;
	private Map<String, List<DictItem>> dictList;
	private Map<String, String> groupMap;
	private Map<String, String> roleMap;
	private Map<String, List<String>> rolePriveMap;
	private Map<Integer, String> departMap;
	private Map<Integer, String> userMap;
	private Map<String, String> createUserMap;
	private Map<Integer, String> classMap;
	private Map<Integer, String> stuNameMap;

	private CommUtil() {
		init();
	}

	private void init() {
		IDepartMargDAO departDAO = new DepartMargDAO();
		IDictMargDAO dictDAO = new DictMargDAO();
		IRoleMrgDAO roleDAO = new RoleMrgDAO();
		IUserDAO userDAO = new UserDAO();
		IClassDAO classDAO = new ClassDAO();
		IcommonalityInfoDAO commonalityInfoDAO = new commonalityInfoDAO();
		
		dictMap = dictDAO.getDictMap();
		groupMap = dictDAO.getGroupMap();
		dictList = dictDAO.getDictList();
		roleMap = roleDAO.getRoleMap();
		rolePriveMap = roleDAO.getpriveMap();
		departMap = departDAO.getDepartMap();
		userMap = userDAO.getUserMap();
		createUserMap = userDAO.getCreateUserMap();
		classMap = classDAO.getClassMap();
		stuNameMap = commonalityInfoDAO.getStuNameMap();
		// classMap = clsDAO.queryClassMap();

	}

	public void refresh() {
		init();
	}
	/*
	 * public void refeshClassMap() { IClassMrgDAO clsDAO = new ClassMrgDAO();
	 * classMap = clsDAO.queryClassMap(); }
	 */

	public static CommUtil newInstance() {
		if (commutil == null) {
			commutil = new CommUtil();
		}
		return commutil;
	}

	public Map<String, String> getDictMapVal(String groupCode) {
		return dictMap.get(groupCode);
	}

	public Map<String, Map<String, String>> getDictMap() {
		return dictMap;
	}

	public List<DictItem> getDictList(String groupCode) {
		return dictList.get(groupCode);
	}

	public Map<String, String> getGroupMap() {
		return groupMap;
	}

	public Map<String, String> getRoleMap() {
		return roleMap;
	}

	public List<String> getroleList(String roleId) {
		return rolePriveMap.get(roleId);
	}

	public Map<String, List<String>> getRolePriveMap() {
		return rolePriveMap;
	}

	/*
	 * public Map<Integer, String> getClassMap() { return classMap; }
	 */
	public Map<Integer, String> getDepartMap() {
		return departMap;
	}

	public Map<Integer, String> getUserMap() {
		return userMap;
	}

	public Map<String, String> getCreateUserMap() {
		// TODO Auto-generated method stub
		return createUserMap;
	}

	public Map<Integer, String> getClassMap() {
		// TODO Auto-generated method stub
		return classMap;
	}

	/**
	 * @return
	 */
	public Map<Integer,String> getStuNameMap() {
		// TODO Auto-generated method stub
		return stuNameMap;
	}

}
