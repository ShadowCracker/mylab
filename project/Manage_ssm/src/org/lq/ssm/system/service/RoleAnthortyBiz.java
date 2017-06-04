package org.lq.ssm.system.service;

import org.apache.ibatis.annotations.Param;
import org.lq.ssm.entity.RoleAnthorty;

public interface RoleAnthortyBiz {

	public int save(RoleAnthorty roleAnthorty);//保存
	public int update(RoleAnthorty roleAnthorty);//更新
	public int delete(int id);//删除
	public int deleRoleAnth(int id);//删除
}
