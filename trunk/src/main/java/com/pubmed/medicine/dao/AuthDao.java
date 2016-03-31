package com.pubmed.medicine.dao;


import com.pubmed.medicine.model.Auth;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AuthDao {

	public void insert(Auth auth);
	public void update(Auth auth);
	public List<Auth> getByUserId(@Param("user_id")long userID);
	public List<Auth> getByOrgId(@Param("org_id") long orgId);

}
