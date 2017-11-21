package com.tengen.jiaowu.service;

import com.tengen.core.service.BaseService;
import com.tengen.jiaowu.dao.ClassDAO;
import com.tengen.jiaowu.dao.impl.IClassDAO;
import com.tengen.jiaowu.entity.Class_Info;
import com.tengen.jiaowu.service.impl.IClassService;

public class ClassService extends BaseService<Class_Info> implements IClassService{
 
	private IClassDAO cd;
	public ClassService(){
		cd=new ClassDAO();
		setBaseDAO(cd);
	}
}
