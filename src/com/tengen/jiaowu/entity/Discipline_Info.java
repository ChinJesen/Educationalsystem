package com.tengen.jiaowu.entity;

public class Discipline_Info {
	// 违纪
	private Integer dpId;// 违纪Id
	private String stuId;// 姓名
	private String classId;// 班级
	private String dpTime;// 日期
	private String dpEvent;// 事件
	private String dpSanction;// 处分
	private String remark;// 备注
	private Integer status;// 状态

	public Integer getDpId() {
		return dpId;
	}

	public void setDpId(Integer dpId) {
		this.dpId = dpId;
	}


	public String getStuId() {
		return stuId;
	}

	public void setStuId(String stuId) {
		this.stuId = stuId;
	}

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public String getDpTime() {
		return dpTime;
	}

	public void setDpTime(String dpTime) {
		this.dpTime = dpTime;
	}

	public String getDpEvent() {
		return dpEvent;
	}

	public void setDpEvent(String dpEvent) {
		this.dpEvent = dpEvent;
	}

	public String getDpSanction() {
		return dpSanction;
	}

	public void setDpSanction(String dpSanction) {
		this.dpSanction = dpSanction;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}
