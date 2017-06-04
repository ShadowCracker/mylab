package com.tiedao.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.tiedao.dao.inter.TopicDao;
import com.tiedao.pojo.Topic;
import com.tiedao.pojo.User;

public class TopicDaoImpl implements TopicDao {

private HibernateTemplate hibernateTemplate;
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	@Override
	public boolean saveTopic(Topic topic) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteTopic(Topic topic) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateTopic(Topic topic) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Topic findById(Topic topic) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Topic> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Topic> findByUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

}
