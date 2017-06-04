package org.lq.ssm.system.service.impl;

import javax.annotation.Resource;

import org.lq.ssm.entity.RoleAnthorty;
import org.lq.ssm.system.dao.RoleAnthortyDao;
import org.lq.ssm.system.dao.RoleDao;
import org.lq.ssm.system.service.RoleAnthortyBiz;
import org.springframework.stereotype.Service;

@Service("roleAnthoryBizImpl")
public class RoleAnthoryBizImpl implements RoleAnthortyBiz{

	@Resource(name="roleAnthortyDao")
	private RoleAnthortyDao roleAnthortyDao;
	
	@Override
	public int save(RoleAnthorty roleAnthorty) {
		// TODO Auto-generated method stub
		return roleAnthortyDao.save(roleAnthorty);
	}

	@Override
	public int update(RoleAnthorty roleAnthorty) {
		// TODO Auto-generated method stub
		return roleAnthortyDao.update(roleAnthorty);
	}

	@Override
	public int delete(int id) {
		// TODO Auto-generated method stub
		return roleAnthortyDao.delete(id);
	}

	public RoleAnthortyDao getRoleAnthortyDao() {
		return roleAnthortyDao;
	}

	public void setRoleAnthortyDao(RoleAnthortyDao roleAnthortyDao) {
		this.roleAnthortyDao = roleAnthortyDao;
	}

	@Override
	public int deleRoleAnth(int id) {
		// TODO Auto-generated method stub
		return roleAnthortyDao.deleRoleAnth(id);
	}

}
