package com.tengen.core.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class PriveTag extends SimpleTagSupport {
	private String item;

	@Override
	public void doTag() throws JspException, IOException {
		System.out.println(item);
	}

	public void setItem(String item) {
		this.item = item;
	}

}
