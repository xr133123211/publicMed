package com.pubmed.common;

import java.util.HashMap;

import com.alibaba.fastjson.JSON;
import com.pubmed.common.util.StringUtil;

/**
 * 返回json的标准格式
 * {status:'ok', mssage:'test', data:{}}
 *
 * User: guofei
 * Date: 12-8-25
 * Time: 下午3:15
 */
public class JsonResult extends HashMap<String,Object>{
    
	private static final long serialVersionUID = -1702618129121801017L;

	public static enum STATUS {OK, FAIL};
    public JsonResult() {}

    public JsonResult(STATUS status) {
        this(status, "");
    }

    public JsonResult(STATUS status, String message) {
          this.put("status",status.name().toLowerCase()).put("message",message);
    }

    public JsonResult put(String key, Object value) {
        super.put(key, value);
        return this;
    }

    public String toJson()  {
    	return JSON.toJSONString(this);
    }

    /**
     * 借跨域回调使用
     * @param callback
     * @return
     */
    public String toJson(String callback)  {
        if(StringUtil.isEmpty(callback))
            return toJson();

        return callback + "(" + toJson() + ")";
    }

    public JsonResult clone() {
        return (JsonResult) super.clone();
    }

    public String toString()  {
        return toJson();
    }
    
    
}
