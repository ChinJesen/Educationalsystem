package com.tengen.admin.dao.impl;

import java.util.List;
import java.util.Map;

import com.tengen.core.dao.impl.IBaseDAO;
import com.tengen.admin.entity.DictItem;

public interface IDictMargDAO extends IBaseDAO<DictItem> {
	public Map<String,Map<String,String>> getDictMap();
	public List<DictItem> queryAll();
	public Map<String,String> getGroupMap();
	public Map<String,List<DictItem>> getDictList();
	public void saveDictItems(List<DictItem> dictList, String groupCode);
;
}
