package com.bxj.util;

import java.io.IOException;
import java.net.URLDecoder;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;

import net.sf.json.JSONObject;

/**
 * Created by dukang on 2015/9/18.
 */
public class HttpRequestUtils {

    private static Logger logger = Logger.getLogger(HttpRequestUtils.class);

    /**
     * httpPost
     * @param url  路径
     * @param jsonParam 参数
     * @return
     */
    public static JSONObject httpPost(String url, JSONObject jsonParam) {
        return httpPost(url, jsonParam, false);
    }

    /**
     * post请求
     * @param url         url地址
     * @param jsonParam     参数
     * @param noNeedResponse    不需要返回结果
     * @return
     */
    public static JSONObject httpPost(String url, JSONObject jsonParam, boolean noNeedResponse) {
        //post请求返回结果
        DefaultHttpClient httpClient = new DefaultHttpClient();
        JSONObject jsonResult = null;
        HttpPost method = new HttpPost(url);
        try {
            if (null != jsonParam) {
                //解决中文乱码问题
                StringEntity entity = new StringEntity(jsonParam.toString(), "utf-8");
                entity.setContentEncoding("UTF-8");
                entity.setContentType("application/json");
                method.setEntity(entity);
            }
            HttpResponse result = httpClient.execute(method);
            url = URLDecoder.decode(url, "UTF-8");
            /**请求发送成功，并得到响应**/
            if (result.getStatusLine().getStatusCode() == 200) {
                String str = "";
                try {
                    /**读取服务器返回过来的json字符串数据**/
                    str = EntityUtils.toString(result.getEntity(), "UTF-8");
                    if (noNeedResponse) {
                        return null;
                    }
                    /**把json字符串转换成json对象**/
                    jsonResult = JSONObject.fromObject(str);
                } catch (Exception e) {
                    logger.error("post请求提交失败:" + url, e);
                }
            }
        } catch (IOException e) {
            logger.error("post请求提交失败:" + url, e);
        } finally {
            method.releaseConnection();
        }
        return jsonResult;
    }

    /**
     * 发送get请求
     * @param url    路径
     * @return
     */
    public static JSONObject httpGet(String url) {
        //get请求返回结果
        JSONObject jsonResult = null;
        HttpGet request = null;
        try {
            DefaultHttpClient client = new DefaultHttpClient();
            //发送get请求
            request = new HttpGet(url);
            HttpResponse response = client.execute(request);

            /**请求发送成功，并得到响应**/
            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                /**读取服务器返回过来的json字符串数据**/
                String strResult = EntityUtils.toString(response.getEntity(), "UTF-8");
                /**把json字符串转换成json对象**/
                jsonResult = JSONObject.fromObject(strResult);
                url = URLDecoder.decode(url, "UTF-8");
            } else {
                logger.error("get请求提交失败:" + url);
            }
        } catch (IOException e) {
            logger.error("get请求提交失败:" + url, e);
        } finally {
            if (request != null) request.releaseConnection();
        }
        return jsonResult;
    }
    /**
     * 发送get请求
     * @param url    路径
     * @return
     */
    public static String httpGetContent(String url) {
        //get请求返回结果
        String content = null;
        HttpGet request = null;
        HttpResponse response = null;
        try {
            DefaultHttpClient client = new DefaultHttpClient();
            //发送get请求
            request = new HttpGet(url);
            response = client.execute(request);
            HttpEntity entity = response.getEntity();
            content = EntityUtils.toString(entity);

        } catch (IOException e) {
            logger.error("get请求提交失败:" + url, e);
        } finally {
            if (request != null) request.releaseConnection();

        }
        return content;
    }



    public static void main(String[] args) {
        String str = "http://120.25.2.230:8181/sns/rest/geocoding/中国广东省深圳市宝安区/坪洲地铁站麻布新村7巷6号901";
        JSONObject json = HttpRequestUtils.httpGet(str);
        System.out.println(json);
    }

}
