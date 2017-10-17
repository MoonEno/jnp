package com.ihd.jnp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping(value="/product")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@RequestMapping(value="/productLine")
    public String productLine() {
        
        String resUrl = "product/productLine";
        
        logger.info(" welcome productLine");
        
        return resUrl;
    }
	
	@RequestMapping(value="/foodLine")
	public String introCi() {
		
		String resUrl = "product/foodLine";
		
		 logger.info(" welcome foodLine");
		
		return resUrl;
	}
}
