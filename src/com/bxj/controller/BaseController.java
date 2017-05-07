package com.bxj.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class BaseController {
	
	@RequestMapping("/switchsys")
	public String switchsys(HttpServletRequest request,int sys){
		
		request.getSession().setAttribute("selsys", sys);
		
		return "redirect:/index.htm";
		
	}

	@RequestMapping("/asidexs")
	public void asidexs(HttpServletRequest request,HttpServletResponse response,int xs){
		
		try{
			request.getSession().setAttribute("asidexs", xs);
			response.getWriter().write(xs);
			response.getWriter().flush();
		}catch(Exception ex){
			
		}
		
	}
}
