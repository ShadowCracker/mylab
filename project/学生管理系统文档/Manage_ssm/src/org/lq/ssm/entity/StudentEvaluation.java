package org.lq.ssm.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class StudentEvaluation implements Serializable{

	/**
	 * 学员评价实体类
	 */
	
	private Integer id;//学员评价编号
	private Student student;//学院对象
	private String title;//评价主题
	private String content;//评价内容
	private String course;//课程名称
	private Staff staff;//老师对象
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date etime;//评价时间
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	
	public Staff getStaff() {
		return staff;
	}
	public void setStaff(Staff staff) {
		this.staff = staff;
	}
	public Date getEtime() {
		return etime;
	}
	public void setEtime(Date etime) {
		this.etime = etime;
	}
	
	
}
