package com.tiedao.service.impl;

import java.util.List;

import com.tiedao.dao.inter.ProductDao;
import com.tiedao.pojo.Product;
import com.tiedao.pojo.User;
import com.tiedao.service.inter.ProductService;

public class ProductServiceImpl implements ProductService {

	private ProductDao productDao;
	
	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	@Override
	public boolean saveProduct(Product product) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateProduct(Product product) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteProduct(Product product) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Product findById(Product product) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Product findByName(Product product) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> findByUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

}
