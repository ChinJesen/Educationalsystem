/**
 * 
 */
package com.tengen.core.service.impl;

import com.tengen.core.util.PageUtil;

/**
 * @author ������
 *
 */
public interface IBaseService<E> {
	/**
	 * ͨ�ñ��淽��
	 * 
	 * @param e
	 * @return
	 */
	public boolean save(E e);

	/**
	 * ͨ�ð�������ѯ����
	 * 
	 * @param pageUtil
	 */
	public void queryInfos(PageUtil<E> pageUtil);

	/**
	 * ͨ�ø���������ѯ����
	 * 
	 * @param id
	 * @return
	 */
	public E queryById(Object id);

	/**
	 * ͨ���޸ķ���
	 * 
	 * @param e
	 */
	public void modify(E e);

	/**
	 * ͨ��ɾ������
	 * 
	 * @param id
	 */
	public void deleteById(Object id);

}
