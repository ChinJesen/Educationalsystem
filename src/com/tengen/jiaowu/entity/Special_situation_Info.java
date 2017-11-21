package com.tengen.jiaowu.entity;

public class Special_situation_Info {

	// 特殊加分情况
	private Integer spId; // 加分Id
	private String spGroups;// 小组
	private String classId;//班级
	private String stuId;// 姓名
	private String spTime; // 日期
	private String remark;// 加分情况
	private Integer status;// 状态

	public Integer getSpId() {
		return spId;
	}

	public void setSpId(Integer spId) {
		this.spId = spId;
	}

	public String getSpGroups() {
		return spGroups;
	}

	public void setSpGroups(String spGroups) {
		this.spGroups = spGroups;
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

	public String getSpTime() {
		return spTime;
	}

	public void setSpTime(String spTime) {
		this.spTime = spTime;
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
