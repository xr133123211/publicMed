package com.pubmed.common.base;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pubmed.common.JsonResult;

/**
 * Created with IntelliJ IDEA at 13-7-11 下午2:30.
 *
 * @author 焦义贵
 * @since 1.0
 *        To change this template use File | Settings | File Templates.
 */
@Controller
public class PingController extends BaseController{
    
    @ResponseBody
    @RequestMapping(value = {"/it/ping","/api/it/ping"})
    public JsonResult ping(){
        return ok();
    }
}
