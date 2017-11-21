/**
 * 
 */
package com.tengen.core.dao;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.tengen.core.dao.impl.IBaseDAO;
import com.tengen.core.util.ConfigUtil;
import com.tengen.core.util.JdbcUtil;
import com.tengen.core.util.PageUtil;

/**
 * @author ������
 *
 */
public abstract class BaseDAO<E> implements IBaseDAO<E> {
	protected static ConfigUtil configUtil;

	private Class<?> cls;

	public BaseDAO() {
		Class<?> clsTemp = this.getClass();
		// ���� ���� ����
		Type type = clsTemp.getGenericSuperclass();
		// �ж��Ƿ��Ƿ�����
		if (type instanceof ParameterizedType) {
			Type[] types = ((ParameterizedType) type).getActualTypeArguments();
			cls = (Class<?>) types[0];
		}
	}

	static {
		// ����ʵ��ӳ���ļ�
		configUtil = ConfigUtil.newInstance("/tabORM.properties");
	}

	/**
	 * ͨ�ñ��淽��
	 */
	@Override
	public boolean saveInfo(E e) {
		boolean flag = true;
		try {
			Class<?> cls = e.getClass();
			// ��ȡ����
			String tableName = configUtil.getVal(cls.getName());
			// ��ȡ����
			String pryKey = getPrimKey(tableName);
			// ��¼������
			List<String> filedList = new ArrayList<String>();
			// ��ȡSQL
			String sql = getSaveSQL(tableName, pryKey, filedList);
			// ִ��SQL
			excuteSQL(sql, e, filedList);
		} catch (Exception e1) {
			e1.printStackTrace();
			flag = false;
		}
		return flag;
	}

	/**
	 * ͨ���޸ķ���
	 */
	@Override
	public void modifyInfo(E e) {
		Class<?> cls = e.getClass();
		// ��ȡ����
		String tableName = configUtil.getVal(cls.getName());
		// ��ȡ����
		String pryKey = getPrimKey(tableName);
		// ��¼������
		List<String> filedList = new ArrayList<String>();
		// ��ȡSQL
		String sql = getModifySQL(tableName, pryKey, filedList);
		// ׷��������Ϣ
		filedList.add(pryKey);
		// ִ��SQL
		excuteSQL(sql, e, filedList);
	}

	/**
	 * ͨ��ɾ������
	 */
	@Override
	public void delete(Object id) {
		// ��ȡ����
		String tableName = configUtil.getVal(cls.getName());
		// ��ȡ����
		String pryKey = getPrimKey(tableName);
		// ƴװSQL//�߼�ɾ��
		String sql = "update " + tableName + " set status=1 where " + pryKey + "=?"; // ���д������Ǹ�����ˡ�������װɾ����������
		Object[] params = { id };
		// ִ��SQL
		excuteSQL(sql, params);
	}

	/**
	 * ͨ�ò�ѯ������������¼��
	 * 
	 * @param id
	 * @return
	 */
	public E queryById(Object id) {
		// ��ȡ����
		String tableName = configUtil.getVal(cls.getName());
		// ��ȡ������
		String pryKey = getPrimKey(tableName);
		// ƴװSQL
		String sql = "select * from " + tableName + " where 1 = 1 and " + pryKey + " = ?";
		// ��װ��ѯ����
		Object[] params = { id };
		// ִ��SQL�����ز�ѯ���
		return executeQuery(sql, params);
	}

	/**
	 * ͨ�ò�ѯ����
	 */
	public void queryInfo(PageUtil<E> pageUtil) {
		E e = pageUtil.getEntity();
		// ��ȡ����
		String tableName = configUtil.getVal(e.getClass().getName());
		// ��ȡ��ѯ����
		Map<String, Object> paramMap = getParamMap(e);
		// ��ȡSQL
		String sql = getQuerySql(paramMap, tableName);
		sql += " limit ?,?";
		// ��װ��ҳ����
		paramMap.put("pageSize", (pageUtil.getPageSize() - 1) * pageUtil.getPageNum());
		paramMap.put("pageNum", pageUtil.getPageNum());

		// ִ��SQL
		excutQuery(pageUtil, sql, paramMap, tableName);
	}

	/**
	 * ִ��ɾ��SQL
	 * 
	 * @param sql
	 * @param params
	 */
	protected void excuteSQL(String sql, Object[] params) {
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = JdbcUtil.getConn();
			pstm = conn.prepareStatement(sql);
			pstm.setObject(1, params[0]);
			pstm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * ִ��SQL
	 * 
	 * @param sql
	 */
	protected void excuteSQL(String sql, E entity, List<String> filedList) {
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = JdbcUtil.getConn();
			pstm = conn.prepareStatement(sql);
			// ��ֵ Ҫ����Щ������ֵ��
			int i = 1;
			for (String columName : filedList) {
				Object val = getFieldValue(entity, columName);
				System.out.println("columName:" + columName + "\tValue:" + val);
				pstm.setObject(i, val);
				i++;
			}

			pstm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConn(conn);
		}
	}

