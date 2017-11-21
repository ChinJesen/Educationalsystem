/**
 * 
 */
package com.tengen.commonalityInfo.service;

import com.tengen.commonalityInfo.dao.commonalityInfoDAO;
import com.tengen.commonalityInfo.dao.impl.IcommonalityInfoDAO;
import com.tengen.commonalityInfo.entity.commonalityInfo;
import com.tengen.commonalityInfo.service.impl.IcommonalityInfoService;
import com.tengen.core.service.BaseService;

/**
 * @author Œ­³¿³¿
 *
 */
public class commonalityInfoService extends BaseService<commonalityInfo> implements IcommonalityInfoService {
	private IcommonalityInfoDAO commonalityInfoDAO;

	public commonalityInfoService() {
		commonalityInfoDAO = new commonalityInfoDAO();
		setBaseDAO(commonalityInfoDAO);
	}
}
