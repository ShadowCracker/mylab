package com.tiedao.service.impl;

import java.util.List;

import com.tiedao.dao.inter.MessageDao;
import com.tiedao.pojo.Message;
import com.tiedao.service.inter.MessageService;

public class MessageServiceImpl implements MessageService {

	private MessageDao messageDao;
	
	public MessageDao getMessageDao() {
		return messageDao;
	}

	public void setMessageDao(MessageDao messageDao) {
		this.messageDao = messageDao;
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
