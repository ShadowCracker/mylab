package com.tiedao.pojo;

import java.util.Date;
import java.util.List;
/**
 * 订单信息
 * @author Administrator
 *
 */
public class Order {

	private int id;//订单id
	private Date odate;//订单日期
	private double total;//订单金额
	private int state;//0代表待支付，1代表已支付
	private User user;//用户
	private Product product;
	
	public Order() {
		super();
	}
	
	public Order(Date odate, double total, int state, User user, Product product) {
		super();
		this.odate = odate;
		this.total = total;
		this.state = state;
		this.user = user;
		this.product = product;
	}

	public Order(int id, Date odate, double total, int state, User user,
			Product product) {
		super();
		this.id = id;
		this.odate = odate;
		this.total = total;
		this.state = state;
		this.user = user;
		this.product = product;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public Date getOdate() {
		return odate;
	}

	public void setOdate(Date odate) {
		this.odate = odate;
	}

	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}

	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", odate=" + odate + ", total=" + total
				+ ", state=" + state + ", user=" + user + ", product="
				+ product + "]";
	}

	
	
}
