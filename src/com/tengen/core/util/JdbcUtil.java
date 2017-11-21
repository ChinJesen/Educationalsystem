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
	 * ��ȡ���ݿ�����
	 * 
	 * @return
	 */
	public static Connection getConn() {
		// JDBC������
		Connection conn = null;
		try {
			// �������ݿ�����
			Class.forName(driverName);
			// ��ȡ���ݿ�����
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	/**
	 * �ر����ݿ�����
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
