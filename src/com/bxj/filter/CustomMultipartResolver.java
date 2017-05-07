package com.bxj.filter;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;


public class CustomMultipartResolver extends CommonsMultipartResolver{
	
	@Override
	public boolean isMultipart(HttpServletRequest request)
	{
		if(request!=null && request.getRequestURI().contains("ueditor")){
			return false;
		}
		return (request != null) && (ServletFileUpload.isMultipartContent(request));
	}

}
