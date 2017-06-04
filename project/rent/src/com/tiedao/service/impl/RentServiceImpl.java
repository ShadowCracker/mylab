package com.tiedao.service.impl;

import java.util.List;

import com.tiedao.dao.inter.RentDao;
import com.tiedao.pojo.Rent;
import com.tiedao.pojo.User;
import com.tiedao.service.inter.RentService;

public class RentServiceImpl implements RentService {

	private RentDao rentDao;
	
	public RentDao getRentDao() {
		return rentDao;
	}

	public void setRentDao(RentDao rentDao) {
		this.rentDao = rentDao;
	}

	@Override
	public boolean saveRent(Rent Rent) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateRent(Rent Rent) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteRent(Rent Rent) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Rent findById(Rent Rent) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Rent> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Rent> findByUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

}
