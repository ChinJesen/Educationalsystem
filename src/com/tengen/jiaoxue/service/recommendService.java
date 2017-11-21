/**
 * 
 */
package com.tengen.jiaoxue.service;

import com.tengen.core.service.BaseService;
import com.tengen.jiaoxue.dao.recommendDAO;
import com.tengen.jiaoxue.dao.impl.IrecommendDAO;
import com.tengen.jiaoxue.entity.recommendInfo;
import com.tengen.jiaoxue.service.impl.IrecommendService;

/**
 * @author Œ­³¿³¿
 *
 */
public class recommendService extends BaseService<recommendInfo> implements IrecommendService {
	private IrecommendDAO recommendDAO;

	public recommendService() {
		recommendDAO = new recommendDAO();
		setBaseDAO(recommendDAO);
	}
}
