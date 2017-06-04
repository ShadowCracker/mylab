package com.tiedao.dao.inter;

import java.util.List;

import com.tiedao.pojo.User;
import com.tiedao.pojo.Wanted;

public interface WantedDao {

	public boolean saveWanted(Wanted Wanted);
	public boolean updateWanted(Wanted Wanted);
	public boolean deleteWanted(Wanted Wanted);
	public Wanted findById(Wanted Wanted);
	public List<Wanted> findAll();
	public List<Wanted> findByUser(User user);
}
