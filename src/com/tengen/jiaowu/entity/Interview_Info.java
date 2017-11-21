package com.tengen.jiaowu.entity;

public class Interview_Info {
	// 访谈记录
	private Integer ivId;// 访谈ID
	private String stuId;// 姓名
	private String ivSex;// 性别
	private String classId;// 班级
	private String ivTime;// 日期
	private String ivInformation;// 访谈内容
	private String ivFollow;// 是否跟进
	private String document;// 上传媒体文件
	private String remark;// 备注
	private Integer status;// 状态

	public Integer getIvId() {
		return ivId;
	}

	public void setIvId(Integer ivId) {
		this.ivId = ivId;
	}

	public String getStuId() {
		return stuId;
	}

	public void setStuId(String stuId) {
		this.stuId = stuId;
	}

	public String getIvSex() {
		return ivSex;
	}

	public void setIvSex(String ivSex) {
		this.ivSex = ivSex;
	}

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public String getIvTime() {
		return ivTime;
	}

	public void setIvTime(String ivTime) {
		this.ivTime = ivTime;
	}

	public String getIvInformation() {
		return ivInformation;
	}

	public void setIvInformation(String ivInformation) {
		this.ivInformation = ivInformation;
	}

	public String getIvFollow() {
		return ivFollow;
	}

	public void setIvFollow(String ivFollow) {
		this.ivFollow = ivFollow;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getDocument() {
		return document;
	}

	public void setDocument(String document) {
		this.document = document;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}
