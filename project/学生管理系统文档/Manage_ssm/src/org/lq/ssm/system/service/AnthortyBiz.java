package org.lq.ssm.system.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.lq.ssm.entity.Anthorty;

public interface AnthortyBiz {
    /**
     * 权限服务层接口
     */
	public List<Anthorty> findParentByRId(int rId);
	public List<Anthorty> findAll();
	public List<Anthorty> findAllChild();
	public List<Anthorty> findAllMenu();//查询全部
	public int save(Anthorty s);//保存
	public int update(Anthorty s);//更新
	public int delete(int id);//删除
	public Anthorty findById(int id);//根据Id查询
	//查询子级
	public List<Anthorty> findChildren(int id);
	//查询父级
	public List<Anthorty> findParent();
	//
	public Anthorty findByName(String name);//根据Id查询
	//生成json字符串
	public String getParentJson();
	public List<Anthorty> findAnthortyByRoleId(int id);
	public Anthorty findParentById(int id);//根据Id查询
}
