/**
 * 
 */
package com.tengen.jiaoxue.entity;

/**
 * @author ������
 *
 */
public class pacific_task_grades {
	private Integer hwserial;// ��ҵ���
	private Integer score;// ��ҵ����
	private Integer classId;// �༶
	private String groups;// С��
	private Integer stuId;// ����
	private String sex;// �Ա�
	private String task_date;// ��ҵ����
	private String homework;// ��ҵ����

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
