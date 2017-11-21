package com.tengen.jiaowu.dao.impl;

import java.util.List;
import java.util.Map;

import com.tengen.core.dao.impl.IBaseDAO;
import com.tengen.jiaowu.entity.Class_Info;

public interface IClassDAO extends IBaseDAO<Class_Info>{

	public List<Class_Info> queryAll();
	Map<Integer, String> getClassMap();

}
