package com.pubmed.common.util;

/**
 * 地图相关的工具类，摘自网络
 * 
 * @author Jail Hu
 *
 */
public class MapUtil {

	/**
	 * PI
	 */
	private final static double DEF_PI = 3.14159265359; 
	/**
	 *  PI/180.0
	 *  PI/360  0.00872664626
	 */
	private final static double DEF_PI180 = 0.01745329252;
	/**
	 * radius of earth
	 */
	private final static double DEF_R = 6370693.5; 

	/**
	 * 根据距离与经纬度计算四个方向的上下限
	 * @param lon 经度
	 * @param lat 纬度
	 * @param r 距离 单位米
	 * @return double[4] 南侧经度，北侧经度，西侧纬度，东侧纬度
	 */
	public static double[] getRange(double lon, double lat, int r) {
		double[] range = new double[4];
		// 角度转换为弧度
		double ns = lat * DEF_PI180;
		double sinNs = Math.sin(ns);
		double cosNs = Math.cos(ns);
		double cosTmp = Math.cos(r / DEF_R);
		// 经度的差值
		double lonDif = Math.acos((cosTmp - sinNs * sinNs) / (cosNs * cosNs))
				/ DEF_PI180;
		// 保存经度
		range[0] = lon - lonDif;
		range[1] = lon + lonDif;
		double m = 0 - 2 * cosTmp * sinNs;
		double n = cosTmp * cosTmp - cosNs * cosNs;
		double o1 = (0 - m - Math.sqrt(m * m - 4 * (n))) / 2;
		double o2 = (0 - m + Math.sqrt(m * m - 4 * (n))) / 2;
		// 纬度
		double lat1 = 180 / DEF_PI * Math.asin(o1);
		double lat2 = 180 / DEF_PI * Math.asin(o2);
		// 保存
		range[2] = lat1;
		range[3] = lat2;
		return range;
	}

	/**
	 * 计算两个点之间的距离
	 * @param lon1
	 * @param lat1
	 * @param lon2
	 * @param lat2
	 * @return
	 */
	public static double getDistance(double lon1, double lat1, double lon2,double lat2) {
		double x, y, distance;
		x = (lon2 - lon1) * DEF_PI180 * DEF_R
				* Math.cos((lat1 + lat2)*0.00872664626);
		y = (lat2 - lat1) * DEF_PI180 * DEF_R;
		distance = Math.hypot(x, y);
		return distance;
	}


	public static void main(String[] args) {
		System.out.println(3.14159265359/360);
	}
}
