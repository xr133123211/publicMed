package com.pubmed.medicine.service;

import com.pubmed.medicine.dao.AuthDao;
import com.pubmed.medicine.dao.UserDao;
import com.pubmed.medicine.dao.VoteDao;
import com.pubmed.medicine.model.Auth;
import com.pubmed.medicine.model.TempAccess;
import com.pubmed.medicine.model.User;
import com.pubmed.medicine.model.Vote;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class VoteService {

	@Autowired
	private VoteDao voteDao;
	@Autowired
	private AuthDao authDao;
	@Autowired
	private UserDao userDao;

	public List<Vote> getToVoteByUser(User user){
		return voteDao.getNotVotedByUserId(user.getId());
	}

	public List<Vote> getAllByAccess(long accessId){
		return voteDao.getByAccessId(accessId);
	}

	public List<User> getRelatedUsers(int type,long userId){
		return voteDao.getRelatedUsers(type,userId);
	}

	public void addVotes(List<User> users,long accessId){
		Vote v = new Vote();
		v.setAccessId(accessId);
		for(User user:users){
			v.setUserId(user.getId());
			voteDao.insert(v);
		}
	}

	public Vote getVote(long userId, long authId) {
		return voteDao.getVote(userId,authId);
	}

	public List getVotes(long userId) {
		return voteDao.getToVoteByUserId(userId);
	}

	public void updateVote(Vote vote) {
		voteDao.update(vote);
	}

	public Vote getVoteById(int id) {
		return  voteDao.getVoteById(id);
	}

	//投票算法计算代码
	public void checkVoteResult(Vote vote) {
		long accessId = vote.getAccessId();
		Auth auth = authDao.getByID(accessId);
		List<Vote> makedVotes = getAllByAccess(auth.getId());
		float sum=0;
		float max = 0;
		for(Vote vo:makedVotes){
			User user =  userDao.getById(vo.getUserId());
			Auth user_auth =  authDao.getAuth(auth.getUser_id(),user.getId(),auth.getType());
			sum+=vo.getVotePoint();
			if(vo.getStatus()==0) max+=vo.getVoteMax();
		}
		if(sum>auth.getShold()){
			if(auth.getStatus()!=1)auth.setStatus(2);
			TempAccess temp = authDao.getTempAuth(vote.getAccessId());
			temp.setStatus(1);
			authDao.update(auth);
			authDao.updateTempAuth(temp);
		}
		if(sum+max<auth.getShold()){//拒绝临时访问
			if(auth.getStatus()!=1)auth.setStatus(3);
			TempAccess temp = authDao.getTempAuth(vote.getAccessId());
			temp.setStatus(2);
			authDao.update(auth);
			authDao.updateTempAuth(temp);
		}

	}
}
