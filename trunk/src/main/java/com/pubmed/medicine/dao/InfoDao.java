package com.pubmed.medicine.dao;


import com.pubmed.medicine.model.Info;
import org.apache.ibatis.annotations.Param;

public interface InfoDao {

	public Info findById(@Param("id") long id);

	public void add(Info info);
	public void update(Info info);
}
