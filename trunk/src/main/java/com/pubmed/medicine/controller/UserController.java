package com.pubmed.medicine.controller;

import com.pubmed.common.Constants;
import com.pubmed.common.base.BaseController;
import com.pubmed.medicine.Helper.UserHelper;
import com.pubmed.medicine.model.User;
import com.pubmed.medicine.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/user")
public class UserController extends BaseController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String show(Model model) {
		model.addAttribute(new User());
		return "user/login";
	}


	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String submit(@ModelAttribute User user, BindingResult result,
						 HttpServletRequest request,
						 HttpServletResponse response,
						 HttpSession session) {
		User sessionUser = userService.getUser(user.getName());
		UserHelper.checkLogin(user,sessionUser,result);
		if(result.hasErrors()) {
			return "user/login";
		}

		session.setAttribute(Constants.SESSION_USER, sessionUser);
		return "redirect:/index";
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
				return "redirect:/index";
			}
		}


	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, Model model) {
		request.getSession().setAttribute(Constants.SESSION_USER, null);
		return "redirect:/index";
	}

}
