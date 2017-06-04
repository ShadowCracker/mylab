package com.tiedao.pojo;

import java.util.Date;
/**
 * 用户对网站的留言
 * @author Administrator
 *
 */
public class Message {

	private int id;//留言的id
	private String content;//留言内容
	private Date mdate;//留言的日期
	private User user;//用户
	
	public Message() {
		super();
	}
	public Message(String content, Date date, User user) {
		super();
		this.content = content;
		this.mdate = date;
		this.user = user;
	}
	public Message(int id, String content, Date date, User user) {
		super();
		this.id = id;
		this.content = content;
		this.mdate = date;
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
	public Date getMdate() {
		return mdate;
	}
	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Message [id=" + id + ", content=" + content + ", date=" + mdate
				+ ", user=" + user+ "]";
	}
	
	
}
