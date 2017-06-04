package com.tiedao.service.inter;

import java.util.List;

import com.tiedao.pojo.Order;
import com.tiedao.pojo.User;

public interface OrderService {

	public boolean saveOrder(Order Order);
	public boolean deleteOrder(Order Order);
	public Order findById(Order Order);
	public List<Order> findAll();
	public List<Order> findByUser(User user);
}
