package com.pubmed.medicine.service;

import com.pubmed.common.Paginate;
import com.pubmed.medicine.dao.CategoryDao;
import com.pubmed.medicine.dao.InfoDao;
import com.pubmed.medicine.model.Category;
import com.pubmed.medicine.model.Info;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class InfoService {
	@Autowired
	InfoDao infoDao;

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
		return null;
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
