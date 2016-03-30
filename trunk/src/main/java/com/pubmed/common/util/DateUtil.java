package com.pubmed.common.util;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;

/**
 * Created by guofei on 16/2/23.
 */
public class DateUtil {

    public static final String DATE = "yyyy-MM-dd";
    public static final String DATETIME = "yyyy-MM-dd HH:mm:ss";
    public static final String DATETIMEFULL = "yyyy-MM-dd HH:mm:ss.SSS";

    public static DateTime parse(String date){
        String f = null;
        if(StringUtil.isEmpty(date)) {
            return null;
        }else if(date.length()<=10){
            f = DATE;
        }else if(date.length() <=19){
            f = DATETIME;
        }else{
            f = DATETIMEFULL;
        }
        return DateTime.parse(date, DateTimeFormat.forPattern(f));
    }
}
