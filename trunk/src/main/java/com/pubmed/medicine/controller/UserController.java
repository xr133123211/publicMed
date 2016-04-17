package com.pubmed.medicine.controller;

import com.pubmed.common.Constants;
import com.pubmed.common.Paginate;
import com.pubmed.common.base.BaseController;
import com.pubmed.medicine.Helper.UserHelper;
import com.pubmed.medicine.model.Category;
import com.pubmed.medicine.model.User;
import com.pubmed.medicine.service.CategoryService;
import com.pubmed.medicine.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/user")
public class UserController extends BaseController {

	private Logger logger =  Logger.getLogger(this.getClass());
	@Autowired
	private UserService userService;
	@Autowired
	private CategoryService categoryService;

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
		return "redirect:/info";
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


	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, Model model) {
		request.getSession().setAttribute(Constants.SESSION_USER, null);
		return "redirect:/info";
	}


	@RequestMapping(value = "/personal/{userId}", method = RequestMethod.GET)
	public String viewPersonal(@PathVariable long userId,Model model) {
		Paginate paginate = new Paginate(0,10);
		model.addAttribute("paginate", paginate);
		return "user/personal";
	}

}
