package com.pubmed.medicine.service;

import com.pubmed.medicine.dao.AccessDao;
import com.pubmed.medicine.dao.AuthDao;
import com.pubmed.medicine.dao.UserDao;
import com.pubmed.medicine.model.Access;
import com.pubmed.medicine.model.Auth;
import com.pubmed.medicine.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class AuthService {
	@Autowired
	AuthDao authDao;
	@Autowired
	AccessDao accessDao;

	public List<Auth> getByUser(User user){
		return authDao.getByUserId(user.getId());
	}
	public Auth getAuth(User user,User org,int typeId){
		return authDao.getAuth(user.getId(),org.getId(),typeId);
	}

	public List<Auth> getByOrg(long orgId){
		return authDao.getByOrgId(orgId);
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

	public boolean checkAuth(long userId, int typeId, long id) {
		if(userId==id) return true;
		else {
			Auth auth = authDao.getAuth(userId,id,typeId);
			if(auth!=null&&auth.getWeight()>0) {
				Access access = new Access();
				access.setUserId(userId);
				access.setOrgId(id);
				access.setTypeId(typeId);
				accessDao.addAccess(access);
				return true;
			}
		}
		return false;
	}
}
