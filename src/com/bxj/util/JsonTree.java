package com.bxj.util;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class JsonTree {
	
	public static String sysuser(String json){
		
		json = json.replaceAll("username", "text");
		
		return json;
	}
	
	public static String sysrole(String json){
		json = json.replaceAll("roleDesc", "text");
		
		JSONArray jarr = JSONArray.fromObject(json);
		
		for(int i=0;i<jarr.size();i++){
			JSONObject jobj = (JSONObject)jarr.get(i);
			jobj.put("selectable", false);
		}
		
		json = jarr.toString();
		
		return json;
	}
	
	public static String menurole(String json){
		
		json = json.replaceAll("roleDesc", "text");
		
		return json;
	}

	/**
	 * bootstrap树形列表显示的json串，需要将显示的字段属性转换成text
	 * @param json
	 * @param properties
	 * @return
	 */
	public static String showMenuChangeText(String json,String properties){
		json = json.replaceAll(properties, "text");
		return json;
	}
	
	public static String sysmenu(String json){
		try{
			json = json.replaceAll("menuName", "text");
			json = json.replaceAll("\"subs\"\\:\\[\\]\\,", "");
			json = json.replaceAll("subs", "nodes");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		JSONArray jarr = JSONArray.fromObject(json);
		
		for(int i=0;i<jarr.size();i++){
			JSONObject jobj = (JSONObject)jarr.get(i);
			jobj.put("selectable", false);
		}
		
		json = jarr.toString();
		
		return json;
	}
	
}
