package com.pubmed.medicine.controller;

import com.pubmed.common.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/")
public class IndexController extends BaseController {

	@RequestMapping(method = RequestMethod.GET)
	public String getIndex(HttpServletRequest request){
		return "/index";
	}

}
