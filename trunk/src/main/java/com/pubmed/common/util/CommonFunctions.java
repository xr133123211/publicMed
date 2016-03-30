package com.pubmed.common.util;

import java.util.UUID;

/**
 * 公用的一些方法
 * @author Fant
 * @date 2015年7月1日 下午2:16:51
 */
public class CommonFunctions {
	
	/**
	 * 生成uuid
	 * @return
	 */
	public static String getUuid(){
		UUID uuid = UUID.randomUUID();
		return uuid.toString();
	}
}
