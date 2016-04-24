package com.pubmed.medicine.controller;

import com.pubmed.common.Constants;
import com.pubmed.common.JsonResult;
import com.pubmed.common.Paginate;
import com.pubmed.common.base.BaseController;
import com.pubmed.common.model.NotFoundException;
import com.pubmed.medicine.Helper.InfoHelper;
import com.pubmed.medicine.model.*;
import com.pubmed.medicine.service.*;
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
    private UserService userService;
    @Autowired
    private InfoService infoService;
    @Autowired
    private AuthService authService;
    @Autowired
    private VoteService voteService;
    @Autowired
    private CategoryService categoryService;
    private Logger logger =  Logger.getLogger(this.getClass());

    @ModelAttribute("categories")
    public List<Category> categories() {
        return categoryService.queryForList();
    }

    @RequestMapping(value = "/*",method = RequestMethod.GET)
    public String get404(){
        return "/common/notPermitted";
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
        session.setAttribute(Constants.LOOK_USER,user);
        return "/info/list";
    }
    @RequestMapping(value = "/detail/{userId}", method = RequestMethod.GET)
    public String show(@PathVariable long userId,@RequestParam(value = "typeId", defaultValue = "0") int typeId, HttpServletRequest request, Model model) throws NotFoundException {
        User user = (User) request.getSession().getAttribute(Constants.SESSION_USER);
        Info info = infoService.findByUser(userId,typeId);
        if(info == null) {
            info = new Info();
            info.setCategoryId(typeId);
            info.setUserId(userId);
            info.setTitle("");
            infoService.insert(info);
            info = infoService.findByUser(userId,typeId);
        }

        info.setAccessAuth(authService.checkAuth(userId,typeId,user.getId()));
        info.setRequest(authService.getRequest(userId,typeId,user.getId()));
        info.setTempAccess(authService.getTempAccess(userId,typeId,user.getId()));
        logger.info("auth tempAccess:"+info.getTempAccess());
        model.addAttribute(info);
        request.getSession().setAttribute(Constants.LOOK_USER,userService.getUser(userId));
        return "/info/show";
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
        model.addAttribute(info);
        return "/info/form";
    }

    @RequestMapping(value = "/{id}/edit", method = RequestMethod.POST)
    public String update(@ModelAttribute Info info, BindingResult result, HttpServletRequest request, Model model) {
        InfoHelper.validate(result);
        if(result.hasErrors()) {
            return "/info/form";
        }
        infoService.update(info);
        info = infoService.findById(info.getId());
        logger.info("Update Info Conetent:"+info.getContent());
        return "redirect:/info/detail/"+info.getUserId()+"?typeId="+info.getTypeId();
    }

    @RequestMapping(value = "/{infoId}/request")
    public String request( @PathVariable long infoId ,HttpSession session, Model model) {
        User org = (User) session.getAttribute(Constants.SESSION_USER);
        Info info = infoService.findById(infoId);
        User user = userService.getUser(info.getUserId());
        authService.addAuth(user,org,0,info.getTypeId());
        return "redirect:/info/detail/"+info.getUserId()+"?typeId="+info.getTypeId();
    }

    @RequestMapping(value = "/{infoId}/tempApply")
    public String applyTemp( @PathVariable long infoId ,HttpSession session, Model model) {
        User org = (User) session.getAttribute(Constants.SESSION_USER);
        Info info = infoService.findById(infoId);
        User user = userService.getUser(info.getUserId());
        Auth auth = authService.getAuth(user,org,info.getTypeId());
        if(auth==null) authService.addAuth(user,org,-1,info.getTypeId());
        auth = authService.getAuth(user,org,info.getTypeId());
        authService.addTempAuth(auth);
        return "redirect:/info/detail/"+info.getUserId()+"?typeId="+info.getTypeId();
    }





}
