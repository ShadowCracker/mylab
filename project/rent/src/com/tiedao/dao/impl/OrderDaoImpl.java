package com.tiedao.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.tiedao.dao.inter.OrderDao;
import com.tiedao.pojo.Order;
import com.tiedao.pojo.User;

public class OrderDaoImpl implements OrderDao {

private HibernateTemplate hibernateTemplate;
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	@Override
	public boolean saveOrder(Order Order) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteOrder(Order Order) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Order findById(Order Order) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Order> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Order> findByUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

}
