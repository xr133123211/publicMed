package com.pubmed.common;

public class Constants {

	public static final String SESSION_USER = "session_user";
	public static final String TEMP_ACCESS = "temp_access";
	public static final long JSVERSION = System.currentTimeMillis();
    
	//development | test | production
	public static final String PRODUCTION = "production";
	public static final String TEST = "test";
	public static final String DEVELOPMENT = "development";
	
	public static final String STATUS_OK = "ok";
	public static final String STATUS_FAIL = "fail";
	
	/**
	 * 控制不能使用整个考勤系统
	 */
	public static final String ViewKaoqin ="kaoqin_viewKaoqin";
}
