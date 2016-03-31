package com.pubmed.medicine.service;

import com.pubmed.medicine.dao.AuthDao;
import com.pubmed.medicine.dao.UserDao;
import com.pubmed.medicine.model.Auth;
import com.pubmed.medicine.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class AuthService {
	@Autowired
	AuthDao authDao;

	public List<Auth> getByUser(User user){
		return authDao.getByUserId(user.getId());
	}

	public List<Auth> getByOrg(User org){
		return authDao.getByOrgId(org.getId());
	}

	public List<User> getVoteOrgs(User user,int type){
		return authDao.getOrgs(user.getId(),type);
	}

	public void addAuth(User user,User org,int weight){
		Auth auth = new Auth();
		auth.setUser_id(user.getId());
		auth.setOrg_id(org.getId());
		auth.setType(org.getType());
		auth.setWeight(weight);
		authDao.insert(auth);
	}

	public void updateAuth(Auth auth){
		authDao.update(auth);
	}

}
