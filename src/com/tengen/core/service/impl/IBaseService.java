/**
 * 
 */
package com.tengen.core.service.impl;

import com.tengen.core.util.PageUtil;

/**
 * @author 尛晨晨
 *
 */
public interface IBaseService<E> {
	/**
	 * 通用保存方法
	 * 
	 * @param e
	 * @return
	 */
	public boolean save(E e);

	/**
	 * 通用按条件查询方法
	 * 
	 * @param pageUtil
	 */
	public void queryInfos(PageUtil<E> pageUtil);

	/**
	 * 通用根据主键查询方法
	 * 
	 * @param id
	 * @return
	 */
	public E queryById(Object id);

	/**
	 * 通用修改方法
	 * 
	 * @param e
	 */
	public void modify(E e);

	/**
	 * 通用删除方法
	 * 
	 * @param id
	 */
	public void deleteById(Object id);

}
