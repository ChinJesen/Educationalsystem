package com.tengen.jiaowu.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tengen.core.dao.BaseDAO;
import com.tengen.core.util.JdbcUtil;
import com.tengen.jiaowu.dao.impl.IClassDAO;
import com.tengen.jiaowu.entity.Class_Info;

public class ClassDAO extends BaseDAO<Class_Info> implements IClassDAO{

	@Override
	public Map<Integer, String> getClassMap() {
		List<Class_Info> classList = queryAll();
		Map<Integer,String> map = new HashMap<Integer,String>();
		for (Class_Info classInfo : classList) {
			map.put(classInfo.getClassId(), classInfo.getClassName());
		}
		return map;
	}
	
	public List<Class_Info> queryAll() {
		Connection conn = null;
		Statement stm = null;
		ResultSet rs = null;
		List<Class_Info> list = new ArrayList<Class_Info>();
		
		try {
			conn = JdbcUtil.getConn();
			stm = conn.createStatement();
			rs = stm.executeQuery("select * from Class_Info where status ='0'");
			while(rs.next())
			{
				Class_Info ClassInfo = new Class_Info();
				ClassInfo.setClassId(rs.getInt("classId"));
				ClassInfo.setClassName(rs.getString("className"));
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

	
}
