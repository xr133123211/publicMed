package com.pubmed.medicine.service;

import com.pubmed.medicine.dao.AccessDao;
import com.pubmed.medicine.dao.AuthDao;
import com.pubmed.medicine.dao.UserDao;
import com.pubmed.medicine.dao.VoteDao;
import com.pubmed.medicine.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class AuthService {
	@Autowired
	AuthDao authDao;
	@Autowired
	AccessDao accessDao;
	@Autowired
	VoteDao voteDao;

	public List<Auth> getAuthByUser(User user){
		return authDao.getAuthByUserId(user.getId());
	}
	public List<Auth> getRequestByUser(User user){
		return authDao.getRequestByUser(user.getId());
	}
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

	public void addAuth(User user,User org,int weight,int type){
		Auth auth = new Auth();
		auth.setUser_id(user.getId());
		auth.setOrg_id(org.getId());
		auth.setType(type);
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
			if(auth!=null){
				if(auth.getWeight()>0) {
					Access access = new Access();
					access.setUserId(userId);
					access.setOrgId(id);
					access.setTypeId(typeId);
					accessDao.addAccess(access);
					return true;
				}
				else if(getTempAccess(auth.getId())==1) return true;
			}
		}
		return false;
	}

	public int getRequest(long userId, int typeId, long id) {
		Auth auth = authDao.getAuth(userId,id,typeId);
		if(auth==null||auth.getWeight()==-1) return 0;
		else if(auth.getStatus()==0)return 1;
		else return 2;
	}

	public Auth getById(long id) {
		return authDao.getByID(id);
	}

	public int getTempAccess(long access_id) {
		TempAccess temp = authDao.getTempAuth(access_id);
		if(temp==null) return -1;
		else return temp.getStatus();//-1未申请 0:申请中 1:申请通过 2:申请拒绝 3:申请过期
	}

	public void addTempAuth(Auth auth) {
		TempAccess tempAccess = authDao.getTempAuth(auth.getId());
		if(tempAccess==null){
			tempAccess = new TempAccess();
			tempAccess.setAccess_id(auth.getId());
			authDao.insertTempAuth(tempAccess);
		}else{
			tempAccess.setStatus(0);
			authDao.updateTempAuth(tempAccess);
		}
		List<User> users = voteDao.getRelatedUsers(auth.getType(),auth.getUser_id());
		Vote vote = new Vote();
		vote.setAccessId(auth.getId());
		for(User u : users){
			Vote newVote = voteDao.getVote(auth.getUser_id(),auth.getId());
			if(newVote!=null){
				newVote.setStatus(0);
				voteDao.update(newVote);
			}else{
				vote.setUserId(u.getId());
				voteDao.insert(vote);
			}

		}
	}

	public int getTempAccess(long userId, int typeId, long orgId) {
		Auth auth = authDao.getAuth(userId,orgId,typeId);
		long accessId = -1;
		if(auth!=null)accessId = auth.getId();
		return getTempAccess(accessId);
	}
}
