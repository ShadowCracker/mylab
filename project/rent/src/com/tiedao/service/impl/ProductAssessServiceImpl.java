package com.tiedao.service.impl;

import java.util.List;

import com.tiedao.dao.inter.ProductAssessDao;
import com.tiedao.pojo.ProductAssess;
import com.tiedao.service.inter.ProductAssessService;

public class ProductAssessServiceImpl implements ProductAssessService {

	private ProductAssessDao productAssessDao;
	
	public ProductAssessDao getProductAssessDao() {
		return productAssessDao;
	}

	public void setProductAssessDao(ProductAssessDao productAssessDao) {
		this.productAssessDao = productAssessDao;
	}

	@Override
	public boolean saveProductAssessAssess(ProductAssess productAssess) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateProductAssess(ProductAssess productAssess) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteProductAssess(ProductAssess productAssess) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ProductAssess findById(ProductAssess productAssess) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductAssess> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
