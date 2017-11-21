/**
 * 
 */
package com.tengen.jiaoxue.entity;

/**
 * @author 尛晨晨
 *
 */
public class pacific_task_grades {
	private Integer hwserial;// 作业序号
	private Integer score;// 作业分数
	private Integer classId;// 班级
	private String groups;// 小组
	private Integer stuId;// 姓名
	private String sex;// 性别
	private String task_date;// 作业日期
	private String homework;// 作业内容

	public Integer getClassId() {
		return classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	public Integer getHwserial() {
		return hwserial;
	}

	public void setHwserial(Integer hwserial) {
		this.hwserial = hwserial;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public String getHomework() {
		return homework;
	}

	public void setHomework(String homework) {
		this.homework = homework;
	}

	public String getGroups() {
		return groups;
	}

	public void setGroups(String groups) {
		this.groups = groups;
	}

	public Integer getStuId() {
		return stuId;
	}

	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getTask_date() {
		return task_date;
	}

	public void setTask_date(String task_date) {
		this.task_date = task_date;
	}

}
