package org.lq.ssm.system.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.lq.ssm.entity.Anthorty;

public interface AnthortyDao {
        /**
         * 权限系统dao接口
         */
	public List<Anthorty> findAllMenu();//查询全部
	public List<Anthorty> findAll();
	public List<Anthorty> findAllChild();
	public int save(Anthorty s);//保存
	public int update(Anthorty s);//更新
	public int delete(@Param("id")int id);//删除
	public Anthorty findById(@Param("id")int id);//根据Id查询
	public Anthorty findByName(@Param("name")String name);//根据Id查询
	//查询子级
	public List<Anthorty> findChildren(@Param("id")int id);//查询父级(子级)菜单(根据父级Id判断)
	//查询父级
	public List<Anthorty> findParent();
	public List<Anthorty> findParentByRId(int rId);
	public List<Anthorty> findAnthortyByRoleId(@Param("id")int id);
	public Anthorty findParentById(@Param("id")int id);//根据Id查询
	
}
