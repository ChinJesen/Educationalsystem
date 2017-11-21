package com.tengen.core.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcUtil {
	private static String url;
	private static String user;
	private static String password;
	private static String driverName;

	static {
		ConfigUtil configUtil = ConfigUtil.newInstance(null);
		url = configUtil.getVal("url");
		user = configUtil.getVal("user");
		password = configUtil.getVal("password");
		driverName = configUtil.getVal("driverName");
		// System.out.println(url);
		// System.out.println(user);
		// System.out.println(password);
		// System.out.println(driverName);
	}

	/**
	 * 获取数据库连接
	 * 
	 * @return
	 */
	public static Connection getConn() {
		// JDBC入库操作
		Connection conn = null;
		try {
			// 加载数据库驱动
			Class.forName(driverName);
			// 获取数据库连接
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	/**
	 * 关闭数据库连接
	 * 
	 * @param conn
	 */
	public static void closeConn(Connection conn) {
		try {
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
