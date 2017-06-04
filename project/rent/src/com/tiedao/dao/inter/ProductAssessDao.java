package com.tiedao.dao.inter;

import java.util.List;

import com.tiedao.pojo.ProductAssess;

public interface ProductAssessDao {

	public boolean saveProductAssessAssess(ProductAssess productAssess);
	public boolean updateProductAssess(ProductAssess productAssess);
	public boolean deleteProductAssess(ProductAssess productAssess);
	public ProductAssess findById(ProductAssess productAssess);
	public List<ProductAssess> findAll();
}
