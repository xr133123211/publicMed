package com.dooioo;

import com.pubmed.medicine.model.Employee;
import com.pubmed.medicine.service.UserService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by Administrator on 2016/3/30.
 */
public class TestDao extends  BaseTest {
    @Autowired
    UserService userService;


    @Test
    public void testDao(){
        List<Employee> list = null;
        userService.update(list);
    }
}
