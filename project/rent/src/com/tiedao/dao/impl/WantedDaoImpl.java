package com.tiedao.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.tiedao.dao.inter.WantedDao;
import com.tiedao.pojo.User;
import com.tiedao.pojo.Wanted;

public class WantedDaoImpl implements WantedDao {

	private HibernateTemplate hibernateTemplate;
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public boolean saveWanted(Wanted Wanted) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateWanted(Wanted Wanted) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteWanted(Wanted Wanted) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Wanted findById(Wanted Wanted) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Wanted> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Wanted> findByUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

}
