package com.tengen.admin.dao.impl;

import java.util.List;
import java.util.Map;

import com.tengen.core.dao.impl.IBaseDAO;
import com.tengen.admin.entity.RoleInfo;

public interface IRoleMrgDAO extends IBaseDAO<RoleInfo> {
public List<RoleInfo> queryAll();
public Map<String,String> getRoleMap();
public Map<String,List<String>> getpriveMap();
}
