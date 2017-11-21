/**
 * 
 */
package com.tengen.jiaoxue.entity;

/**
 * @author 尛晨晨
 *
 */
public class stage_test_grades {
	private Integer staserial;// 序号
	private Integer classId;// 班级
	private Integer stuId;// 姓名
	private Integer written;// 笔试分数
	private Integer embarkation;// 上机分数
	private Integer grades;// 总分
	private String remark;// 备注
	private Integer stage;// 阶段
	private String project;// 项目部
	private String time;// 时间
	private Integer status;// 状态
	
	
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getStaserial() {
		return staserial;
	}

	public void setStaserial(Integer staserial) {
		this.staserial = staserial;
	}

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

	public Integer getWritten() {
		return written;
	}

	public void setWritten(Integer written) {
		this.written = written;
	}

	public Integer getEmbarkation() {
		return embarkation;
	}

	public void setEmbarkation(Integer embarkation) {
		this.embarkation = embarkation;
	}

	public Integer getGrades() {
		return grades;
	}

	public void setGrades(Integer grades) {
		this.grades = grades;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getStage() {
		return stage;
	}

	public void setStage(Integer stage) {
		this.stage = stage;
	}

	public String getProject() {
		return project;
	}

	public void setProject(String project) {
		this.project = project;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
}
