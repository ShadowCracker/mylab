package com.tiedao.service.inter;

import java.util.List;

import com.tiedao.pojo.Reply;
import com.tiedao.pojo.Topic;


public interface ReplyService {
	
	public boolean saveReply(Reply reply);
	public boolean deleteReply(Reply reply);
	public boolean updateReply(Reply reply);
	public Reply findById(Reply reply);
	public List<Reply> findAll();
}
