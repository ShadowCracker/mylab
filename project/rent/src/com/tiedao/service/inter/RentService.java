package com.tiedao.service.inter;

import java.util.List;

import com.tiedao.pojo.Rent;
import com.tiedao.pojo.User;

public interface RentService {

	public boolean saveRent(Rent Rent);
	public boolean updateRent(Rent Rent);
	public boolean deleteRent(Rent Rent);
	public Rent findById(Rent Rent);
	public List<Rent> findAll();
	public List<Rent> findByUser(User user);
}
