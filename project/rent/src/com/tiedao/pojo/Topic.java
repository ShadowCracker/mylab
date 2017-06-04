package com.tiedao.pojo;

import java.util.Date;
import java.util.Set;
/**
 * 帖子信息
 * @author Administrator
 *
 */
public class Topic {

	private int id;//发帖id
	private String title;//标题
	private String content;//发帖内容
	private Date tdate;//发帖日期
	private User user;//用户
	private Set<Topic> replys;
	public Topic() {
		super();
	}
	
	public Topic(String title, String content, Date date, User user,
			Set<Topic> replys) {
		super();
		this.title = title;
		this.content = content;
		this.tdate = date;
		this.user = user;
		this.replys = replys;
	}

	public Topic(int id, String title, String content, Date date, User user,
			Set<Topic> replys) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.tdate = date;
		this.user = user;
		this.replys = replys;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	
	public Date getTdate() {
		return tdate;
	}

	public void setTdate(Date tdate) {
		this.tdate = tdate;
	}

	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public Set<Topic> getReplys() {
		return replys;
	}

	public void setReplys(Set<Topic> replys) {
		this.replys = replys;
	}

	@Override
	public String toString() {
		return "Topic [id=" + id + ", title=" + title + ", content=" + content
				+ ", date=" + tdate + ", user=" + user + "]";
	}
	
	
}
