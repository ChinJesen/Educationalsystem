/**
 * 
 */
package com.tengen.core.service;

import com.tengen.core.dao.impl.IBaseDAO;
import com.tengen.core.service.impl.IBaseService;
import com.tengen.core.util.PageUtil;

/**
 * @author Œ­³¿³¿
 *
 */
public class BaseService<E> implements IBaseService<E> {

	private IBaseDAO<E> baseDAO;

	public void setBaseDAO(IBaseDAO<E> baseDAO) {
		this.baseDAO = baseDAO;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.tengen.core.service.impl.IBaseService#save(java.lang.Object)
	 */
	@Override
	public boolean save(E e) {
		// TODO Auto-generated method stub
		return baseDAO.saveInfo(e);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.tengen.core.service.impl.IBaseService#queryInfos(com.tengen.core.util
	 * .PageUtil)
	 */
	@Override
	public void queryInfos(PageUtil<E> pageUtil) {
		// TODO Auto-generated method stub
		baseDAO.queryInfo(pageUtil);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.tengen.core.service.impl.IBaseService#queryById(java.lang.Object)
	 */
	@Override
	public E queryById(Object id) {
		// TODO Auto-generated method stub
		return baseDAO.queryById(id);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.tengen.core.service.impl.IBaseService#modify(java.lang.Object)
	 */
	@Override
	public void modify(E e) {
		// TODO Auto-generated method stub
		baseDAO.modifyInfo(e);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.tengen.core.service.impl.IBaseService#deleteById(java.lang.Object)
	 */
	@Override
	public void deleteById(Object id) {
		// TODO Auto-generated method stub
		baseDAO.delete(id);
	}

}
