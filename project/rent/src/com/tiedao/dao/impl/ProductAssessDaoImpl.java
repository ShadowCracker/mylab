package com.tiedao.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.tiedao.dao.inter.ProductAssessDao;
import com.tiedao.pojo.ProductAssess;

public class ProductAssessDaoImpl implements ProductAssessDao {

private HibernateTemplate hibernateTemplate;
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
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
