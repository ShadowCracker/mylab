package org.lq.ssm.entity;

import java.io.Serializable;

public class RoleAnthorty implements Serializable{
  /**
   * 角色权限连接表
   */
	private Integer id;//角色权限编号
	private Integer rid;//角色编号
	private Integer aid;//权限编号
	
	public RoleAnthorty() {
		super();
	}
	
	public RoleAnthorty(Integer rid, Integer aid) {
		super();
		this.rid = rid;
		this.aid = aid;
	}

	public RoleAnthorty(Integer id, Integer rid, Integer aid) {
		super();
		this.id = id;
		this.rid = rid;
		this.aid = aid;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getRid() {
		return rid;
	}
	public void setRid(Integer rid) {
		this.rid = rid;
	}
	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
	}
	
	
	
}
