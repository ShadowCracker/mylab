package com.tiedao.dao.inter;

import java.util.List;

import com.tiedao.pojo.Category;

public interface CategortyDao {

	public boolean saveCategoty(Category category);
	public boolean updateCategoty(Category category);
	public boolean deleteCategoty(Category category);
	public Category findById(Category category);
	public Category findByName(Category category);
	public List<Category> findAll();
}
