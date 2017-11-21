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
import com.tengen.jiaoxue.dao.impl.IrecommendDAO;
import com.tengen.jiaoxue.entity.recommendInfo;

/**
 * @author 尛晨晨
 *
 */
public class recommendDAO extends BaseDAO<recommendInfo> implements IrecommendDAO {
	/* (non-Javadoc)
	 * @see com.tengen.core.dao.BaseDAO#excuteSQL(java.lang.String, java.lang.Object, java.util.List)
	 */
	@Override
	protected void excuteSQL(String sql, recommendInfo entity, List<String> filedList) {
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = JdbcUtil.getConn();
			pstm = conn.prepareStatement(sql);
			// 赋值 要给哪些参数赋值？
			int i = 1;
			for (String columName : filedList) {
				Object val = getFieldValue(entity, columName);
				if (i == 5){
					pstm.setObject(5,0);
				}
				if (i!=5){
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
