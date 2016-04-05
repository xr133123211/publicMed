package com.pubmed.medicine.controller;

import com.pubmed.common.Constants;
import com.pubmed.common.Paginate;
import com.pubmed.common.base.BaseController;
import com.pubmed.medicine.model.Category;
import com.pubmed.medicine.model.User;
import com.pubmed.medicine.service.CategoryService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/index")
public class IndexController extends BaseController {

	private Logger logger =  Logger.getLogger(this.getClass());
	@Autowired
	CategoryService categoryService;


	@RequestMapping(method = RequestMethod.GET)
	public String list( @RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
						@RequestParam(value = "sortKey", defaultValue = "id") String sortKey,
						HttpServletRequest request,HttpSession session,
						Model model) {
		Paginate paginate = new Paginate(0,10);
		model.addAttribute("paginate", paginate);
		User user = (User) request.getSession().getAttribute(Constants.SESSION_USER);
		if(user==null) logger.info("SendBackUser is null");
		else logger.info("SendBackUser:"+user.getName());
		return "/info/list";
	}

	@ModelAttribute("categories")
	public List<Category> categories() {
		return categoryService.queryForList();
	}

}
