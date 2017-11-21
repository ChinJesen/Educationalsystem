/**
 * 
 */
package com.tengen.commonalityInfo.dao.impl;

import java.util.List;
import java.util.Map;

import com.tengen.commonalityInfo.entity.commonalityInfo;
import com.tengen.core.dao.impl.IBaseDAO;

/**
 * @author Œ­³¿³¿
 *
 */
public interface IcommonalityInfoDAO extends IBaseDAO<commonalityInfo> {

	/**
	 * @return
	 */
	List<com.tengen.commonalityInfo.entity.commonalityInfo> queryAll();
	Map<Integer, String> getStuNameMap();

}
