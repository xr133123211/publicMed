package com.pubmed.medicine.controller;

import com.google.code.yanf4j.core.Session;
import com.pubmed.common.Constants;
import com.pubmed.common.Paginate;
import com.pubmed.common.base.BaseController;
import com.pubmed.medicine.Helper.UserHelper;
import com.pubmed.medicine.model.Auth;
import com.pubmed.medicine.model.Category;
import com.pubmed.medicine.model.User;
import com.pubmed.medicine.service.AccessService;
import com.pubmed.medicine.service.AuthService;
import com.pubmed.medicine.service.CategoryService;
import com.pubmed.medicine.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/user")
public class UserController extends BaseController {

	private Logger logger =  Logger.getLogger(this.getClass());
	@Autowired
	private UserService userService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private AuthService authService;
	@Autowired
	private AccessService accessService;

	@ModelAttribute("weights")
	public List<Integer> weights() {
		List<Integer> l = new ArrayList<Integer>();
		for(int i=0;i<10;i++){
			l.add(i);
		}
		return l;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String show(Model model) {
		model.addAttribute(new User());
		return "user/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String submitLogin(@ModelAttribute User user, BindingResult result,
						 HttpServletRequest request,
						 HttpServletResponse response,
						 HttpSession session) {
		logger.info("User Login "+user.getName());
		User sessionUser = userService.getUser(user.getName());
		UserHelper.checkLogin(user,sessionUser,result);
		if(result.hasErrors()) {
			return "user/login";
		}
		logger.info("SessionUser Is "+sessionUser.getName());
		session.setAttribute(Constants.SESSION_USER, sessionUser);
		if(sessionUser.getType()==0)
		return "redirect:/user/personal/"+sessionUser.getId();
		else return "redirect:/user/org/"+sessionUser.getId();
	}

	@ModelAttribute("categories")
	public List<Category> categories() {
		return categoryService.GetAllList();
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String showRegister(Model model) {
		User user = new User();
		model.addAttribute(user);
		return "/user/register";
	}

	@RequestMapping(value = "/temp", method = RequestMethod.GET)
	public String showTemp(Model model) {
		User user = new User();
		model.addAttribute(user);
		return "/user/temp";
	}

	@RequestMapping(value = "/auth/{orgId}", method = RequestMethod.GET)
	public String addAuth(@PathVariable long orgId, @RequestParam(value = "typeId")int typeId ,Model model, HttpSession session) {
		User sessionUser = ((User)session.getAttribute(Constants.SESSION_USER));
		User orgUser = userService.getUser(orgId);
		Auth newAuth = authService.getAuth(sessionUser,orgUser,typeId);
		if(newAuth==null){
			authService.addAuth(sessionUser,orgUser,0);
			newAuth = authService.getAuth(sessionUser,orgUser,typeId);
		}
		newAuth.setOrgName(orgUser.getName());
		newAuth.setCategoryName(categoryService.GetAllList().get(typeId).getName());
		model.addAttribute(newAuth);
		return "/user/auth";
	}

	@RequestMapping(value = "/auth/{orgId}", method = RequestMethod.POST)
	public String updateAuth(@ModelAttribute Auth auth,Model model, HttpSession session) {
		User sessionUser = ((User)session.getAttribute(Constants.SESSION_USER));
		auth.setStatus(1);
		authService.updateAuth(auth);
		return "redirect:/user/personal/"+sessionUser.getId();
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String submitRegister(@ModelAttribute User user, BindingResult result, HttpSession session) {
			User user_sql = userService.getUser(user.getName());
			UserHelper.vaildID(user, user_sql, result);
			if(result.hasErrors()) {
				return "/user/register";
			}
			else {
				userService.insert(user);
				return "redirect:/info";
			}
		}

	@RequestMapping(value = "/temp", method = RequestMethod.POST)
	public String submitTemp(@ModelAttribute User user, BindingResult result, HttpSession session) {
		User user_sql = userService.getUser(user.getName());
		UserHelper.vaildID(user, user_sql, result);
		if(result.hasErrors()) {
			return "/user/temp";
		}
		else {
			userService.insert(user);
			session.setAttribute(Constants.SESSION_USER, user);
			return "redirect:/info";
		}
	}


	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, Model model) {
		request.getSession().setAttribute(Constants.SESSION_USER, null);
		return "redirect:/info";
	}


	@RequestMapping(value = "/personal/{userId}", method = RequestMethod.GET)
	public String viewPersonal(@PathVariable long userId,Model model) {
		Paginate paginate = new Paginate(0,10);
		paginate.setPageList(accessService.getAccessList(userId));
		model.addAttribute("paginate", paginate);
		return "user/personal";
	}

	@RequestMapping(value = "/org/{userId}", method = RequestMethod.GET)
	public String viewOrg(@PathVariable long userId,Model model) {
		Paginate paginate = new Paginate(0,10);
		paginate.setPageList(authService.getByOrg(userId));
		model.addAttribute("paginate", paginate);
		return "user/org";
	}

}
