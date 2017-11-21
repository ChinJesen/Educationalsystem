package com.tengen.jiaowu.service;

import com.tengen.core.service.BaseService;
import com.tengen.jiaowu.dao.AttendanceDAO;
import com.tengen.jiaowu.dao.impl.IAttendanceDAO;
import com.tengen.jiaowu.entity.Attendance_Info;
import com.tengen.jiaowu.service.impl.IAttendanceService;

public class AttendanceService extends BaseService<Attendance_Info> implements IAttendanceService {
	private IAttendanceDAO ad;

	public AttendanceService() {
		ad = new AttendanceDAO();
		setBaseDAO(ad);
	}
}
