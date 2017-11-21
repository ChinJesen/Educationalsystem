package com.tengen.jiaoxue.servlet;

import com.tengen.core.servlet.BaseServlet;
import com.tengen.jiaoxue.entity.stage_test_grades;
import com.tengen.jiaoxue.service.stage_test_gradesService;
import com.tengen.jiaoxue.service.impl.Istage_test_gradesService;


/**
 * Servlet implementation class stage_test_gradesServlet
 */
public class stage_test_gradesServlet extends BaseServlet<stage_test_grades> {
	private static final long serialVersionUID = 1L;

	private Istage_test_gradesService stage_test_gradesService;

	/**
	 * @see BaseServlet#BaseServlet()
	 */
	public stage_test_gradesServlet() {
		super();
		stage_test_gradesService = new stage_test_gradesService();
		setBaseService(stage_test_gradesService);
		urlMap.put("save_ok", "jsp/examMrg/exam_upload.jsp");
		urlMap.put("query_all", "jsp/examMrg/exam_search.jsp");
		urlMap.put("queryById_ok", "jsp/examMrg/exam_modify.jsp");
		urlMap.put("modify_ok", "jsp/examMrg/exam_modify.jsp");
	}

}
