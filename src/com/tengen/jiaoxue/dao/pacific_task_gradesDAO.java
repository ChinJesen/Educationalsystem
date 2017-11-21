/**
 * 
 */
package com.tengen.jiaoxue.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.tengen.core.dao.BaseDAO;
import com.tengen.core.util.JdbcUtil;
import com.tengen.core.util.StringUtil;
import com.tengen.jiaoxue.dao.impl.Ipacific_task_gradesDAO;
import com.tengen.jiaoxue.entity.pacific_task_grades;

/**
 * @author 尛晨晨
 *
 */
public class pacific_task_gradesDAO extends BaseDAO<pacific_task_grades> implements Ipacific_task_gradesDAO {

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.tengen.core.dao.BaseDAO#excuteSQL(java.lang.String,
	 * java.lang.Object, java.util.List)
	 */
	@Override
	protected void excuteSQL(String sql, pacific_task_grades entity, List<String> filedList) {
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = JdbcUtil.getConn();
			pstm = conn.prepareStatement(sql);
			// 赋值 要给哪些参数赋值？
			int i = 1;
			for (String columName : filedList) {
				Object val = getFieldValue(entity, columName);
				// 给上传日期赋值
				if (i == 4) {
					pstm.setObject(i, StringUtil.getSysTime());
				}
				// 给状态赋值为0，表示可用
				if (i == 7) {
					pstm.setInt(i, 0);
				}
				if (i != 4 && i != 7) {
					pstm.setObject(i, val);
				}
				i++;
			}
			pstm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConn(conn);
		}

	}

}
