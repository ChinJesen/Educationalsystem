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
 * @author 尛晨晨
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
			// 赋值 要给哪些参数赋值？
			int i = 1;
			for (String columName : filedList) {
				Object val = getFieldValue(entity, columName);
				// 给上传日期赋值
				if (i == 9) {
					pstm.setObject(i, StringUtil.getSysTime());
				}
				// 给状态赋值为0，表示可用
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
