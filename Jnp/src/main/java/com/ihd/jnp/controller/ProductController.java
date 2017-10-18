package com.ihd.jnp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping(value="/product")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@RequestMapping(value="/line/{group}")
    public ModelAndView productLine(@PathVariable("group") String group) {
	    
	    String resUrl = "product/line";
	    
	    ModelAndView mav = new ModelAndView();
	    
	    try{
	        
	        if (!"".equalsIgnoreCase(group)) {
	            mav.addObject("value", group);
	        }
	        
	    } catch(Exception e) {
	        logger.error("[productLine]");
	    }
        
        mav.setViewName(resUrl);
        
        return mav;
    }
	
}
