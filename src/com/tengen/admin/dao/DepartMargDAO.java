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
		// JDBC入库
		Statement stm = null;
		ResultSet rs = null;
		Connection conn = null;
		String sql = "select count(*) from department_info where departName='" + departName + "'";
		try {

			// 获取数据库连接
			conn = JdbcUtil.getConn();
			// 创建statement对象
			stm = conn.createStatement();
			// 执行SQL
			rs = stm.executeQuery(sql);
			// 循环处理结果集
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
		// JDBC入库操作
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "select * from department_info where status='0'";
		try {
			// 获取数据库连接
			conn = JdbcUtil.getConn();
			// 创建statement对象
			pstm = conn.prepareStatement(sql);
			// 执行SQL
			rs = pstm.executeQuery();
			// 循环处理结果集
			while (rs.next()) {
				DePartInfo departInfo = new DePartInfo();
				// 将数据库查询结果放入对象中
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
