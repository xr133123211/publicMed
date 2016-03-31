package com.pubmed.medicine.dao;


import com.pubmed.medicine.model.Vote;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface VoteDao {

	public void insert(Vote vote);
	public void update(Vote vote);
	public List<Vote> getAllByUserId(@Param("userId") long userId);
	public List<Vote> getNotVotedByUserId(@Param("userId") long userId);
	public List<Vote> getByAccessId(@Param("accessId") long accessId);

}
