package com.pubmed.medicine.dao;


import com.pubmed.medicine.model.Category;

import java.util.List;

public interface CategoryDao {

	public void insert(Category cate);
	public void update(Category cate);

	public List<Category> getCategories();
}
