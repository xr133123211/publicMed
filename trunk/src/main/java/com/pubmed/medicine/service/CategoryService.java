package com.pubmed.medicine.service;

import com.pubmed.medicine.dao.CategoryDao;
import com.pubmed.medicine.model.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class CategoryService {
	@Autowired
	CategoryDao categoryDao;
	public List<Category> GetAllList() {
		return categoryDao.getAllCategories();
	}
	public List<Category> queryForList() {
		return categoryDao.getCategories();
	}
}
