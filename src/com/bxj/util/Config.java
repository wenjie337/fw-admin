package com.bxj.util;

import java.io.File;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
//import org.springframework.stereotype.Component;
import org.springframework.core.env.Environment;

@Configuration
@PropertySource("classpath:config.properties")
public class Config {
	
	@Autowired
	private Environment env;
	
	public String getValue(String key){
		return env.getProperty(key);
	}
	
	public int getPagesize(){
		
		String pageSize =  getValue("page.pagesize");
		if(StringUtils.isBlank(pageSize)){
			return 10;
		}
		return Integer.parseInt(pageSize);
	}
	public String getMaxPagesize(){
		return getValue("page.maxpagesize");
	}
	
	public String getImageDir(){
		return System.getProperty("user.dir")+File.separator+"upload"+File.separator;
	}
	
	public String getProductDir(){
		return getValue("res.product");
	}
	
	public String getImagePrefix() {
		return getValue("image.prefix");
	}
	
	public String getResdir() {
		return getValue("res.dir");
	}
	
	public String getBaseUrl(){
		return getValue("base.url");
	}

	public String getProductInfoDir(){
		return getValue("res.product.info");
	}
	
	@Bean
	public static PropertySourcesPlaceholderConfigurer propertyConfigInDev() {
		return new PropertySourcesPlaceholderConfigurer();
	}
	
}
