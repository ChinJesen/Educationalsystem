/**
 * 
 */
package com.tengen.jiaoxue.entity;

/**
 * @author ������
 *
 */
public class recommendInfo {
	private Integer jobId;// ��ҵid
	private Integer stuId;// �Ƽ���ҵѧ������
	private Integer classId;// �Ƽ���ҵ�༶
	private String recommendwork;// �Ƽ���λ
	private String recommendremark;// ����
	private Integer status;// ״̬

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
