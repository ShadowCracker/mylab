package com.tiedao.service.inter;
import java.util.List;

import com.tiedao.pojo.Topic;
import com.tiedao.pojo.User;
/**
 * 主贴业务逻辑层
 * @author yangming
 */
public interface TopicService {
	
	public boolean saveTopic(Topic topic);
	public boolean deleteTopic(Topic topic);
	public boolean updateTopic(Topic topic);
	public Topic findById(Topic topic);
	public List<Topic> findAll();
	public List<Topic> findByUser(User user);
}
