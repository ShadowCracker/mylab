package com.tiedao.pojo;
/**
 * 商品评价详细信息表
 * @author Administrator
 *
 */
public class ProductUser {

	private int id;//id
	private ProductAssess productAssess;//商品评价
	private User user;//用户
	
	public ProductUser() {
		super();
	}
	public ProductUser(ProductAssess productAssess, User user) {
		super();
		this.productAssess = productAssess;
		this.user = user;
	}
	public ProductUser(int id, ProductAssess productAssess, User user) {
		super();
		this.id = id;
		this.productAssess = productAssess;
		this.user = user;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public ProductAssess getProductAssess() {
		return productAssess;
	}
	public void setProductAssess(ProductAssess productAssess) {
		this.productAssess = productAssess;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "ProductUser [id=" + id + ", productAssess=" + productAssess
				+ ", user=" + user + "]";
	}
	
}
