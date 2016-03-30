package com.pubmed.medicine.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pubmed.medicine.model.Employee;

public interface EmployeeDao {

	public void update(@Param("list")List<Employee> list);
}
