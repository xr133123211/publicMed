package com.pubmed.common.base;

import java.io.IOException;
import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.view.RedirectView;

import com.pubmed.common.JsonResult;
import com.pubmed.common.model.FunctionException;
import com.pubmed.common.model.IllegalOperationException;
import com.pubmed.common.model.NotFoundException;
import com.pubmed.common.model.NullException;
import com.pubmed.common.util.StringUtil;

/**
 * Controller 通用父类，提供一些公共方法
 * 例如：获取session
 * User: kuang
 * Date: 12-4-25
 * Time: 上午11:05
 */
public abstract class BaseController {
	protected Logger log = LoggerFactory.getLogger(getClass());
    
    protected final static String ERROR_PAGE = "/common/error";
    protected final static String EMPTY_STR = "";
    
    //各种工具方法
    public String redirect(String page) {
        return "redirect:" + page;
    }

    /**
     * 跳转页面，并且将model里面的值清除
     * @param page
     * @param modelMap
     * @return
     */
    public String redirect(String page, ModelMap modelMap) {
        modelMap.clear();
        return "redirect:" + page;
    }

    public String forward(String page) {
        return "forward:" + page;
    }

    public JsonResult ok() {
        return ok("");
    }

    public static JsonResult ok(String message) {
        return new JsonResult(JsonResult.STATUS.OK, message);
    }

    public static JsonResult ok(String message, String key, Object value) {
        return new JsonResult(JsonResult.STATUS.OK, message).put(key, value);
    }


    //fail
    public static JsonResult fail() {
        return fail("");
    }

    public static JsonResult fail(String message) {
        return new JsonResult(JsonResult.STATUS.FAIL, message);
    }

    public static JsonResult fail(Serializable value) {
        return fail(EMPTY_STR, value);
    }

    public static JsonResult fail(String key, Object value) {
        return fail(EMPTY_STR, key, value);
    }

    public static JsonResult fail(String message, String key, Object value) {
        return new JsonResult(JsonResult.STATUS.FAIL, message).put(key, value);
    }

    /**
     * 拦截NotFoundException
     * 跳转至指定的页面
     *
     * @param ex
     * @param request
     * @return
     * @throws java.io.IOException
     */
    @ExceptionHandler(NotFoundException.class)
    public RedirectView notFoundException(NotFoundException ex, HttpServletRequest request) throws IOException {
        log.error("NotFoundException => ", ex);
        RedirectView redirectView = new RedirectView(StringUtil.isEmpty(ex.getUrl()) ? "/404" : ex.getUrl());
        redirectView.addStaticAttribute("message", ex.getMessage());
        return redirectView;
    }

    /**
     * 拦截参数异常，返回jsonResult
     *
     * @param ex
     * @param request
     * @return
     */
    @ExceptionHandler(IllegalArgumentException.class)
    @ResponseBody
    public JsonResult illegalArgumentException(IllegalArgumentException ex, HttpServletRequest request) {
        log.error("IllegalArgumentException => ", ex);
        return fail(ex.getMessage());
    }

    /**
     * 拦截方法异常，返回jsonResult，http请求返回500
     *
     * @param ex
     * @param request
     * @return
     */
    @ExceptionHandler(FunctionException.class)
    @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
    @ResponseBody
    public JsonResult functionException(FunctionException ex, HttpServletRequest request) {
        log.error("FunctionException => ", ex);
        return fail(ex.getMessage());
    }

    /**
     * 拦截NullException，返回jsonResult，http请求返回500
     *
     * @param ex
     * @param request
     * @return
     */
    @ExceptionHandler(NullException.class)
    @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
    @ResponseBody
    public JsonResult nullException(NullException ex, HttpServletRequest request) {
        log.error("NullException => ", ex);
        return fail(ex.getMessage());
    }

    /**
     * 拦截非法操作异常，返回jsonResult，http请求返回500
     *
     * @param ex
     * @return
     */
    @ExceptionHandler(IllegalOperationException.class)
    @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
    @ResponseBody
    public JsonResult illegalOperationException(IllegalOperationException ex) {
        log.error("IllegalOperationException => ", ex);
        return fail(ex.getMessage());
    }

    /**
     * 拦截数据库操作异常，返回jsonResult，http请求返回500
     * @param ex
     * @return
     */
    @ExceptionHandler(DataAccessException.class)
    @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
    @ResponseBody
    public JsonResult dataAccessException(DataAccessException ex) {
        log.error("DataAccessException => ", ex);
        return fail(ex.getMessage());
    }

    @ExceptionHandler(RuntimeException.class)
    @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
    @ResponseBody
    public JsonResult runtimeException(RuntimeException ex) {
        log.error("RuntimeException => ", ex);
        return fail(ex.getMessage());
    }

    @ExceptionHandler(NullPointerException.class)
    @ResponseBody
    public JsonResult nullPointerException(NullPointerException ex) {
        log.error("NullPointerException => ", ex);
        return fail(ex.getMessage());
    }
    
}
