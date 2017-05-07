package com.bxj.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class TextUtil
{

    public TextUtil()
    {
    }

    public static boolean isValid(String strInput)
    {
        return strInput != null && strInput.trim().length() > 0;
    }

    public static String clipHeader(String strAddress, String strHeader)
    {
        String strReturn = strAddress;
        if(strReturn != null && strReturn.length() > strHeader.length() && strReturn.startsWith(strHeader))
            strReturn = strReturn.substring(strHeader.length());
        return strReturn;
    }

    public static String clipTail(String strAddress, String strTail)
    {
        String strReturn = strAddress;
        if(strReturn != null && strReturn.length() > strTail.length() && strReturn.endsWith(strTail))
            strReturn = strReturn.substring(0, strReturn.length() - 1);
        return strReturn;
    }

    public static boolean isValidNumber(String keyword)
    {
        String str = keyword;
        boolean result = false;
        if(str != null)
        {
            String regEx = "^\\d+$";
            Pattern p = Pattern.compile(regEx);
            Matcher m = p.matcher(str);
            result = m.find();
        }
        return result;
    }

    public static boolean isIncludeNumber(String keyword)
    {
        String str = keyword;
        boolean result = false;
        if(str != null)
        {
            String regEx = "\\d";
            Pattern p = Pattern.compile(regEx);
            Matcher m = p.matcher(str);
            result = m.find();
        }
        return result;
    }

    public static boolean isValidCharacter(String keyword)
    {
        String str = keyword.toLowerCase();
        boolean result = false;
        if(str != null)
        {
            String regEx = "^[a-z]+$";
            Pattern p = Pattern.compile(regEx);
            Matcher m = p.matcher(str);
            result = m.find();
        }
        return result;
    }


    public static void main(String args1[])
    {
    }
}