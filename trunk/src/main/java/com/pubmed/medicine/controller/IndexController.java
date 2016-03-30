package com.pubmed.medicine.controller;

import com.pubmed.common.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/")
public class IndexController extends BaseController {

	@RequestMapping(value = "")
	public String getIndex(HttpServletRequest request){
		return "index";
	}

}
