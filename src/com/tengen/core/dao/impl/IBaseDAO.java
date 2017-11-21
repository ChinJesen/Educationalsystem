/**
 * 
 */
package com.tengen.core.dao.impl;

import com.tengen.core.util.PageUtil;

/**
 * @author ������
 *
 */
public interface IBaseDAO<E> {
	/**
	 * ͨ�ñ��淽��
	 * 
	 * @param e
	 */
	public boolean saveInfo(E e);

	/**
	 * ͨ���޸ķ���
	 * 
	 * @param e
	 */
	public void modifyInfo(E e);

	/**
	 * ͨ��ɾ������
	 * 
	 * @param id
	 */
	public void delete(Object id);

	/**
	 * ͨ�ò�ѯ������������¼��
	 * 
	 * @param e
	 */
	public void queryInfo(PageUtil<E> pageUtil);

	/**
	 * ͨ�ò�ѯ������������¼��
	 * 
	 * @param id
	 * @return
	 */
	public E queryById(Object id);

}
