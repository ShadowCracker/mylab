package com.tiedao.dao.inter;

import java.util.List;

import com.tiedao.pojo.User;

public interface UserDao {

	public boolean saveUser(User user);
	public boolean updateUser(User user);
	public boolean deleteUser(User user);
	public User findById(User user);
	public User findByLogin(User user);
	public User findByNickName(User user);
	public List<User> findAll();
	
}
