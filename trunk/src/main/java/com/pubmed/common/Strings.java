package com.pubmed.common;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.lang3.StringUtils;

public class Strings extends StringUtils {
    private static final String SPLIT_REG = "-";

    public Strings() {
    }

    public static boolean isEmpty(String str) {
        return StringUtils.isEmpty(str) || str.trim().toLowerCase().equals("null");
    }

    public static boolean isNotEmpty(String str) {
        return StringUtils.isNotEmpty(str) && !str.trim().toLowerCase().equals("null");
    }

    public static boolean isEmpty(Object obj) {
        return obj == null?true:StringUtils.isEmpty(obj.toString()) || obj.toString().trim().toLowerCase().equals("null");
    }

    public static boolean isNotEmpty(Object obj) {
        return obj == null?false:StringUtils.isNotEmpty(obj.toString()) && !obj.toString().trim().toLowerCase().equals("null");
    }

    public static String defaultEmptyStr(String str) {
        return isEmpty(str)?"":str.trim();
    }

    public static String defaultStr(String str, String defaultStr) {
        return isEmpty(str)?defaultStr:str.trim();
    }

    public static String defaultEmptyStr(Object obj) {
        return obj == null?"":defaultStr(obj.toString(), "");
    }

    public static String defaultStr(Object obj, String defaultStr) {
        return obj == null?defaultStr:defaultStr(obj.toString(), defaultStr);
    }

    public static String clear(Object str) {
        return isEmpty(str.toString())?"":str.toString().trim().replaceAll("[\n\t\r ]", "");
    }

    public static String encodeUTF(String str) {
        try {
            return URLEncoder.encode(str, "utf-8");
        } catch (UnsupportedEncodingException var2) {
            return str;
        }
    }

    public static int defaultInteger(String str, Integer defaultInt) {
        if(isEmpty(str) && defaultInt == null) {
            defaultInt = Integer.valueOf(0);
        }

        String ret = isEmpty(str)?defaultInt + "":str;

        try {
            int iRet = Integer.parseInt(ret);
            return iRet;
        } catch (Exception var5) {
            return defaultInt.intValue();
        }
    }

    public static double defaultDouble(String str, double defaultDouble) {
        double iRet = 0.0D;
        if(isEmpty(str)) {
            (new StringBuilder()).append(defaultDouble).append("").toString();
        }

        try {
            iRet = Double.parseDouble(str);
            return iRet;
        } catch (Exception var7) {
            return defaultDouble;
        }
    }

    public static String lowerFirst(String source) {
        return isEmpty(source)?source:source.substring(0, 1).toLowerCase() + source.substring(1);
    }

    public static String formatSql(String sql) {
        return isEmpty(sql)?sql:sql.replaceAll("\'", "\'\'");
    }

    public static String[] decodeStr(String strSource, String token, int valueCount) {
        if(StringUtils.isEmpty(strSource)) {
            return null;
        } else {
            String[] values = strSource.split(token);
            return values.length != valueCount?null:values;
        }
    }

    public static String splice(List<String> strs, String separator) {
        if(strs != null && strs.size() != 0) {
            StringBuffer buffer = new StringBuffer();
            Iterator i$ = strs.iterator();

            while(i$.hasNext()) {
                String str = (String)i$.next();
                buffer.append(str).append(separator);
            }

            return buffer.toString();
        } else {
            return "";
        }
    }
}
