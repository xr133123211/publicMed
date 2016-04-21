package com.pubmed.medicine.service;

import com.pubmed.common.Paginate;
import com.pubmed.medicine.dao.UserDao;
import com.pubmed.medicine.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class UserService {
	@Autowired
	UserDao userDao;

	public User getUser(long id){
		return userDao.getById(id);
	}
	public User getUser(String name){
		return userDao.getByName(name);
	}
	public User getUser(String name,String password){
		return userDao.getByNameAndPassword(name,password);
	}
	public void update(User user ){
		userDao.update(user);
	}
	public void insert(User user ){
		userDao.insert(user);
	}
	public void insertUser(User user){
		user.setType(0);
		insert(user);
	}
	public void insertOrg(User org){
		org.setType(1);
		insert(org);
	}

}
