package com.tengen.jiaowu.entity;

public class Attendance_Info {
	// ���ڱ�
	private Integer adId;// ����ID
	
	private Integer stuId;// ����
	private String classId;// �༶
	private String adTime; // ����
	private String adsituation;// �������
	private String remark;// ��ע
	private Integer status;// ״̬

	public Integer getAdId() {
		return adId;
	}

	public void setAdId(Integer adId) {
		this.adId = adId;
	}


	public Integer getStuId() {
		return stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public String getAdTime() {
		return adTime;
	}

	public void setAdTime(String adTime) {
		this.adTime = adTime;
	}

	public String getAdsituation() {
		return adsituation;
	}

	public void setAdsituation(String adsituation) {
		this.adsituation = adsituation;
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
