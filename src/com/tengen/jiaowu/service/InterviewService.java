package com.tengen.jiaowu.service;

import com.tengen.core.service.BaseService;
import com.tengen.jiaowu.dao.InterviewDAO;
import com.tengen.jiaowu.dao.impl.IInterviewDAO;

import com.tengen.jiaowu.entity.Interview_Info;
import com.tengen.jiaowu.service.impl.IInterviewService;

public class InterviewService extends BaseService<Interview_Info> implements IInterviewService {
	private IInterviewDAO tp;

	public InterviewService() {
		tp = new InterviewDAO();
		setBaseDAO(tp);
	}
}