	/**
	 * ��ѯ����
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	protected E executeQuery(String sql, Object[] params) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		E e = null;
		try {
			conn = JdbcUtil.getConn();
			pstm = conn.prepareStatement(sql);
			pstm.setObject(1, params[0]);
			rs = pstm.executeQuery();
			List<E> list = getEntityList(rs);
			if (list.size() > 0)
				e = list.get(0);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			JdbcUtil.closeConn(conn);
		}
		return e;
	}

	/**
	 * ִ�в�ѯ����
	 * 
	 * @param pageUtil
	 * @param sql
	 * @param paramMap
	 */
	protected void excutQuery(PageUtil<E> pageUtil, String sql, Map<String, Object> paramMap, String tableName) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			conn = JdbcUtil.getConn();
			pstm = conn.prepareStatement(sql);
			int i = 1;
			for (Entry<String, Object> entry : paramMap.entrySet()) {
				Object val = entry.getValue();
				if (val instanceof java.lang.String) {
					pstm.setString(i, "%" + val.toString() + "%");
				} else if (val instanceof java.lang.Integer) {
					pstm.setInt(i, Integer.parseInt(val.toString()));
				}
				i++;
			}
			// ִ�в�ѯ����
			rs = pstm.executeQuery();
			// ��ȡ��ѯ���
			List<E> list = getEntityList(rs);

