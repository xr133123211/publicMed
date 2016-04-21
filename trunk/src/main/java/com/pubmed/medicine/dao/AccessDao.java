package com.pubmed.medicine.dao;


import com.pubmed.medicine.model.Access;
import com.pubmed.medicine.model.TempAccess;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AccessDao {

	public TempAccess findTempById(@Param("id") long id);

	public void addTemp(TempAccess access);
	public void updateTemp(TempAccess access);

	List<TempAccess> findTempByUser(@Param("userId") long userId, @Param("typeId") long typeId);

	public void addAccess(Access access);
	public List<Access> findAccessByUser(@Param("userId") long userId);
}
