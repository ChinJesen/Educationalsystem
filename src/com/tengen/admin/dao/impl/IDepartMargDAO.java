package com.tengen.admin.dao.impl;

import java.util.List;
import java.util.Map;

import com.tengen.core.dao.impl.IBaseDAO;
import com.tengen.admin.entity.DePartInfo;

public interface IDepartMargDAO extends IBaseDAO<DePartInfo> {
	public List<DePartInfo> queryAll();
	public Map<Integer, String> getDepartMap();

}
