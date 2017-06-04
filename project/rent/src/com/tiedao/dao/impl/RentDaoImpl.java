package com.tiedao.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.tiedao.dao.inter.RentDao;
import com.tiedao.pojo.Rent;
import com.tiedao.pojo.User;

public class RentDaoImpl implements RentDao {

private HibernateTemplate hibernateTemplate;
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	@Override
	public boolean saveRent(Rent Rent) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateRent(Rent Rent) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteRent(Rent Rent) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Rent findById(Rent Rent) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Rent> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Rent> findByUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

}
