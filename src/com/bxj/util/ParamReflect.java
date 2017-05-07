package com.bxj.util;

import java.lang.reflect.Field;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

public class ParamReflect {
	
	private final static Logger logger = Logger.getLogger(ParamReflect.class);

	@SuppressWarnings("rawtypes")
	public static Object reflect(HttpServletRequest request,Object obj) {
		Map params = (Map)request.getSession().getAttribute("search_params");
		
		if(params == null || params.isEmpty()){
			return obj;
		}

		try{
			Class c = obj.getClass();
			Field[] fs = c.getDeclaredFields();
			for (int i = 0; i < fs.length; i++) {
				Field f = fs[i];
				f.setAccessible(true); // 设置些属性是可以访问的
				Object val = f.get(obj);// 得到此属性的值
				String key = f.getName();

				//String type = f.getType().toString();// 得到此属性的类型
				
				if(params.containsKey(key) && val == null){
					
					Object o = params.get(key);
					
					if(f.getType() == Integer.class){
						if(o!=null && !o.equals("")){
							if(o instanceof String){
								f.set(obj, Integer.parseInt((String)o));
							}else{
								f.set(obj, (Integer)o);
							}
						}
					}else{
						f.set(obj, o);
					}
				}

			}
		}catch(Exception e){
			logger.error(e.getMessage(), e);
		}
		
		return obj;
	}

}
