package com.tengen.jiaowu.entity;

public class Class_Info {
	
	private Integer classId;//班级Id
	private String  className;//班级名称
	private Integer userId;//班主任
	private String classTeaching;//教学老师
	private String startTime;//开班时间
	private String endTime;//结束时间
	private Integer status;//状态
	public Integer getClassId() {
		return classId;
	}
	public void setClassId(Integer classId) {
		this.classId = classId;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getClassTeaching() {
		return classTeaching;
	}
	public void setClassTeaching(String classTeaching) {
		this.classTeaching = classTeaching;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
	
}
