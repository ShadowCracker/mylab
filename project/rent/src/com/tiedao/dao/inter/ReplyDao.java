package com.tiedao.dao.inter;

import java.util.List;

import com.tiedao.pojo.Reply;


public interface ReplyDao {
	public boolean saveReply(Reply reply);
	public boolean deleteReply(Reply reply);
	public boolean updateReply(Reply reply);
	public Reply findById(Reply reply);
	public List<Reply> findAll();
}
