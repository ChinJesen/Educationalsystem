/**
 * 
 */
package com.tengen.commonalityInfo.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.tengen.commonalityInfo.dao.impl.IcommonalityInfoDAO;
import com.tengen.commonalityInfo.entity.commonalityInfo;
import com.tengen.core.dao.BaseDAO;
import com.tengen.core.util.JdbcUtil;

/**
 * @author 尛晨晨
 *
 */
public class commonalityInfoDAO extends BaseDAO<commonalityInfo> implements IcommonalityInfoDAO {
	/* (non-Javadoc)
	 * @see com.tengen.core.dao.BaseDAO#excuteSQL(java.lang.String, java.lang.Object, java.util.List)
	 */
	
	
	
	
	/**
	 * 验证学生姓名是否是可用
	 * @param stuName
	 * @return
	 */
		public static boolean validstuName(String stuName) {
			boolean flag = true;
			// JDBC入库
			Statement stm = null;
			ResultSet rs = null;
			Connection conn = null;
			String sql = "select count(*) from student_information_info where stuName='" + stuName + "'";
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



	/* (non-Javadoc)
	 * @see com.tengen.commonalityInfo.dao.impl.IcommonalityInfoDAO#getStuNameMap()
	 */
	@Override
	public Map<Integer, String> getStuNameMap() {
		List<commonalityInfo> commonalityInfo = queryAll();
		Map<Integer,String> map = new HashMap<Integer,String>();
		for (commonalityInfo commonality : commonalityInfo) {
			map.put(commonality.getStuId(), commonality.getStuName());
		}
		return map;
	}



	/**
	 * @return
	 */
	public List<com.tengen.commonalityInfo.entity.commonalityInfo> queryAll() {
		Connection conn = null;
		Statement stm = null;
		ResultSet rs = null;
		List<commonalityInfo> list = new ArrayList<commonalityInfo>();
		
		try {
			conn = JdbcUtil.getConn();
			stm = conn.createStatement();
			rs = stm.executeQuery("select * from student_information_info where status ='0'");
			while(rs.next())
			{
				commonalityInfo ClassInfo = new commonalityInfo();
				ClassInfo.setStuId(rs.getInt("stuId"));
				ClassInfo.setStuName(rs.getString("stuName"));
				list.add(ClassInfo);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally
		{
			JdbcUtil.closeConn(conn);
		}
		return list;
	}



	/**
	 * 通过班级id查找到所有学生信息
	 * @param classId
	 * @return
	 */
	public static Map<Integer, String> getStuMap(String classId) {
		Connection conn = null;
		Statement stm = null;
		ResultSet rs = null;
		Map<Integer, String> stuMap = new LinkedHashMap<Integer, String>();
		
		try {
			conn = JdbcUtil.getConn();
			stm = conn.createStatement();
			rs = stm.executeQuery("select * from student_information_info where status ='0' and classId="+classId);
			while(rs.next())
			{
				stuMap.put(rs.getInt("stuId"),rs.getString("stuName"));
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally
		{
			JdbcUtil.closeConn(conn);
		}
		return stuMap;
	
	}

	
	
}
