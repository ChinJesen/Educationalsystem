package com.tengen.jiaowu.entity;

public class Special_situation_Info {

	// ����ӷ����
	private Integer spId; // �ӷ�Id
	private String spGroups;// С��
	private String classId;//�༶
	private String stuId;// ����
	private String spTime; // ����
	private String remark;// �ӷ����
	private Integer status;// ״̬

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
