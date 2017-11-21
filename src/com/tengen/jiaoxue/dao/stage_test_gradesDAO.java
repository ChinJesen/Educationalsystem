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
import com.tengen.jiaoxue.dao.impl.Istage_test_gradesDAO;
import com.tengen.jiaoxue.entity.stage_test_grades;

/**
 * @author ������
 *
 */
public class stage_test_gradesDAO extends BaseDAO<stage_test_grades> implements Istage_test_gradesDAO {

	@Override
	protected void excuteSQL(String sql, stage_test_grades entity, List<String> filedList) {
		System.out.println(sql);
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
				if (i == 9) {
					pstm.setObject(i, StringUtil.getSysTime());
				}
				// ��״̬��ֵΪ0����ʾ����
				if (i == 10) {
					pstm.setInt(i, 0);
				}
				
				if (i != 9 && i != 10) {
				}
				pstm.setObject(i, val);
				i++;
				System.out.println("columName:" + columName + "\tValue:" + val);
			}
			pstm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.closeConn(conn);
		}

	}
}
