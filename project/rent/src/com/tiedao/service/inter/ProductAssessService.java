package com.tiedao.service.inter;

import java.util.List;

import com.tiedao.pojo.ProductAssess;
import com.tiedao.pojo.User;

public interface ProductAssessService {

	public boolean saveProductAssessAssess(ProductAssess productAssess);
	public boolean updateProductAssess(ProductAssess productAssess);
	public boolean deleteProductAssess(ProductAssess productAssess);
	public ProductAssess findById(ProductAssess productAssess);
	public List<ProductAssess> findAll();
}
