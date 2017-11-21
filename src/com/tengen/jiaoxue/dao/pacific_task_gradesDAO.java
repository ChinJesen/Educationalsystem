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
 * @author ������
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
			// ��ֵ Ҫ����Щ������ֵ��
			int i = 1;
			for (String columName : filedList) {
				Object val = getFieldValue(entity, columName);
				// ���ϴ����ڸ�ֵ
				if (i == 4) {
					pstm.setObject(i, StringUtil.getSysTime());
				}
				// ��״̬��ֵΪ0����ʾ����
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
