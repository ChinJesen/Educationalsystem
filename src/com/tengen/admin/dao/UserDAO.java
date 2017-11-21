package com.tengen.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tengen.admin.dao.impl.IUserDAO;
import com.tengen.admin.entity.UserInfo;
import com.tengen.core.dao.BaseDAO;
import com.tengen.core.util.JdbcUtil;
import com.tengen.core.util.PageUtil;

public class UserDAO extends BaseDAO<UserInfo> implements IUserDAO {

	@Override
	public UserInfo login(String userno, String password) {
		UserInfo userInfo = null;
		// JDBC���
		Statement stm = null;
		ResultSet rs = null;
		Connection conn = null;
		String sql = "select * from user_info where userNo='" + userno + "' and userPass='" + password + "'";
		try {
			// ��ȡ���ݿ�����
			conn = JdbcUtil.getConn();
			// ����statement����
			stm = conn.createStatement();
			// ִ��SQL
			rs = stm.executeQuery(sql);
			// ѭ����������
			while (rs.next()) {
				userInfo = new UserInfo();
				// �����ݿ��ѯ������������
				userInfo.setUserId(rs.getInt("userId"));
				userInfo.setUserNo(rs.getString("userNo"));
				userInfo.setUserPass(rs.getString("userPass"));
				userInfo.setUserName(rs.getString("userName"));
				userInfo.setUserAge(rs.getInt("userAge"));
				userInfo.setUserSex(rs.getString("userSex"));
				userInfo.setPhone(rs.getString("phone"));
				userInfo.setBirthDay(rs.getString("birthDay"));
				userInfo.setUserFamily(rs.getString("userFamily"));
				userInfo.setId_Card(rs.getString("id_Card"));
				userInfo.setUserNative(rs.getString("userNative"));
				userInfo.setDepartId(rs.getInt("departId"));
				userInfo.setRoleId(rs.getString("roleId"));
				userInfo.setStatus(rs.getInt("status"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConn(conn);
		}
		return userInfo;
	}

	/**
	 * ��֤�˻��Ƿ��ǿ���
	 * 
	 * @param userNo
	 * @return
	 */
	public boolean validUserNo(String userNo) {
		boolean flag = true;
		// JDBC���
		Statement stm = null;
		ResultSet rs = null;
		Connection conn = null;
		String sql = "select count(*) from user_info where userNo='" + userNo + "'";
		try {
			// ��ȡ���ݿ�����
			conn = JdbcUtil.getConn();
			// ����statement����
			stm = conn.createStatement();
			// ִ��SQL
			rs = stm.executeQuery(sql);
			// ѭ����������
			while (rs.next()) {
				if (rs.getInt(1) > 0)
					flag = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			JdbcUtil.closeConn(conn);
		}
		return flag;
	}

	@Override
	public List<UserInfo> queryAlluser() {
		List<UserInfo> userList = new ArrayList<UserInfo>();
		// JDBC������
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "select * from user_info where status='0'";
		try {
			// ��ȡ���ݿ�����
			conn = JdbcUtil.getConn();
			// ����statement����
			pstm = conn.prepareStatement(sql);
			// ִ��SQL
			rs = pstm.executeQuery();
			// ѭ����������
			while (rs.next()) {
				UserInfo userInfo = new UserInfo();
				// �����ݿ��ѯ������������
				userInfo.setUserId(rs.getInt("userId"));
				userInfo.setUserName(rs.getString("userName"));
				userInfo.setUserNo(rs.getString("userNo"));
				userList.add(userInfo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConn(conn);
		}
		return userList;
	}

	@Override
	public Map<Integer, String> getUserMap() {
		List<UserInfo> userList = queryAlluser();
		Map<Integer, String> userMap = new HashMap<Integer, String>();
		for (UserInfo userInfo : userList) {
			userMap.put(userInfo.getUserId(), userInfo.getUserName());
		}
		return userMap;
	}

	public List<UserInfo> queryuser(String userName) {
		PageUtil<UserInfo> pageUtil = new PageUtil<UserInfo>();
		UserInfo usInfo = new UserInfo();
		usInfo.setUserName(userName);
		pageUtil.setEntity(usInfo);
		queryInfo(pageUtil);
		return pageUtil.getList();
	}

	@Override
	public Map<String, String> getCreateUserMap() {
		List<UserInfo> userList = queryAlluser();
		Map<String, String> createUserMap = new HashMap<String, String>();
		for (UserInfo userInfo : userList) {
			createUserMap.put(userInfo.getUserName(), userInfo.getUserNo());
		}
		return createUserMap;
	}

}
