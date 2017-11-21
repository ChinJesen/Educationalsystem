/**
 * 
 */
package com.tengen.jiaoxue.entity;

/**
 * @author 尛晨晨
 *
 */
public class recommendInfo {
	private Integer jobId;// 就业id
	private Integer stuId;// 推荐就业学生姓名
	private Integer classId;// 推荐就业班级
	private String recommendwork;// 推荐岗位
	private String recommendremark;// 描述
	private Integer status;// 状态

	public Integer getJobId() {
		return jobId;
	}

	public void setJobId(Integer jobId) {
		this.jobId = jobId;
	}

	public Integer getStuId() {
		return stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public Integer getClassId() {
		return classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	public String getRecommendwork() {
		return recommendwork;
	}

	public void setRecommendwork(String recommendwork) {
		this.recommendwork = recommendwork;
	}

	public String getRecommendremark() {
		return recommendremark;
	}

	public void setRecommendremark(String recommendremark) {
		this.recommendremark = recommendremark;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
}
