package com.tengen.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.tengen.core.dao.BaseDAO;
import com.tengen.core.util.JdbcUtil;
import com.tengen.admin.dao.impl.IDictMargDAO;
import com.tengen.admin.entity.DictItem;

public class DictMargDAO extends BaseDAO<DictItem> implements IDictMargDAO {
	public Map<String, Map<String, String>> getDictMap() {
		Map<String, Map<String, String>> dictMap = new LinkedHashMap<String, Map<String, String>>();
		List<DictItem> dictList = queryAll();
		for (DictItem dictItem : dictList) {
			// ��ȡ������Code
			String groupCode = dictItem.getGroupCode();
			Map<String, String> tempMap = null;
			// �ж�map�������Ƿ�ӵ�иù�����
			if (dictMap.containsKey(groupCode)) {
				tempMap = dictMap.get(groupCode);
				tempMap.put(dictItem.getDictCode(), dictItem.getDictValue());
			} else {
				tempMap = new LinkedHashMap<String, String>();
				tempMap.put(dictItem.getDictCode(), dictItem.getDictValue());
				dictMap.put(groupCode, tempMap);
			}
		}
		return dictMap;
	}

	@Override
	public List<DictItem> queryAll() {
		List<DictItem> dictList = new ArrayList<DictItem>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "select * from dict_item order by groupCode,sn";

		try {
			// ��ȡ���ݿ�����
			conn = JdbcUtil.getConn();
			// ����statement����
			pstm = conn.prepareStatement(sql);
			// ִ��SQL
			rs = pstm.executeQuery();
			// ѭ����������
			while (rs.next()) {
				DictItem dictitem = new DictItem();
				// �����ݿ��ѯ������������
				dictitem.setDictId(rs.getInt("dictId"));
				dictitem.setDictCode(rs.getString("dictCode"));
				dictitem.setDictValue(rs.getString("dictValue"));
				dictitem.setGroupCode(rs.getString("groupCode"));
				dictitem.setGroupName(rs.getString("groupName"));
				dictitem.setSn(rs.getInt("sn"));
				dictitem.setStatus(rs.getString("status"));
				dictitem.setRemark(rs.getString("remark"));
				dictList.add(dictitem);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConn(conn);
		}
		return dictList;
	}

	@Override
	public Map<String, String> getGroupMap() {
		Map<String, String> map = new LinkedHashMap<String, String>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "select groupCode,groupName from dict_item group by groupCode,groupName";

		try {
			// ��ȡ���ݿ�����
			conn = JdbcUtil.getConn();
			// ����statement����
			pstm = conn.prepareStatement(sql);
			// ִ��SQL
			rs = pstm.executeQuery();
			// ѭ����������
			while (rs.next()) {
				map.put(rs.getString("groupCode"), rs.getString("groupName"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConn(conn);
		}
		return map;
	}

	@Override
	public Map<String, List<DictItem>> getDictList() {
		Map<String, List<DictItem>> dictMap = new LinkedHashMap<String, List<DictItem>>();
		List<DictItem> dictList = queryAll();

		for (DictItem dictItem : dictList) {
			String groupCode = dictItem.getGroupCode();
			if (dictMap.containsKey(groupCode)) {
				List<DictItem> list = dictMap.get(groupCode);
				list.add(dictItem);
			} else {
				List<DictItem> list = new ArrayList<DictItem>();
				list.add(dictItem);
				dictMap.put(groupCode, list);
			}
		}
		return dictMap;
	}

	@Override
	public void saveDictItems(List<DictItem> dictList, String groupCode) {
		// 1.ɾ��
		String sql = "delete from Dict_Item where groupCode='" + groupCode + "'";
		// 2.���
		String sql1 = "insert into dict_item (dictCode,dictValue,groupCode,groupName,sn,status,remark) values (?,?,?,?,?,?,?)";

		Connection conn = null;
		PreparedStatement pstm = null;

		// Ĭ������� JDBC���Զ��ύ����
		conn = JdbcUtil.getConn();

		try {
			// �����ύ��ʽΪ�ֶ��ύ
			conn.setAutoCommit(false);
			pstm = conn.prepareStatement(sql);
			pstm.execute();

			// �������
			pstm = conn.prepareStatement(sql1);
			for (DictItem dictItem : dictList) {
				pstm.setString(1, dictItem.getDictCode());
				pstm.setString(2, dictItem.getDictValue());
				pstm.setString(3, dictItem.getGroupCode());
				pstm.setString(4, dictItem.getGroupName());
				pstm.setInt(5, dictItem.getSn());
				pstm.setString(6, dictItem.getStatus());
				pstm.setString(7, dictItem.getRemark());
				pstm.addBatch();
			}
			pstm.executeBatch();
			conn.commit();
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConn(conn);
		}
	}

}
