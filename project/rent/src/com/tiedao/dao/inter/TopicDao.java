package com.tiedao.dao.inter;

import java.util.List;

import com.tiedao.pojo.Topic;
import com.tiedao.pojo.User;


public interface TopicDao {
	
	public boolean saveTopic(Topic topic);

	public boolean deleteTopic(Topic topic);

	public boolean updateTopic(Topic topic);

	public Topic findById(Topic topic);

	public List<Topic> findAll();
	public List<Topic> findByUser(User user);

}
