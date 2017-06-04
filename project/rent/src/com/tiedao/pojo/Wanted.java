package com.tiedao.pojo;

import java.util.Date;

/**
 * 求租信息
 * @author Administrator
 *
 */
public class Wanted {

	private int id;//id
	private String title;//标题
	private String infor;//具体内容
	private double rentFree;//租金
	private double deposit;//押金
	private Date startTime;//租借开始时间
	private Date endTime;//租借结束时间
	private int quantity;//数量
	private User user;//用户
	
	public Wanted() {
		super();
	}
	public Wanted(String title, String infor, double rentFree, double deposit,
			Date startTime, Date endTime, int quantity, User user) {
		super();
		this.title = title;
		this.infor = infor;
		this.rentFree = rentFree;
		this.deposit = deposit;
		this.startTime = startTime;
		this.endTime = endTime;
		this.quantity = quantity;
		this.user = user;
	}
	public Wanted(int id, String title, String infor, double rentFree,
			double deposit, Date startTime, Date endTime, int quantity,
			User user) {
		super();
		this.id = id;
		this.title = title;
		this.infor = infor;
		this.rentFree = rentFree;
		this.deposit = deposit;
		this.startTime = startTime;
		this.endTime = endTime;
		this.quantity = quantity;
		this.user = user;
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
	public String getInfor() {
		return infor;
	}
	public void setInfor(String infor) {
		this.infor = infor;
	}
	public double getRentFree() {
		return rentFree;
	}
	public void setRentFree(double rentFree) {
		this.rentFree = rentFree;
	}
	public double getDeposit() {
		return deposit;
	}
	public void setDeposit(double deposit) {
		this.deposit = deposit;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Wanted [id=" + id + ", title=" + title + ", infor=" + infor
				+ ", rentFree=" + rentFree + ", deposit=" + deposit
				+ ", startTime=" + startTime + ", endTime=" + endTime
				+ ", quantity=" + quantity + ", user=" + user + "]";
	}
	
	
}
