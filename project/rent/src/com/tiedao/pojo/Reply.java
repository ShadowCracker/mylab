package com.tiedao.pojo;

import java.util.Date;
/**
 * 回帖信息
 * @author Administrator
 *
 */
public class Reply {

	private int id;//回复id
	private String content;//回复内容
	private Date rdate;//日期
	private Topic topic;//帖子信息
	private User user;//用户
	
	public Reply() {
		super();
	}
	public Reply(String content, Date date, Topic topic, User user) {
		super();
		this.content = content;
		this.rdate = date;
		this.topic = topic;
		this.user = user;
	}
	public Reply(int id, String content, Date date, Topic topic, User user) {
		super();
		this.id = id;
		this.content = content;
		this.rdate = date;
		this.topic = topic;
		this.user = user;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public Topic getTopic() {
		return topic;
	}
	public void setTopic(Topic topic) {
		this.topic = topic;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Reply [id=" + id + ", content=" + content + ", date=" + rdate
				+ ", topic=" + topic + ", user=" + user + "]";
	}
	
}
