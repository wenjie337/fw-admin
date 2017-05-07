package com.bxj.util;

import org.apache.commons.lang.StringUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by dukang on 2015/9/17.
 */
@SuppressWarnings("all")
public class ResultModel {

    /**
     * 为了统一， 推荐code不要使用数字
     * @param isSucc
     * @param code
     * @param msg
     * @return
     */
    public static JsonObject genJsonObject(boolean isSucc, int code, String msg){
        JsonObject jsonObject = new JsonObject();
        jsonObject.put("status", isSucc?"success":"error");
        jsonObject.put("code", code);//定义-999999为未指定code
        jsonObject.put("msg", msg);
        return jsonObject;
    }

    public static JsonObject genJsonObject(boolean isSucc, String code, String msg){
        JsonObject jsonObject = new JsonObject();
        jsonObject.put("status", isSucc?"success":"error");
        jsonObject.put("code", StringUtils.isBlank(code)?"-999999":code);//定义-999999为未指定code
        jsonObject.put("msg", msg);
        return jsonObject;
    }
    /**
     * 
     * @param isSucc
     * @param code
     * @param obj
     * @return
     */
    public static JsonObject genJsonObject(boolean isSucc, String code, Object data){
        JsonObject jsonObject = new JsonObject();
        jsonObject.put("status", isSucc?"success":"error");
        jsonObject.put("code", StringUtils.isBlank(code)?"-999999":code);//定义-999999为未指定code
        jsonObject.put("data", data);
        return jsonObject;
    }

    public static JsonObject genJsonObject(boolean isSucc){
        return genJsonObject( isSucc, null,"");
    }

    public static class JsonObject extends HashMap<String, Object>{
        private Map<String, Object> result;
        private JsonObject(){
            this.result = new HashMap<>();
            this.put("result", result);
        }
        public JsonObject addAttr(String key, Object value){
            result.put(key, value);
            return this;
        }
        public Map<String, Object> getResult() {
            return result;
        }

        /**
         * 设置返回的result对象
         * @param result 需要放在result域里面的map对象
         * @return 当前对象
         * @deprecated 使用withModel方法， 当前的方法命名有歧义, result不一定非得是map类型的， 也可以是javabean类型的
         */
        public JsonObject setResult(Map<String, Object> result) {
            this.result = result;
            this.put("result", result);
            return this;
        }

        /**
         * 如果result不是map类型， 调用addAttr 的时候， result里面的内容就会消失，所以尽量使用map类型的
         * @param result
         * @return
         */
        public JsonObject withModel(Object result) {
            this.result = result instanceof Map ? ((Map) result) : new HashMap<>();
            this.put("result", result);
            return this;
        }

        public JsonObject withErrorCode(int code){
            this.put("status", "error");
            this.put("code", code);
            return this;
        }

        public JsonObject withSuccCode(int code){
            this.put("status", "success");
            this.put("code", code);
            return this;
        }
        public JsonObject withError(){
            this.put("status", "error");
            return this;
        }
        
        public JsonObject withError(Integer code,String msg){
        	this.put("code", code);
        	this.put("msg", msg);
            this.put("status", "error");
            return this;
        }
        
        public JsonObject withSucc(){
            this.put("status", "success");
            return this;
        }
        public JsonObject withCode(int code){
            this.put("code", code);
            return this;
        }
        public JsonObject withMsg(String msg){
            this.put("msg", msg);
            return this;
        }

        public JsonObject withErrorMsg(String msg){
            this.put("msg", msg);
            this.put("status", "error");
            return this;
        }
        public JsonObject withSuccMsg(String msg){
            this.put("msg", msg);
            this.put("status", "success");
            return this;
        }

        @Override
        @Deprecated
        public Object put(String key, Object value) {
            return super.put(key, value);
        }
    }

}
