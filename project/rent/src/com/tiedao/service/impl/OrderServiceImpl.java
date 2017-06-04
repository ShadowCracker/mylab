package com.tiedao.service.impl;

import java.util.List;

import com.tiedao.dao.inter.OrderDao;
import com.tiedao.pojo.Order;
import com.tiedao.pojo.User;
import com.tiedao.service.inter.OrderService;

public class OrderServiceImpl implements OrderService {

	private OrderDao orderDao;
	
	public OrderDao getOrderDao() {
		return orderDao;
	}

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
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
