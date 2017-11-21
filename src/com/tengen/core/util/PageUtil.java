package com.tengen.core.util;

import java.util.List;

public class PageUtil<E> {
	private Integer pageSize;// 当前页数
	private Integer pageNum;// 每页显示条数
	private Integer pageNumSum;// 总条数
	private Integer pageSizeSum;// 总页数
	private E entity;// 查询条件
	List<E> list; // 查询结果

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
		// 设置总页
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
