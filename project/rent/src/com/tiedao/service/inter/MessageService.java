package com.tiedao.service.inter;

import java.util.List;

import com.tiedao.pojo.Message;

public interface MessageService {

	public boolean saveMessage(Message Message);
	public boolean updateMessage(Message Message);
	public boolean deleteMessage(Message Message);
	public Message findById(Message Message);
	public List<Message> findAll();
	public List<Message> findByUser(Message message);
}
