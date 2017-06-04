package com.tiedao.pojo;

import java.util.Date;

/**
 * 出租商品
 * @author Administrator
 *
 */
public class Rent {

	private int id;//id
	private String title;//标题
	private double rentFree;//租金
	private double deposit;//押金
	private int quantity;//数量
	private String photoPath;//照片路径
	private String infor;//详细信息
	private Date rdate;//出租日期
	private User user;//出租用户
	
	public Rent() {
		super();
	}

	public Rent(String title, double rentFree, double deposit, int quantity,
			String photoPath, String infor, Date date, User user) {
		super();
		this.title = title;
		this.rentFree = rentFree;
		this.deposit = deposit;
		this.quantity = quantity;
		this.photoPath = photoPath;
		this.infor = infor;
		this.rdate = date;
		this.user = user;
	}

	public Rent(int id, String title, double rentFree, double deposit,
			int quantity, String photoPath, String infor, Date date, User user) {
		super();
		this.id = id;
		this.title = title;
		this.rentFree = rentFree;
		this.deposit = deposit;
		this.quantity = quantity;
		this.photoPath = photoPath;
		this.infor = infor;
		this.rdate = date;
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getPhotoPath() {
		return photoPath;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	public String getInfor() {
		return infor;
	}

	public void setInfor(String infor) {
		this.infor = infor;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	@Override
	public String toString() {
		return "Rent [id=" + id + ", title=" + title + ", rentFree=" + rentFree
				+ ", deposit=" + deposit + ", quantity=" + quantity
				+ ", photoPath=" + photoPath + ", infor=" + infor + ", date="
				+ rdate + ", user=" + user + "]";
	}

	
	
}
