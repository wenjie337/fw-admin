package com.bxj.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by dukang on 2015/9/22.
 */
public class DateUtils {

    public static final Logger logger = LoggerFactory.getLogger(DateUtils.class);
    public static String LONG_DATE_FORMAT_WIHTOUT_SECOND = "yyyy-MM-dd HH:mm";
    public static String LONG_DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";

    private static final Map<String, String> map = new HashMap<>();
    static{
        map.put("1", "星期一");
        map.put("2", "星期二");
        map.put("3", "星期三");
        map.put("4", "星期四");
        map.put("5", "星期五");
        map.put("6", "星期六");
        map.put("7", "星期日");
    }

    public static String getWeekDesc(String week){
        return map.get(week);
    }

    /**
     * 把日期格式化为长日期，忽略秒
     * @param date String格式
     * @return 日期格式
     */
    public static Date toLongDateWithoutSecond(String date) {
        return stringFormat(DateUtils.LONG_DATE_FORMAT_WIHTOUT_SECOND, date);
    }

    /**
     * 把日期格式化为长日期，不忽略秒
     * @param date String格式
     * @return 日期格式
     */
    public static Date toLongDateWithSecond(String date) {
        return stringFormat(DateUtils.LONG_DATE_FORMAT, date);
    }

    /**
     * 把日期格式化为长日期，忽略秒
     * @param date 日期格式date
     * @return 字符格式字符
     */
    public static String toLongStringWithoutSecond(Date date) {
        return dateFormat(DateUtils.LONG_DATE_FORMAT_WIHTOUT_SECOND, date);
    }
    /**
     * 把日期格式化为长日期，不忽略秒
     * @param date 日期格式date
     * @return 字符格式字符
     */
    public static String toLongStringWithSecond(Date date) {
        return dateFormat(DateUtils.LONG_DATE_FORMAT, date);
    }

    /**
     * 将时间类型转换为字符串
     *
     * @param fm
     *            转换格式，例如：yyyy-MM-dd HH:mm
     * @param date
     *            转换时间
     * @return
     */
    public static String dateFormat(String fm, Date date) {
        String ds = "";
        try {
            SimpleDateFormat sdf = new SimpleDateFormat(fm);
            ds = sdf.format(date);
        } catch (Exception e) {
            logger.error("fm=" + fm + " date=" + date, e);
        }
        return ds;
    }

    /**
     * 将String类型数据转换为Date类型
     *
     * @param fm
     *            转换格式，例如：yyyy-MM-dd HH:mm
     * @param date
     *            时间字符串
     * @return
     */
    public static Date stringFormat(String fm, String date) {
        Date returnDate = null;
        try {
            SimpleDateFormat objFormatter = new SimpleDateFormat(fm);
            ParsePosition objPos = new ParsePosition(0);
            returnDate = new Date(objFormatter.parse(date, objPos).getTime());
        } catch (Exception e) {
            logger.error("fm=" + fm + " date=" + date, e);
        }
        return returnDate;
    }

    /**按照指定的格式，将String转成Date**/
    public static Date stringToDate(String dateString, String format) {
        if (format == null) {
            format = "yyyy-MM-dd";
        }
        Date date = null;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat(format);
            date = sdf.parse(dateString);
        } catch (Exception e) {
            date = null;
        }
        return date;
    }

    /**
     * 判断时间为星期几
     * 输出String
     * @param dateString
     * @return
     */
    public static String judgeWeekStringOut(String dateString){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(DateUtils.stringToDate(dateString, null));
        int dayForWeek = 0;
        if( calendar.get(Calendar.DAY_OF_WEEK) == 1 ){
            dayForWeek = 7;
        }else{
            dayForWeek = calendar.get(Calendar.DAY_OF_WEEK) - 1;
        }
        return getWeekDesc(String.valueOf(dayForWeek));
    }

    /**
     * 判断时间为星期几
     * 输出为int类型 输出键值
     * @param dateString
     * @return
     */
    public static int judgeWeekIntOut(String dateString){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(DateUtils.stringToDate(dateString, null));
        int dayForWeek = 0;
        if( calendar.get(Calendar.DAY_OF_WEEK) == 1 ){
            dayForWeek = 7;
        }else{
            dayForWeek = calendar.get(Calendar.DAY_OF_WEEK) - 1;
        }
        return dayForWeek;
    }

    /**
     * 从当前日期起,返回过去几天的一个日期列表字符串
     * @param days 过去几天
     * @param format 返回字符串的格式
     * @return
     */
    public static List<String> getLastDateStrList(int days,String format){
        if(format == null){
            format = LONG_DATE_FORMAT;
        }
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        List<String> retVal = new ArrayList<String>();
        Calendar c = Calendar.getInstance();
        retVal.add(sdf.format(c.getTime())+","+c.get(Calendar.YEAR));
        for(int i=0;i<days;i++){
            c.add(Calendar.DATE, -1);
            retVal.add(sdf.format(c.getTime())+","+c.get(Calendar.YEAR));
        }
        return retVal;
    }

    /**
     * 从当前日期起,返回过去几天的一个日期列表
     * 没有格式化
     * @param days  过去几天
     * @return
     */
    public static List<Date> getLastDateStrListNoFormat(int days) {
        List<Date> list = new ArrayList<>();
        Calendar c = Calendar.getInstance();
        c.set(Calendar.HOUR_OF_DAY, 0);
        c.set(Calendar.MINUTE, 0);
        c.set(Calendar.SECOND, 0);
        list.add(c.getTime());
        for (int i = 0; i < days; i++) {
            c.add(Calendar.DATE, -1);
            list.add(c.getTime());
        }
        return list;
    }

}
