package com.pubmed.medicine.dao;


import com.pubmed.medicine.model.User;
import com.pubmed.medicine.model.Vote;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface VoteDao {

	public void insert(Vote vote);
	public void update(Vote vote);
	public List<Vote> getToVoteByUserId(@Param("userId") long userId);
	public List<Vote> getNotVotedByUserId(@Param("userId") long userId);
	public List<Vote> getByAccessId(@Param("accessId") long accessId);
	public Vote getVote(@Param("userId") long userId,@Param("accessId") long accessId);
	List<User> getRelatedUsers(@Param("typeId")int typeID,@Param("userId") long userId);

	Vote getVoteById(@Param("id")int id);
}
