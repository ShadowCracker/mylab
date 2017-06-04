package com.tiedao.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.tiedao.dao.inter.MessageDao;
import com.tiedao.pojo.Message;

public class MessageDaoImpl implements MessageDao {

private HibernateTemplate hibernateTemplate;
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	@Override
	public boolean saveMessage(Message Message) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateMessage(Message Message) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteMessage(Message Message) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Message findById(Message Message) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Message> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Message> findByUser(Message message) {
		// TODO Auto-generated method stub
		return null;
	}

}
