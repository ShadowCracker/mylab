package com.tiedao.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.tiedao.dao.inter.ReplyDao;
import com.tiedao.pojo.Reply;

public class ReplyDaoImpl implements ReplyDao {

private HibernateTemplate hibernateTemplate;
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	@Override
	public boolean saveReply(Reply reply) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteReply(Reply reply) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateReply(Reply reply) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Reply findById(Reply reply) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Reply> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
