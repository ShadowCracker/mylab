package org.lq.ssm.entity;

import java.io.Serializable;

public class Anthoies implements Serializable{

	private String name;
	private boolean flag;
	private Integer id;
	public Anthoies() {
		flag = false;
	}
	
	public Anthoies(Integer id,String name, boolean flag ) {
		super();
		this.name = name;
		this.flag = flag;
		this.id = id;
	}

	public Anthoies(String name, boolean flag) {
		super();
		this.name = name;
		this.flag = flag;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	
}
