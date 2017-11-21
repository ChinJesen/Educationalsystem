package com.tengen.core.util;

import java.util.List;

public class PageUtil<E> {
	private Integer pageSize;// ��ǰҳ��
	private Integer pageNum;// ÿҳ��ʾ����
	private Integer pageNumSum;// ������
	private Integer pageSizeSum;// ��ҳ��
	private E entity;// ��ѯ����
	List<E> list; // ��ѯ���

	public PageUtil() {
		pageSize = 1;
		pageNum = 5;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getPageNum() {
		return pageNum;
	}

	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}

	public List<E> getList() {
		return list;
	}

	public void setList(List<E> list) {
		this.list = list;
	}

	public E getEntity() {
		return entity;
	}

	public void setEntity(E entity) {
		this.entity = entity;
	}

	public Integer getPageNumSum() {
		return pageNumSum;
	}

	public void setPageNumSum(Integer pageNumSum) {
		this.pageNumSum = pageNumSum;
		// ������ҳ
		if (pageNumSum % pageNum == 0) {
			pageSizeSum = pageNumSum / pageNum;
		} else {
			pageSizeSum = pageNumSum / pageNum + 1;
		}
	}

	public Integer getPageSizeSum() {
		return pageSizeSum;
	}

	public void setPageSizeSum(Integer pageSizeSum) {
		this.pageSizeSum = pageSizeSum;
	}
}
