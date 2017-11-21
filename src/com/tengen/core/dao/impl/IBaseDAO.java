/**
 * 
 */
package com.tengen.core.dao.impl;

import com.tengen.core.util.PageUtil;

/**
 * @author 尛晨晨
 *
 */
public interface IBaseDAO<E> {
	/**
	 * 通用保存方法
	 * 
	 * @param e
	 */
	public boolean saveInfo(E e);

	/**
	 * 通用修改方法
	 * 
	 * @param e
	 */
	public void modifyInfo(E e);

	/**
	 * 通用删除方法
	 * 
	 * @param id
	 */
	public void delete(Object id);

	/**
	 * 通用查询方法【多条记录】
	 * 
	 * @param e
	 */
	public void queryInfo(PageUtil<E> pageUtil);

	/**
	 * 通用查询方法【单条记录】
	 * 
	 * @param id
	 * @return
	 */
	public E queryById(Object id);

}
