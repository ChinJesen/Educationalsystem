package com.tengen.jiaowu.entity;

public class Evaluation_Info {
	//综合评分
	   private Integer sqId;// 评分  Id
	   private Integer classId;//班级
	   private Integer  stuId;//姓名
	   private String role;//班级角色
	   private String expression;//表达
	   private String attainment;//素养
	   private String outdoor  ;// 户外拓展  
	   private String language;//语言表达能力
	   private String cooperation;//团队协作能力
	   private String spgTime ;// 时间管理
	   private String protocol;//职业礼仪
	   private String project;// 项目部
	   private String interview1 ; //访谈1
	   private String interview2;// 访谈2
	   private String interview3 ; // 访谈3
	   private Integer status ;//状态
	

	public Integer getClassId() {
		return classId;
	}
	public void setClassId(Integer classId) {
		this.classId = classId;
	}
	public Integer getStuId() {
		return stuId;
	}
	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}
	public Integer getSqId() {
		return sqId;
	}
	public void setSqId(Integer sqId) {
		this.sqId = sqId;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getExpression() {
		return expression;
	}
	public void setExpression(String expression) {
		this.expression = expression;
	}
	public String getAttainment() {
		return attainment;
	}
	public void setAttainment(String attainment) {
		this.attainment = attainment;
	}
	public String getInterview1() {
		return interview1;
	}
	public void setInterview1(String interview1) {
		this.interview1 = interview1;
	}
	public String getInterview2() {
		return interview2;
	}
	public void setInterview2(String interview2) {
		this.interview2 = interview2;
	}
	public String getInterview3() {
		return interview3;
	}
	public void setInterview3(String interview3) {
		this.interview3 = interview3;
	}
	public String getOutdoor() {
		return outdoor;
	}
	public void setOutdoor(String outdoor) {
		this.outdoor = outdoor;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getCooperation() {
		return cooperation;
	}
	public void setCooperation(String cooperation) {
		this.cooperation = cooperation;
	}
	public String getSpgTime() {
		return spgTime;
	}
	public void setSpgTime(String spgTime) {
		this.spgTime = spgTime;
	}
	public String getProtocol() {
		return protocol;
	}
	public void setProtocol(String protocol) {
		this.protocol = protocol;
	}
	public String getProject() {
		return project;
	}
	public void setProject(String project) {
		this.project = project;
	}

	   
}
