package com.tengen.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tengen.core.dao.BaseDAO;
import com.tengen.core.util.JdbcUtil;
import com.tengen.admin.dao.impl.IDepartMargDAO;
import com.tengen.admin.entity.DePartInfo;

public class DepartMargDAO extends BaseDAO<DePartInfo> implements IDepartMargDAO {

	public boolean validDepartName(String departName) {
		boolean flag = true;
		// JDBC���
		Statement stm = null;
		ResultSet rs = null;
		Connection conn = null;
		String sql = "select count(*) from department_info where departName='" + departName + "'";
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
	public List<DePartInfo> queryAll() {
		List<DePartInfo> departList = new ArrayList<DePartInfo>();
		// JDBC������
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "select * from department_info where status='0'";
		try {
			// ��ȡ���ݿ�����
			conn = JdbcUtil.getConn();
			// ����statement����
			pstm = conn.prepareStatement(sql);
			// ִ��SQL
			rs = pstm.executeQuery();
			// ѭ����������
			while (rs.next()) {
				DePartInfo departInfo = new DePartInfo();
				// �����ݿ��ѯ������������
				departInfo.setDepartId(rs.getInt("departId"));
				departInfo.setDepartName(rs.getString("departName"));
				departInfo.setStatus(Integer.parseInt(rs.getString("status")));
				departList.add(departInfo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConn(conn);
		}
		return departList;
	}

	@Override
	public Map<Integer, String> getDepartMap() {
		List<DePartInfo> departList = queryAll();
		Map<Integer, String> departMap = new HashMap<Integer, String>();
		for (DePartInfo departInfo : departList) {
			departMap.put(departInfo.getDepartId(), departInfo.getDepartName());
		}
		return departMap;
	}
}
