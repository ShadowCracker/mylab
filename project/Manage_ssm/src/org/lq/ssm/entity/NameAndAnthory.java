package org.lq.ssm.entity;

import java.io.Serializable;
import java.util.List;

public class NameAndAnthory implements Serializable{

	private Integer rId;
	private String roleName;
	private String anthoryName;
	private List<String> list;
	
	public NameAndAnthory() {
		super();
	}

	public NameAndAnthory(Integer rId, String roleName, List<String> list) {
		super();
		this.rId = rId;
		this.roleName = roleName;
		this.list = list;
		if(list!=null&&!"".equals(list)&&list.size()>0){
			StringBuffer sb = new StringBuffer();
			for(String str:list){
				sb.append(str+",");
			}
			anthoryName = sb.toString();
		}
	}

	public Integer getrId() {
		return rId;
	}

	public void setrId(Integer rId) {
		this.rId = rId;
	}

	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getAnthoryName() {
		return anthoryName;
	}
	public void setAnthoryName(String anthoryName) {
		this.anthoryName = anthoryName;
	}

	public List<String> getList() {
		return list;
	}

	public void setList(List<String> list) {
		this.list = list;
	}
	
	
}
