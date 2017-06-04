package com.tiedao.pojo;

import java.util.Set;

/**
 * 商品类别
 * @author Administrator
 *
 */
public class Category {

	private int id;//商品类别id
	private String name;//商品类别名称
	private String infor;//商品类别详细描述
	private Set<Product> products;//商品
	
	public Category() {
		super();
	}
	
	public Category(String name, String infor, Set<Product> products) {
		super();
		this.name = name;
		this.infor = infor;
		this.products = products;
	}

	public Category(int id, String name, String infor, Set<Product> products) {
		super();
		this.id = id;
		this.name = name;
		this.infor = infor;
		this.products = products;
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
	public String getInfor() {
		return infor;
	}
	public void setInfor(String infor) {
		this.infor = infor;
	}
	
	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + ", infor=" + infor
				+ "]";
	}
	
}
