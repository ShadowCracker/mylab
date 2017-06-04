package com.tiedao.pojo;

import java.util.Date;
import java.util.Set;
/**
 * 商品信息
 * @author Administrator
 *
 */
public class Product {

	private int id;//商品id
	private String name;//商品名称
	private double rentFree;//租金
	private double deposit;//定金
	private int quantity;//数量
	private String infor;//商品详细描述
	private String photoPath;//图片路径
	private Date pdate;//商品发布时间
	private Category category;//商品目录
	private User user;//商品所属用户
	private Set<ProductAssess> evaluate;
	private Order order;
	public Product() {
		super();
	}
	
	public Product(String name, double rentFree, double deposit, int quantity,
			String infor, String photoPath, Date pdate, Category category,
			User user, Set<ProductAssess> evaluate, Order order) {
		super();
		this.name = name;
		this.rentFree = rentFree;
		this.deposit = deposit;
		this.quantity = quantity;
		this.infor = infor;
		this.photoPath = photoPath;
		this.pdate = pdate;
		this.category = category;
		this.user = user;
		this.evaluate = evaluate;
		this.order = order;
	}

	public Product(int id, String name, double rentFree, double deposit,
			int quantity, String infor, String photoPath, Date pdate,
			Category category, User user, Set<ProductAssess> evaluate,
			Order order) {
		super();
		this.id = id;
		this.name = name;
		this.rentFree = rentFree;
		this.deposit = deposit;
		this.quantity = quantity;
		this.infor = infor;
		this.photoPath = photoPath;
		this.pdate = pdate;
		this.category = category;
		this.user = user;
		this.evaluate = evaluate;
		this.order = order;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getInfor() {
		return infor;
	}
	public void setInfor(String infor) {
		this.infor = infor;
	}
	public String getPhotoPath() {
		return photoPath;
	}
	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}
	
	public Date getPdate() {
		return pdate;
	}

	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}

	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public Set<ProductAssess> getEvaluate() {
		return evaluate;
	}

	public void setEvaluate(Set<ProductAssess> evaluate) {
		this.evaluate = evaluate;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", rentFree="
				+ rentFree + ", deposit=" + deposit + ", quantity=" + quantity
				+ ", infor=" + infor + ", photoPath=" + photoPath + ", date="
				+ pdate +  "]";
	}
	
}
