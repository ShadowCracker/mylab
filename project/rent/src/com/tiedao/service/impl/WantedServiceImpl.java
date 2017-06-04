package com.tiedao.service.impl;

import java.util.List;

import com.tiedao.dao.inter.WantedDao;
import com.tiedao.pojo.User;
import com.tiedao.pojo.Wanted;
import com.tiedao.service.inter.WantedService;

public class WantedServiceImpl implements WantedService {

	private WantedDao wantedDao;
	
	public WantedDao getWantedDao() {
		return wantedDao;
	}

	public void setWantedDao(WantedDao wantedDao) {
		this.wantedDao = wantedDao;
	}

	@Override
	public boolean saveWanted(Wanted Wanted) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateWanted(Wanted Wanted) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteWanted(Wanted Wanted) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Wanted findById(Wanted Wanted) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Wanted> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Wanted> findByUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

}
