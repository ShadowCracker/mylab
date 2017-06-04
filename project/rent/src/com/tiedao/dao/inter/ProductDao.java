package com.tiedao.dao.inter;

import java.util.List;

import com.tiedao.pojo.Product;
import com.tiedao.pojo.User;

public interface ProductDao {

	public boolean saveProduct(Product product);
	public boolean updateProduct(Product product);
	public boolean deleteProduct(Product product);
	public Product findById(Product product);
	public Product findByName(Product product);
	public List<Product> findAll();
	public List<Product> findByUser(User user);
}
