package com.tiedao.dao.impl;

import java.util.List;

import javassist.expr.NewArray;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.tiedao.dao.inter.UserDao;
import com.tiedao.pojo.User;

public class UserDaoImpl implements UserDao {

	private HibernateTemplate hibernateTemplate;
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	@Override
	public boolean saveUser(User user) {
		try {
			hibernateTemplate.save(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean updateUser(User user) {
		try{
			hibernateTemplate.update(user);
			return true;
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public boolean deleteUser(User user) {
		try{
			hibernateTemplate.delete(user);
			return true;
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public User findById(User user) {
		List<User> list = null;
		list = (List<User>)hibernateTemplate.find("from User where id = ?", new Object[]{user.getId()});
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public User findByLogin(User user) {
		String hql = "from User where nickName=? and password=?";
		List<User> list = (List<User>)hibernateTemplate.find(hql, new Object[]{user.getNickName(),user.getPassword()});
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public User findByNickName(User user) {
		List<User> list = (List<User>)hibernateTemplate.find("from User where nickName=?", 
				new Object[]{user.getNickName()});
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<User> findAll() {
		List<User> list = (List<User>)hibernateTemplate.find("from User");
		return list;
	}

}
