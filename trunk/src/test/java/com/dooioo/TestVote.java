package com.dooioo;

import com.pubmed.medicine.model.User;
import com.pubmed.medicine.model.Vote;
import com.pubmed.medicine.service.UserService;
import com.pubmed.medicine.service.VoteService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/3/30.
 */
public class TestVote extends  BaseTest {
    @Autowired
    VoteService voteService;
    @Autowired
    UserService userService;

    @Test
    public void vote(){
        User user = userService.getUser("master");
        List<User> users = new ArrayList<User>();
        users.add(user);
        User org = userService.getUser("expert");
        long accessId = 123L;
        voteService.addVotes(users,accessId);
        System.out.println(voteService.getAllByAccess(accessId).get(0).getAccessId());
        System.out.println(voteService.getAllByUser(user).get(0).getAccessId());
        System.out.println(voteService.getToVoteByUser(user).get(0).getAccessId());
        voteService.makeVote(voteService.getToVoteByUser(user).get(0),10);
        System.out.println("toVoteSize:"+voteService.getToVoteByUser(user).size());
    }

}
