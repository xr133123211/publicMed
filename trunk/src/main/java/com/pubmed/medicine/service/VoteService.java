package com.pubmed.medicine.service;

import com.pubmed.medicine.dao.VoteDao;
import com.pubmed.medicine.model.User;
import com.pubmed.medicine.model.Vote;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class VoteService {
	@Autowired
	VoteDao voteDao;

	public List<Vote> getAllByUser(User user){
		return voteDao.getAllByUserId(user.getId());
	}

	public List<Vote> getToVoteByUser(User user){
		return voteDao.getNotVotedByUserId(user.getId());
	}

	public List<Vote> getAllByAccess(long accessId){
		return voteDao.getByAccessId(accessId);
	}


	public void addVotes(List<User> users,long accessId){
		Vote v = new Vote();
		v.setAccessId(accessId);
		for(User user:users){
			v.setUserId(user.getId());
			voteDao.insert(v);
		}
	}

	public void makeVote(Vote v,int point){
		v.setStatus(1);
		v.setVotePoint(point);
		voteDao.update(v);
	}

}
