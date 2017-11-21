package com.tengen.jiaowu.entity;

public class Attendance_Info {
	// 考勤表
	private Integer adId;// 考勤ID
	
	private Integer stuId;// 姓名
	private String classId;// 班级
	private String adTime; // 日期
	private String adsituation;// 出勤情况
	private String remark;// 备注
	private Integer status;// 状态

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
