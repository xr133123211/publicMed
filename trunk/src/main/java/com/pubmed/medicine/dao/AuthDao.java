package com.pubmed.medicine.dao;


import com.pubmed.medicine.model.Auth;
import com.pubmed.medicine.model.TempAccess;
import com.pubmed.medicine.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AuthDao {

	public void insert(Auth auth);
	public void update(Auth auth);
	public Auth getAuth(@Param("user_id")long userID,@Param("org_id") long orgId,@Param("type") int type);
	public List<Auth> getByUserId(@Param("user_id")long userID);
	public List<Auth> getByOrgId(@Param("org_id") long orgId);
	public List<User> getOrgs(@Param("user_id") long userId, @Param("type") int type);


	List<Auth> getAuthByUserId(@Param("user_id") long id);

	List<Auth> getRequestByUser(@Param("user_id") long id);

	Auth getByID(@Param("id")  long id);

	TempAccess getTempAuth(@Param("access_id") long access_id);
	void insertTempAuth(TempAccess temp);
	void updateTempAuth(TempAccess temp);
}
