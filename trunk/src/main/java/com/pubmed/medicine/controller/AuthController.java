package com.pubmed.medicine.controller;

import com.pubmed.common.Constants;
import com.pubmed.common.Paginate;
import com.pubmed.common.base.BaseController;
import com.pubmed.medicine.model.Auth;
import com.pubmed.medicine.model.Info;
import com.pubmed.medicine.model.User;
import com.pubmed.medicine.model.Vote;
import com.pubmed.medicine.service.*;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/auth")
public class AuthController extends BaseController {

	private Logger logger =  Logger.getLogger(this.getClass());
	@Autowired
	AuthService authService;
	@Autowired
	UserService userService;
	@Autowired
	VoteService voteService;

	@RequestMapping(value = "/detail/{id}")
	public String applyTemp( @PathVariable long id ,HttpSession session, Model model) {
		Auth auth = authService.getById(id);
		List<User> relatedVoters =  voteService.getRelatedUsers(auth.getType(),auth.getUser_id());
		List<Vote> makedVotes = voteService.getAllByAccess(auth.getId());
		model.addAttribute("auth",auth);
		model.addAttribute("voters",relatedVoters);
		Paginate paginate = new Paginate(0,10);
		paginate.setPageList(makedVotes);
		model.addAttribute("paginate", paginate);
		//getWeightMethod:
		/*
		* Auth auth = authService.getAuth(userService.getUser(user_id,org_id,type_id));
		* */
		return "/vote/list";
	}


}
