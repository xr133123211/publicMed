package com.pubmed.common;

/**
 * Created by Administrator on 2016/3/25.
 */
public class Base62 {
    private static String data = "nW012F3456789abcdefghijklmopqrstuvwxyzABCDEGHIJKLMNOPQRSTUVXYZ";
    private static char[] digits = data.toCharArray();
    private static int digitSize = digits.length;
    public static long parseToLong(String key){
        long result = 0L;
        for (int i=0;i<key.length();i++){
            result=result*digitSize+getIndex(key.charAt(i));
        }
        return result;
    }
    public static String getKeyByLong(long data,int strLen){
        String result = "";
        for(int i=0;i<strLen;i++){
            result=digits[(int) (data%digitSize)] + result;
            data = data/digitSize;
        }
        return result;
    }

    public static String getKeyByLong(long data){
        return getKeyByLong(data,6);
    }

    private static int getIndex(char A){
        for(int i=0;i<digitSize;i++)
            if(A==digits[i]) return i;
        return -1;
    }

    public static void main(String args[]){
        System.out.println(getKeyByLong(1434));
        System.out.println(parseToLong("00"));
    }
}
