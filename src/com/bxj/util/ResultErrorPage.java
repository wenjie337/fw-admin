package com.bxj.util;

import org.springframework.web.servlet.ModelAndView;

/**
 * Created by dukang on 2015/9/17.
 */
public class ResultErrorPage {

    public static ModelAndView forwordErrorPage(ModelAndView mav){
        mav.setViewName("/error");
        return mav;
    }

}
