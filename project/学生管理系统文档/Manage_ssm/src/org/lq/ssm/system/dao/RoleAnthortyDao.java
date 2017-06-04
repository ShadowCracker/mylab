package org.lq.ssm.system.dao;

import org.apache.ibatis.annotations.Param;
import org.lq.ssm.entity.Role;
import org.lq.ssm.entity.RoleAnthorty;

public interface RoleAnthortyDao {

	public int save(RoleAnthorty roleAnthorty);//保存
	public int update(RoleAnthorty roleAnthorty);//更新
	public int delete(@Param("rid")int id);//删除
	public int deleRoleAnth(@Param("rid")int id);//删除
}
