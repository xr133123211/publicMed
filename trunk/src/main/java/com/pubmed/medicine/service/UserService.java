package com.pubmed.medicine.service;

import com.pubmed.medicine.dao.EmployeeDao;
import com.pubmed.medicine.model.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class UserService {
	@Autowired
	EmployeeDao employeeDao;
	public void update(List<Employee> l){
		employeeDao.update(l);
	}

}
