/**
 * 
 */
package com.tengen.jiaoxue.service;

import com.tengen.core.service.BaseService;
import com.tengen.jiaoxue.dao.pacific_task_gradesDAO;
import com.tengen.jiaoxue.dao.impl.Ipacific_task_gradesDAO;
import com.tengen.jiaoxue.entity.pacific_task_grades;
import com.tengen.jiaoxue.service.impl.Ipacific_task_gradesService;

/**
 * @author Œ­³¿³¿
 *
 */
public class pacific_task_gradesService extends BaseService<pacific_task_grades>
		implements Ipacific_task_gradesService {
	private Ipacific_task_gradesDAO pacific_task_gradesDAO;

	public pacific_task_gradesService() {
		pacific_task_gradesDAO = new pacific_task_gradesDAO();
		setBaseDAO(pacific_task_gradesDAO);
	}
}
