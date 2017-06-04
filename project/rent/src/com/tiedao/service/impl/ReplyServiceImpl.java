package com.tiedao.service.impl;

import java.util.List;

import com.tiedao.dao.inter.ReplyDao;
import com.tiedao.pojo.Reply;
import com.tiedao.service.inter.ReplyService;

public class ReplyServiceImpl implements ReplyService {

	private ReplyDao replyDao;
	
	public ReplyDao getReplyDao() {
		return replyDao;
	}

	public void setReplyDao(ReplyDao replyDao) {
		this.replyDao = replyDao;
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
