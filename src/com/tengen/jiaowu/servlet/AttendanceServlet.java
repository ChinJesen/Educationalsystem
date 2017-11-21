package com.tengen.jiaowu.servlet;

import com.tengen.core.servlet.BaseServlet;
import com.tengen.jiaowu.entity.Attendance_Info;
import com.tengen.jiaowu.service.AttendanceService;
import com.tengen.jiaowu.service.impl.IAttendanceService;

public class AttendanceServlet extends BaseServlet<Attendance_Info> {
	private static final long serialVersionUID = -7283856823426998990L;

	private IAttendanceService adService;

	public AttendanceServlet() {
		super();
		adService = new AttendanceService();
		setBaseService(adService);

		urlMap.put("save_ok", "jsp/Attendance/registerAttendanceInfo.jsp");
		urlMap.put("query_all", "jsp/Attendance/showAttendanceInfo.jsp");
		urlMap.put("queryById_ok", "jsp/Attendance/editAttendanceInfo.jsp");
		urlMap.put("modify_ok", "jsp/Attendance/editAttendanceInfo.jsp");
	}
}
