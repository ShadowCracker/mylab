package com.tiedao.pojo;

import java.util.Date;
/**
 * 商品评价
 * @author Administrator
 *
 */
public class ProductAssess {

	private int id;//评价id
	private String content;//评价内容
	private Date pdate;//评价日期
	private Product product;
	private User user;
	
	public ProductAssess() {
		super();
	}
	
	public ProductAssess(String content, Date pdate, Product product, User user) {
		super();
		this.content = content;
		this.pdate = pdate;
		this.product = product;
		this.user = user;
	}

	public ProductAssess(int id, String content, Date pdate, Product product,
			User user) {
		super();
		this.id = id;
		this.content = content;
		this.pdate = pdate;
		this.product = product;
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}


	public Date getPdate() {
		return pdate;
	}

	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "ProductAssess [id=" + id + ", content=" + content + ", date="
				+ pdate + ", product=" + product + "]";
	}

		

}
