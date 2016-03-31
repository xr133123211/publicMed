package com.dooioo;

import com.pubmed.medicine.model.User;
import com.pubmed.medicine.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Administrator on 2016/3/30.
 */
public class TestDao extends  BaseTest {
    @Autowired
    UserService userService;


    public void selectUser(){
        System.out.println(userService.getUser(1L).getName());
        System.out.println(userService.getUser("admin","admin").getId());
    }


    public void testAddorgDao(){
        User user = new User();
        user.setName("expert");
        user.setPassword("13814460302");
        userService.insertOrg(user);
    }

    public void testAddUserDao(){
        User user = new User();
        user.setName("master");
        user.setPassword("13814460302");
        userService.insertUser(user);
    }


}
