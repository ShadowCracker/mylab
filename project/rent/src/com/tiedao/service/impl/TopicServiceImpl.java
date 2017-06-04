package com.tiedao.service.impl;

import java.util.List;

import com.tiedao.dao.inter.TopicDao;
import com.tiedao.pojo.Topic;
import com.tiedao.pojo.User;
import com.tiedao.service.inter.TopicService;

public class TopicServiceImpl implements TopicService {

	private TopicDao topicDao;
	
	public TopicDao getTopicDao() {
		return topicDao;
	}

	public void setTopicDao(TopicDao topicDao) {
		this.topicDao = topicDao;
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
