package com.tengen.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tengen.core.dao.BaseDAO;
import com.tengen.core.util.JdbcUtil;
import com.tengen.admin.dao.impl.IRoleMrgDAO;
import com.tengen.admin.entity.RoleInfo;

public class RoleMrgDAO extends BaseDAO<RoleInfo> implements IRoleMrgDAO {

	@Override
	public List<RoleInfo> queryAll() {
		List<RoleInfo> roleList = new ArrayList<RoleInfo>();
		// JDBC������
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "select * from role_info where status='0' and roleId <>'admin'";
		try {
			// ��ȡ���ݿ�����
			conn = JdbcUtil.getConn();
			// ����statement����
			pstm = conn.prepareStatement(sql);
			// ִ��SQL
			rs = pstm.executeQuery();
			// ѭ����������
			while (rs.next()) {
				RoleInfo roleInfo = new RoleInfo();
				// �����ݿ��ѯ������������
				roleInfo.setRoleId(rs.getString("roleId"));
				roleInfo.setRoleName(rs.getString("roleName"));
				roleInfo.setRemark(rs.getString("remark"));
				roleInfo.setStatus(Integer.parseInt(rs.getString("status")));
				roleList.add(roleInfo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConn(conn);
		}
		return roleList;
	}

	@Override
	public Map<String, String> getRoleMap() {
		List<RoleInfo> roleList = queryAll();
		Map<String, String> roleMap = new HashMap<String, String>();
		for (RoleInfo roleInfo : roleList) {
			roleMap.put(roleInfo.getRoleId(), roleInfo.getRoleName());
		}
		return roleMap;
	}

	@Override
	public Map<String, List<String>> getpriveMap() {
		// δʹ��
		// List<RoleInfo> roleList = new ArrayList<RoleInfo>();
		// JDBC������
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "select rp.roleId,rp.priveId from role_info r,role_prive_relation rp where r.roleId=rp.roleId and r.status='0'";
		Map<String, List<String>> rolePriveMap = new HashMap<String, List<String>>();
		try {
			// ��ȡ���ݿ�����
			conn = JdbcUtil.getConn();
			// ����statement����
			pstm = conn.prepareStatement(sql);
			// ִ��SQL
			rs = pstm.executeQuery();
			// ѭ����������
			while (rs.next()) {
				String roleId = rs.getString("roleId");
				String priveId = rs.getString("priveId");
				List<String> list = null;
				if (rolePriveMap.containsKey(roleId)) {
					list = rolePriveMap.get(roleId);
					list.add(priveId);
				} else {
					list = new ArrayList<String>();
					list.add(priveId);
					rolePriveMap.put(roleId, list);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConn(conn);
		}
		return rolePriveMap;
	}

}
