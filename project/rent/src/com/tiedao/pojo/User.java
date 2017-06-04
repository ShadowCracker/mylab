package com.tiedao.pojo;

import java.util.List;
import java.util.Set;

/**
 * 用户信息
 * @author Administrator
 *
 */
public class User {

	private int id;//id
	private String realName;//真实姓名
	private String nickName;//昵称
	private String password;//密码
	private String address;//地址
	private String email;//邮箱
	private String qq;//qq
	private String phone;//电话
	private int credit;//积分
	private int state;//状态  0代表禁用状态，1代表正常状态
	private Role role;//角色
	private Set<Product> products;//所出租的商品
	private Set<Message> messages;//对网站所有的留言
	private Set<Wanted> wanteds;//所有求租信息
	private Set<Rent> rents;//所有出租信息
	private Set<Topic> topics;//所有发帖信息
	private Set<Order> orders;
	private Set<ProductAssess> proassess;//商品评价
	
	public User() {
		super();
	}

	public User(String realName, String nickName, String password,
			String address, String email, String qq, String phone, int credit,
			int state, Role role, Set<Product> products, Set<Message> messages,
			Set<Wanted> wanteds, Set<Rent> rents, Set<Topic> topics,
			Set<Order> orders, Set<ProductAssess> proassess) {
		super();
		this.realName = realName;
		this.nickName = nickName;
		this.password = password;
		this.address = address;
		this.email = email;
		this.qq = qq;
		this.phone = phone;
		this.credit = credit;
		this.state = state;
		this.role = role;
		this.products = products;
		this.messages = messages;
		this.wanteds = wanteds;
		this.rents = rents;
		this.topics = topics;
		this.orders = orders;
		this.proassess = proassess;
	}

	public User(int id, String realName, String nickName, String password,
			String address, String email, String qq, String phone, int credit,
			int state, Role role, Set<Product> products, Set<Message> messages,
			Set<Wanted> wanteds, Set<Rent> rents, Set<Topic> topics,
			Set<Order> orders, Set<ProductAssess> proassess) {
		super();
		this.id = id;
		this.realName = realName;
		this.nickName = nickName;
		this.password = password;
		this.address = address;
		this.email = email;
		this.qq = qq;
		this.phone = phone;
		this.credit = credit;
		this.state = state;
		this.role = role;
		this.products = products;
		this.messages = messages;
		this.wanteds = wanteds;
		this.rents = rents;
		this.topics = topics;
		this.orders = orders;
		this.proassess = proassess;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getCredit() {
		return credit;
	}
	public void setCredit(int credit) {
		this.credit = credit;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}
	
	public Set<Message> getMessages() {
		return messages;
	}

	public void setMessages(Set<Message> messages) {
		this.messages = messages;
	}

	public Set<Wanted> getWanteds() {
		return wanteds;
	}

	public void setWanteds(Set<Wanted> wanteds) {
		this.wanteds = wanteds;
	}

	public Set<Rent> getRents() {
		return rents;
	}

	public void setRents(Set<Rent> rents) {
		this.rents = rents;
	}

	public Set<Topic> getTopics() {
		return topics;
	}

	public void setTopics(Set<Topic> topics) {
		this.topics = topics;
	}

	public Set<Order> getOrders() {
		return orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}
	
	public Set<ProductAssess> getProassess() {
		return proassess;
	}

	public void setProassess(Set<ProductAssess> proassess) {
		this.proassess = proassess;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", realName=" + realName + ", nickName="
				+ nickName + ", password=" + password + ", address=" + address
				+ ", email=" + email + ", qq=" + qq + ", phone=" + phone
				+ ", credit=" + credit + ", state=" + state + "]";
	}
	
	
}
