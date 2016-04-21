package com.pubmed.medicine.service;

import com.pubmed.common.Paginate;
import com.pubmed.medicine.dao.CategoryDao;
import com.pubmed.medicine.dao.InfoDao;
import com.pubmed.medicine.dao.UserDao;
import com.pubmed.medicine.model.Category;
import com.pubmed.medicine.model.Info;
import com.pubmed.medicine.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
public class InfoService {
	@Autowired
	InfoDao infoDao;
	@Autowired
	UserDao userDao;
	@Autowired
	CategoryDao categoryDao;

	public Info findById(long id) {
		return infoDao.findById(id);
	}

	public boolean insert(Info info) {
		try {
			infoDao.add(info);
			return true;
		}catch (Exception e){
			return false;
		}
	}

	public Paginate queryForKeyword(int pageNo, String data) {
		List<User>users = userDao.searchName(data);
		List<Info> infos = new ArrayList<Info>();
		List<Category> cats =  categoryDao.getAllCategories();
		if(users!=null) {
			for(User user:users)
			for(Category ca:cats){
				if(!ca.getName().equals("用户"))
				{
					Info in = new Info();
					in.setCategoryId(ca.getId());
					in.setCategoryName(ca.getName());
					in.setUsername(user.getName());
					in.setUserId(user.getId());
					infos.add(in);
				}
			}
		}
		Paginate p = new Paginate(pageNo,10);
		p.setPageList(infos);
		return p;
	}

	public void update(Info info) {
		infoDao.update(info);
	}

	public void delete(int id) {
	}

	public Info findByUser(long userId,long typeId) {
		return infoDao.findByUser(userId,typeId);
	}
}
