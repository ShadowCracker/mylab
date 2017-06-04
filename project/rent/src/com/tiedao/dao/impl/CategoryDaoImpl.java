package com.tiedao.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.tiedao.dao.inter.CategortyDao;
import com.tiedao.pojo.Category;

public class CategoryDaoImpl implements CategortyDao {

	private HibernateTemplate hibernateTemplate;
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
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
