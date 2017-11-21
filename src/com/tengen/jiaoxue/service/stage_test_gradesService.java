/**
 * 
 */
package com.tengen.jiaoxue.service;

import com.tengen.core.service.BaseService;
import com.tengen.jiaoxue.dao.stage_test_gradesDAO;
import com.tengen.jiaoxue.dao.impl.Istage_test_gradesDAO;
import com.tengen.jiaoxue.entity.stage_test_grades;
import com.tengen.jiaoxue.service.impl.Istage_test_gradesService;

/**
 * @author Œ­³¿³¿
 *
 */
public class stage_test_gradesService extends BaseService<stage_test_grades> implements Istage_test_gradesService {
	private Istage_test_gradesDAO stage_test_gradesDAO;

	public stage_test_gradesService() {
		stage_test_gradesDAO = new stage_test_gradesDAO();
		setBaseDAO(stage_test_gradesDAO);
	}
}
