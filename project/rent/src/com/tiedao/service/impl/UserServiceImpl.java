package com.tiedao.service.impl;

import java.util.List;

import com.tiedao.dao.inter.UserDao;
import com.tiedao.pojo.User;
import com.tiedao.service.inter.UserService;

public class UserServiceImpl implements UserService {

	private UserDao userDao;
	
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public boolean saveUser(User user) {
		return userDao.saveUser(user);
	}

	@Override
	public boolean updateUser(User user) {
		return userDao.updateUser(user);
	}

	@Override
	public boolean deleteUser(User user) {
		
		return userDao.deleteUser(user);
	}

	@Override
	public User findById(User user) {
		return userDao.findById(user);
	}

	@Override
	public User findByLogin(User user) {
		return userDao.findByLogin(user);
	}

	@Override
	public User findByNickName(User user) {
		return userDao.findByNickName(user);
	}

	@Override
	public List<User> findAll() {
		return userDao.findAll();
	}

}
