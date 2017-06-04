package com.tiedao.pojo;

import java.util.Set;

/**
 * 角色信息
 * @author Administrator
 *
 */
public class Role {

	private int id;//角色id
	private String name;//角色名称
	private String infor;//详细信息
	private Set<User> users;
	public Role() {
		super();
	}
	
	public Role(String name, String infor, Set<User> users) {
		super();
		this.name = name;
		this.infor = infor;
		this.users = users;
	}

	public Role(int id, String name, String infor, Set<User> users) {
		super();
		this.id = id;
		this.name = name;
		this.infor = infor;
		this.users = users;
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
	
	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return "Role [id=" + id + ", name=" + name + ", infor=" + infor + "]";
	}
	
	
}
