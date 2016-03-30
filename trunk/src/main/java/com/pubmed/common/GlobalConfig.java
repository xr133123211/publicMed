package com.pubmed.common;

import com.pubmed.common.util.IPUtil;

import java.util.Iterator;
import java.util.Properties;
import java.util.Set;

public class GlobalConfig {
    private static String env;
    private static String projectCode;
    private static Properties prop = new Properties();

    private GlobalConfig() {
    }

    private static String initEnv() {
        String productionIp = prop.getProperty("production_ip", "");
        String integrationIp = prop.getProperty("integration_ip", "");
        String developmentIp = prop.getProperty("development_ip", "");
        String testIp = prop.getProperty("test_ip", "");
        String previewIp = prop.getProperty("preview_ip", "");
        String tenv = null;
        Set localIps = IPUtil.getLocalIpSet();
        if(containsIp(productionIp, localIps)) {
            tenv = "production";
        } else if(containsIp(integrationIp, localIps)) {
            tenv = "integration";
        } else if(containsIp(testIp, localIps)) {
            tenv = "test";
        } else if(containsIp(developmentIp, localIps)) {
            tenv = "development";
        } else if(containsIp(previewIp, localIps)) {
            tenv = "preview";
        } else {
            tenv = prop.getProperty("env", "");
            if(tenv.isEmpty() || !tenv.equals("development") && !tenv.equals("production") && !tenv.equals("preview") && !tenv.equals("test") && !tenv.equals("integration")) {
                tenv = "development";
            }
        }

        return tenv;
    }

    private static boolean containsIp(String ipSet, Set<String> localIps) {
        if(ipSet != null && !ipSet.isEmpty()) {
            String[] ips = ipSet.split("\\|\\|");
            String[] var3 = ips;
            int var4 = ips.length;

            for(int var5 = 0; var5 < var4; ++var5) {
                String ip = var3[var5];
                Iterator var7 = localIps.iterator();

                while(var7.hasNext()) {
                    String local = (String)var7.next();
                    if(local.startsWith(ip)) {
                        return true;
                    }
                }
            }

            return false;
        } else {
            return false;
        }
    }

    private static String initProjectCode() {
        String projectCode = prop.getProperty("projectCode", "");
        if(projectCode.isEmpty()) {
            projectCode = prop.getProperty("appCode");
        }

        return projectCode;
    }

    public static String getEnv() {
        return env;
    }

    public static String getProjectCode() {
        return projectCode;
    }

    public static String getValue(String key) {
        return prop.getProperty(key);
    }

    static {
        try {
            prop.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("global.properties"));
            env = initEnv();
            projectCode = initProjectCode();
        } catch (Exception var1) {
            var1.printStackTrace();
        }

    }
}
