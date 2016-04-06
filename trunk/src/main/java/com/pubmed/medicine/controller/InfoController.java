package com.pubmed.medicine.controller;

import com.pubmed.common.Constants;
import com.pubmed.common.JsonResult;
import com.pubmed.common.Paginate;
import com.pubmed.common.base.BaseController;
import com.pubmed.common.model.NotFoundException;
import com.pubmed.medicine.Helper.InfoHelper;
import com.pubmed.medicine.model.Category;
import com.pubmed.medicine.model.Info;
import com.pubmed.medicine.model.User;
import com.pubmed.medicine.service.AuthService;
import com.pubmed.medicine.service.CategoryService;
import com.pubmed.medicine.service.InfoService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: kuang
 * Date: 12-11-2
 * Time: 下午4:02
 */
@Controller
@RequestMapping(value = "/info")
public class InfoController extends BaseController {

    @Autowired
    private InfoService infoService;
    @Autowired
    private AuthService authService;
    @Autowired
    private CategoryService categoryService;
    private Logger logger =  Logger.getLogger(this.getClass());

    @ModelAttribute("categories")
    public List<Category> categories() {
        return categoryService.queryForList();
    }

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

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String show(@PathVariable int id, HttpServletRequest request, Model model) throws NotFoundException {
        Info info = infoService.findById(id);
        if(info == null) {
            throw new NotFoundException("该文章不存在.");            
        } else {
            model.addAttribute(info);
            /*to add
            model.addAttribute("comments", commentService.queryForList(article.getId()));
            model.addAttribute("comment", new Comment()); */
            return "/article/show";
        }
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Model model) {
        Info info = new Info();
        model.addAttribute(info);
        return "/info/form";
    }

    //参数次序不能调整，否则会报找不到方法
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String create(@ModelAttribute Info info, BindingResult result, HttpServletRequest request, Model model) {
    	InfoHelper.validate(result);
        if(result.hasErrors()) {
            return "/info/form";
        } else {
            User user = (User) request.getSession().getAttribute(Constants.SESSION_USER);
            info.setUserId(user.getId());
            if(infoService.insert(info)) {
                return "redirect:/info";
            } else {
                return "/info/form";
            }
        }
    }
    @RequestMapping(value = "/search/{data}", consumes = "application/json", method = RequestMethod.GET)
    public String update(@PathVariable String data,@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, HttpServletRequest request, Model model){     
        if(data!=null) {
        	 Paginate paginate = infoService.queryForKeyword(pageNo,data);
             model.addAttribute("paginate", paginate);
             return "/info/list";
        }
        return "/info";
    }
    /**
     * 以Json格式的提交
     * 如果格式符合javabean命名规则，则可以直接转换成bean对象
     *
     * 如果是get提交，注解为：produces="application/json"
     * @param info
     * @param result
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "/add/json", consumes="application/json",  method = RequestMethod.POST)
    public String createByJson(@RequestBody Info info, BindingResult result, HttpServletRequest request, Model model) {
        InfoHelper.validate(result);
        if(result.hasErrors()) {
            return "/article/form";
        } else {
            User user = (User) request.getSession().getAttribute(Constants.SESSION_USER);
            info.setUserId(user.getId());
            if(infoService.insert(info)) {
                return "redirect:/info";
            } else {
                return "/info/form";
            }
        }
    }

    @RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
    public String edit(@PathVariable int id, HttpServletRequest request, Model model) throws NotFoundException {
        Info info = infoService.findById(id);
        if(info == null) {
            throw new NotFoundException("该文章不存在.");
        }

        User user = (User)request.getSession().getAttribute(Constants.SESSION_USER);
        if(user.getId() != info.getUserId()) {
            throw new NotFoundException("没有权限.");
        }

        model.addAttribute(info);
        return "/info/form";
    }

    @RequestMapping(value = "/{id}/edit", method = RequestMethod.POST)
    public String update(@ModelAttribute Info info, BindingResult result, HttpServletRequest request, Model model) {
        InfoHelper.validate(result);
        Info oldInfo = infoService.findById(info.getId());
        if(oldInfo == null) {
            return "error";
        }
        if(result.hasErrors()) {
            return "/info/form";
        }
        infoService.update(info);
        return "redirect:/info/{id}";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public @ResponseBody
    JsonResult delete(@PathVariable int id, HttpServletRequest request, Model model) throws Exception {
        User user = (User) request.getSession().getAttribute(Constants.SESSION_USER);
        if(user == null) {
            throw new IllegalArgumentException("请先登录.");
        }
        Info info = infoService.findById(id);
        if(info == null) {
            throw new NotFoundException("该文章不存在.");
        } else if (info.getUserId() != user.getId()) {
            throw new IllegalArgumentException("只能删除自己的.");
        } else {
            infoService.delete(id);
            return ok();
        }
    }

    @RequestMapping(value = "/{id}/getJson", method = RequestMethod.GET)
    public @ResponseBody JsonResult getJson(@PathVariable int id) throws NotFoundException {
        Info info = infoService.findById(id);
        if(info == null) {
            throw new NotFoundException("信息不存在.");
        } else {
            return ok();
        }
    }
}
