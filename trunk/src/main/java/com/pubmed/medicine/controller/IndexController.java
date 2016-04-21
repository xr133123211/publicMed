package com.pubmed.medicine.controller;

import com.pubmed.common.Constants;
import com.pubmed.common.Paginate;
import com.pubmed.common.base.BaseController;
import com.pubmed.medicine.model.Category;
import com.pubmed.medicine.model.User;
import com.pubmed.medicine.service.CategoryService;
import com.pubmed.medicine.service.InfoService;
import com.pubmed.medicine.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/")
public class IndexController extends BaseController {

	private Logger logger =  Logger.getLogger(this.getClass());
	@Autowired
	CategoryService categoryService;
	@Autowired
	InfoService infoService;


	@RequestMapping(method = RequestMethod.GET)
	public String list( @RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
						@RequestParam(value = "sortKey", defaultValue = "id") String sortKey,
						HttpServletRequest request,HttpSession session,
						Model model) {
		return "redirect:/info";
	}

	@RequestMapping(value = "/search/{data}", method = RequestMethod.GET)
	public String search(@PathVariable String data,@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,HttpServletRequest request, Model model, HttpSession session) {
		Paginate paginate = infoService.queryForKeyword(pageNo,data);
		model.addAttribute("paginate", paginate);
		return "/user/search";
	}


}
