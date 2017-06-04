package com.tiedao.service.impl;

import java.util.List;

import com.tiedao.dao.inter.CategortyDao;
import com.tiedao.pojo.Category;
import com.tiedao.service.inter.CategoryService;

public class CategoryServiceImpl implements CategoryService {

	
	private CategortyDao categortyDao;
	
	public CategortyDao getCategortyDao() {
		return categortyDao;
	}

	public void setCategortyDao(CategortyDao categortyDao) {
		this.categortyDao = categortyDao;
	}

	@Override
	public boolean saveCategoty(Category category) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateCategoty(Category category) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteCategoty(Category category) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Category findById(Category category) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Category findByName(Category category) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Category> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
