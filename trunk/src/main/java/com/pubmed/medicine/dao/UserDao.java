package com.pubmed.medicine.dao;


import org.apache.ibatis.annotations.Param;

import com.pubmed.medicine.model.User;

import java.util.List;

public interface UserDao {

	public void insert(User user);
	public void update(User user);
	public User getById(@Param("id") long id);
	public User getByName(@Param("name") String name);
	public User getByNameAndPassword(@Param("name")String name,@Param("password")String password);
	public List<User> searchName(@Param("name")String name);
}