			// ��װ��ѯ���
			pageUtil.setList(list);
			// ��װ������
			pageUtil.setPageNumSum(getPageNumSun(paramMap, tableName));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConn(conn);
		}
	}

	/**
	 * ��ȡָ��ʵ������е�����ֵ
	 * 
	 * @param entity
	 * @param columName
	 * @return
	 */
	protected Object getFieldValue(E entity, String columName) {
		Class<?> cls = entity.getClass();
		Object value = null;
		// ��ȡ���е����г�Ա����
		Field[] fields = cls.getDeclaredFields();
		for (Field field : fields) {
			// ��ȡ��������
			String fieldName = field.getName();
			// �ж����������Ƿ���������ͬ
			if (fieldName.equalsIgnoreCase(columName)) {
				// ���ݹ����ȡ��������
				String methodName = "get" + fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
				try {
					// ���ݷ������ƻ�ȡ��������
					Method method = cls.getMethod(methodName);
					// ִ�з�������ȡ����ֵ
					value = method.invoke(entity);
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
			}
		}

		return value;
	}

	/**
	 * ƴװ����SQL
	 * 
	 * @param tableName
	 * @param pryKey
	 * @return
	 */
	protected String getSaveSQL(String tableName, String pryKey, List<String> filedList) {
		// ƴװSQL���
		StringBuffer sql = new StringBuffer();
		sql.append("insert into ").append(tableName).append(" (");
		// ��ȡ�õ�����
		List<String> columnsList = getTableColumns(tableName);
		for (String columnName : columnsList) {
			// ������������ִ�Сд�������Ƚ�Ϊtrue����ӵ�list�С������ڽ�������ѭ���л��һ�������³������
			if (!columnName.equalsIgnoreCase(pryKey)) {
				filedList.add(columnName);
				sql.append(columnName).append(",");
			}
		}
		if (sql.toString().endsWith(","))
			sql = new StringBuffer(sql.substring(0, sql.length() - 1));

		sql.append(") values (");
		for (int i = 0; i < columnsList.size(); i++) {
			if (!columnsList.get(i).equalsIgnoreCase(pryKey)) {
				sql.append("?,");
			}
		}
		if (sql.toString().endsWith(","))
			sql = new StringBuffer(sql.substring(0, sql.length() - 1));
		sql.append(")");

		return sql.toString();
	}

	/**
	 * ���ݱ�����ȡ��������Ϣ
	 * 
	 * @param tableName
	 * @return
	 */
	protected List<String> getTableColumns(String tableName) {
		Connection conn = null;
		DatabaseMetaData metaData = null;
		ResultSet rs = null;
		List<String> columnList = new ArrayList<String>();
		try {
			conn = JdbcUtil.getConn();
			metaData = conn.getMetaData();// �����������ʲô�ģ�
			// getMetaData() ��ȡһ�� DatabaseMetaData ���󣬸ö���������ڴ� Connection
			// ���������ӵ����ݿ��Ԫ����
			rs = metaData.getColumns(conn.getCatalog(), null, tableName.toUpperCase(), null);

			while (rs.next()) {
				String clumnName = rs.getString("COLUMN_NAME");
				columnList.add(clumnName);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConn(conn);
		}
		return columnList;
	}

	/**
	 * ��ȡָ�����е�����
	 * 
	 * @param tableName
	 * @return
	 */
	protected String getPrimKey(String tableName) {
		Connection conn = null;
		DatabaseMetaData metaData = null;
		ResultSet rs = null;
		String primKeyName = null;
		try {
			conn = JdbcUtil.getConn();
			metaData = conn.getMetaData();
			rs = metaData.getPrimaryKeys(conn.getCatalog(), null, tableName.toUpperCase());
			while (rs.next()) {
				primKeyName = rs.getString("COLUMN_NAME");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConn(conn);
		}
		return primKeyName;
	}

	/**
	 * ��̬ƴװ�޸�SQL
	 * 
	 * @param tableName
	 * @param pryKey
	 * @param filedList
	 * @return
	 */
	protected String getModifySQL(String tableName, String pryKey, List<String> filedList) {
		StringBuffer sql = new StringBuffer();
		sql.append("update ").append(tableName).append(" set ");

		List<String> columnList = getTableColumns(tableName);

		for (String columnName : columnList) {
			if (!columnName.equalsIgnoreCase(pryKey)) {
				filedList.add(columnName);
				sql.append(columnName).append("=?,");
			}
		}

		if (sql.toString().endsWith(","))
			sql = new StringBuffer(sql.substring(0, sql.length() - 1));

		sql.append(" where ").append(pryKey).append("=?");

		return sql.toString();
	}

	/**
	 * ��ȡ������
	 * 
	 * @param entity
	 * @return
	 */
	protected Integer getPageNumSun(Map<String, Object> paramMap, String tableName) {
		paramMap.remove("pageSize");
		paramMap.remove("pageNum");
		String sql = getQuerySql(paramMap, tableName);
		sql = "select count(*) from (" + sql + ") tempTab";
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Integer pageNumSum = 0;
		try {
			conn = JdbcUtil.getConn();
			pstm = conn.prepareStatement(sql);
			int i = 1;
			for (Entry<String, Object> entry : paramMap.entrySet()) {
				Object val = entry.getValue();
				if (val instanceof java.lang.String) {
					pstm.setString(i, "%" + val.toString() + "%");
				} else if (val instanceof java.lang.Integer) {
					pstm.setInt(i, Integer.parseInt(val.toString()));
				}
				i++;
			}
			rs = pstm.executeQuery();
			while (rs.next()) {
				pageNumSum = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConn(conn);
		}

		return pageNumSum;
	}

	/**
	 * ��ȡʵ�����в�Ϊ�յ����Լ�����ֵ
	 * 
	 * @param e
	 * @return
	 */
	protected Map<String, Object> getParamMap(E e) {
		// ��ȡ��Ϊ�յ�ʵ�����еĲ�ѯ����
		// Map<����������ֵ>
		Map<String, Object> tempMap = new LinkedHashMap<String, Object>();
		Field[] fields = e.getClass().getDeclaredFields();
		for (Field field : fields) {
			try {
				field.setAccessible(true);
				Object val = field.get(e);
				if (val != null && !"".equals(val.toString())) {
					tempMap.put(field.getName(), val);
				}
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		return tempMap;
	}

	/**
	 * ƴװ��ѯSQL
	 * 
	 * @param paramMap
	 * @param tableName
	 * @return
	 */
	protected String getQuerySql(Map<String, Object> paramMap, String tableName) {
		StringBuffer sql = new StringBuffer();
		sql.append("select * from ").append(tableName).append(" where 1 = 1 and status=0");

		List<String> columnList = getTableColumns(tableName);

		// ƴװSQL
		for (Entry<String, Object> entry : paramMap.entrySet()) {
			String columName = entry.getKey();

			for (String clnName : columnList) {
				if (clnName.equalsIgnoreCase(columName)) {
					if (entry.getValue() instanceof java.lang.String) {
						sql.append(" and ").append(columName).append(" like ?");
					} else {
						sql.append(" and ").append(columName).append("=?");
					}
					break;
				}
			}
		}
		return sql.toString();
	}

	/**
	 * ��װ��ѯ���
	 * 
	 * @param rs
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	protected List<E> getEntityList(ResultSet rs) throws Exception {
		Field[] fields = cls.getDeclaredFields();
		List<E> list = new ArrayList<E>();
		while (rs.next()) {
			E e = (E) cls.newInstance();
			for (Field field : fields) {
				try {
					field.setAccessible(true);
					String columName = field.getName();
					String fieldType = field.getType().getSimpleName();
					if ("String".equals(fieldType)) {
						field.set(e, rs.getString(columName));
					} else if ("Integer".equals(fieldType)) {
						field.set(e, rs.getInt(columName));
					}
				} catch (Exception e1) {
				}
			}
			list.add(e);
		}
		return list;
	}
}
