package com.tengen.core.tag;

import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import com.tengen.core.util.CommUtil;
import com.tengen.admin.entity.UserInfo;

public class PriveMrgTag extends TagSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String value;

	@Override
	public int doStartTag() throws JspException {
		Object obj = pageContext.getSession().getAttribute("userInfo");
		if (obj != null) {
			UserInfo user = (UserInfo) obj;
			List<String> priveList = CommUtil.newInstance().getroleList(user.getRoleId());
			if (priveList.contains(value))
				return EVAL_BODY_INCLUDE;// 返回标签主体
		}
		return SKIP_BODY;
	}

	public void setValue(String value) {
		this.value = value;
	}

}
