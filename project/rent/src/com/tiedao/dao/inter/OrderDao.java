package com.tiedao.dao.inter;

import java.util.List;

import com.tiedao.pojo.Order;
import com.tiedao.pojo.User;

public interface OrderDao {

	public boolean saveOrder(Order Order);
	public boolean deleteOrder(Order Order);
	public Order findById(Order Order);
	public List<Order> findAll();
	public List<Order> findByUser(User user);
}
