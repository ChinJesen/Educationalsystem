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
 * @author 尛晨晨
 *
 */
public abstract class BaseDAO<E> implements IBaseDAO<E> {
	protected static ConfigUtil configUtil;

	private Class<?> cls;

	public BaseDAO() {
		Class<?> clsTemp = this.getClass();
		// 超类 基类 父类
		Type type = clsTemp.getGenericSuperclass();
		// 判断是否是泛型类
		if (type instanceof ParameterizedType) {
			Type[] types = ((ParameterizedType) type).getActualTypeArguments();
			cls = (Class<?>) types[0];
		}
	}

	static {
		// 加载实体映射文件
		configUtil = ConfigUtil.newInstance("/tabORM.properties");
	}

	/**
	 * 通用保存方法
	 */
	@Override
	public boolean saveInfo(E e) {
		boolean flag = true;
		try {
			Class<?> cls = e.getClass();
			// 获取表名
			String tableName = configUtil.getVal(cls.getName());
			// 获取主键
			String pryKey = getPrimKey(tableName);
			// 记录数据列
			List<String> filedList = new ArrayList<String>();
			// 获取SQL
			String sql = getSaveSQL(tableName, pryKey, filedList);
			// 执行SQL
			excuteSQL(sql, e, filedList);
		} catch (Exception e1) {
			e1.printStackTrace();
			flag = false;
		}
		return flag;
	}

	/**
	 * 通用修改方法
	 */
	@Override
	public void modifyInfo(E e) {
		Class<?> cls = e.getClass();
		// 获取表名
		String tableName = configUtil.getVal(cls.getName());
		// 获取主键
		String pryKey = getPrimKey(tableName);
		// 记录数据列
		List<String> filedList = new ArrayList<String>();
		// 获取SQL
		String sql = getModifySQL(tableName, pryKey, filedList);
		// 追加主键信息
		filedList.add(pryKey);
		// 执行SQL
		excuteSQL(sql, e, filedList);
	}

	/**
	 * 通用删除方法
	 */
	@Override
	public void delete(Object id) {
		// 获取表名
		String tableName = configUtil.getVal(cls.getName());
		// 获取主键
		String pryKey = getPrimKey(tableName);
		// 拼装SQL//逻辑删除
		String sql = "update " + tableName + " set status=1 where " + pryKey + "=?"; // 这行代码忘记干嘛的了。。。封装删除条件？？
		Object[] params = { id };
		// 执行SQL
		excuteSQL(sql, params);
	}

	/**
	 * 通用查询方法【单条记录】
	 * 
	 * @param id
	 * @return
	 */
	public E queryById(Object id) {
		// 获取表名
		String tableName = configUtil.getVal(cls.getName());
		// 获取主键名
		String pryKey = getPrimKey(tableName);
		// 拼装SQL
		String sql = "select * from " + tableName + " where 1 = 1 and " + pryKey + " = ?";
		// 封装查询条件
		Object[] params = { id };
		// 执行SQL并返回查询结果
		return executeQuery(sql, params);
	}

	/**
	 * 通用查询方法
	 */
	public void queryInfo(PageUtil<E> pageUtil) {
		E e = pageUtil.getEntity();
		// 获取表名
		String tableName = configUtil.getVal(e.getClass().getName());
		// 获取查询条件
		Map<String, Object> paramMap = getParamMap(e);
		// 获取SQL
		String sql = getQuerySql(paramMap, tableName);
		sql += " limit ?,?";
		// 封装分页条件
		paramMap.put("pageSize", (pageUtil.getPageSize() - 1) * pageUtil.getPageNum());
		paramMap.put("pageNum", pageUtil.getPageNum());

		// 执行SQL
		excutQuery(pageUtil, sql, paramMap, tableName);
	}

	/**
	 * 执行删除SQL
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
	 * 执行SQL
	 * 
	 * @param sql
	 */
	protected void excuteSQL(String sql, E entity, List<String> filedList) {
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = JdbcUtil.getConn();
			pstm = conn.prepareStatement(sql);
			// 赋值 要给哪些参数赋值？
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
	 * 查询方法
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
	 * 执行查询方法
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
			// 执行查询操作
			rs = pstm.executeQuery();
			// 获取查询结果
			List<E> list = getEntityList(rs);

			// 封装查询结果
			pageUtil.setList(list);
			// 封装总条数
			pageUtil.setPageNumSum(getPageNumSun(paramMap, tableName));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConn(conn);
		}
	}

	/**
	 * 获取指定实体对象中的属性值
	 * 
	 * @param entity
	 * @param columName
	 * @return
	 */
	protected Object getFieldValue(E entity, String columName) {
		Class<?> cls = entity.getClass();
		Object value = null;
		// 获取类中的所有成员属性
		Field[] fields = cls.getDeclaredFields();
		for (Field field : fields) {
			// 获取属性名称
			String fieldName = field.getName();
			// 判断属性名称是否与列明相同
			if (fieldName.equalsIgnoreCase(columName)) {
				// 根据规则获取方法名称
				String methodName = "get" + fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
				try {
					// 根据方法名称获取方法对象
					Method method = cls.getMethod(methodName);
					// 执行方法并获取返回值
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
	 * 拼装保存SQL
	 * 
	 * @param tableName
	 * @param pryKey
	 * @return
	 */
	protected String getSaveSQL(String tableName, String pryKey, List<String> filedList) {
		// 拼装SQL语句
		StringBuffer sql = new StringBuffer();
		sql.append("insert into ").append(tableName).append(" (");
		// 获取得到列名
		List<String> columnsList = getTableColumns(tableName);
		for (String columnName : columnsList) {
			// 如果列名不区分大小写和主键比较为true则不添加到list中。否则在接下来的循环中会多一个？导致程序出错
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
	 * 根据表名获取所有列信息
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
			metaData = conn.getMetaData();// 这个方法是做什么的？
			// getMetaData() 获取一个 DatabaseMetaData 对象，该对象包含关于此 Connection
			// 对象所连接的数据库的元数据
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
	 * 获取指定表中的主键
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
	 * 动态拼装修改SQL
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
	 * 获取总条数
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
	 * 获取实体类中不为空的属性及属性值
	 * 
	 * @param e
	 * @return
	 */
	protected Map<String, Object> getParamMap(E e) {
		// 获取不为空的实体类中的查询条件
		// Map<列名，属性值>
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
	 * 拼装查询SQL
	 * 
	 * @param paramMap
	 * @param tableName
	 * @return
	 */
	protected String getQuerySql(Map<String, Object> paramMap, String tableName) {
		StringBuffer sql = new StringBuffer();
		sql.append("select * from ").append(tableName).append(" where 1 = 1 and status=0");

		List<String> columnList = getTableColumns(tableName);

		// 拼装SQL
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
	 * 封装查询结果
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
