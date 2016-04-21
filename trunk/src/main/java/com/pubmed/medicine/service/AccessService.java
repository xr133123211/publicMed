package com.pubmed.medicine.service;

import com.pubmed.medicine.dao.AccessDao;
import com.pubmed.medicine.dao.AuthDao;
import com.pubmed.medicine.model.Access;
import com.pubmed.medicine.model.Auth;
import com.pubmed.medicine.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class AccessService {
	@Autowired
	AccessDao accessDao;

	public List<Access> getAccessList(long userId){
		return accessDao.findAccessByUser(userId);
	}
}
