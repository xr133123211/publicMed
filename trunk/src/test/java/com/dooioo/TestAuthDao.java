package com.dooioo;

import com.pubmed.medicine.model.Auth;
import com.pubmed.medicine.model.User;
import com.pubmed.medicine.service.AuthService;
import com.pubmed.medicine.service.UserService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Administrator on 2016/3/30.
 */
public class TestAuthDao extends  BaseTest {
    @Autowired
    AuthService authService;
    @Autowired
    UserService userService;


    public void test(){
        User user = userService.getUser("master");
        User org = userService.getUser("expert");
        authService.addAuth(user,org,10);
        Auth auth = authService.getByUser(user).get(0);
        auth.setWeight(11);
        authService.updateAuth(auth);
        System.out.print(authService.getByOrg(org).get(0).getWeight());
    }



}
