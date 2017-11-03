package com.ihd.jnp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;




@Controller
@RequestMapping(value="/intro")
public class IntroController {

	private static final Logger logger = LoggerFactory.getLogger(IntroController.class);
	
	@RequestMapping(value="/greeting")
    public String introGreeting() {
        
        String resUrl = "introduce/greeting";
        
        logger.info(" welcome greeting");
        
        return resUrl;
    }
	
   @RequestMapping(value="/history")
    public String introHistory() {
        
        String resUrl = "introduce/history";
        
         logger.info(" welcome history");
        
        return resUrl;
    }
   
    @RequestMapping(value="/organization")
    public String introorganization() {
        
        String resUrl = "introduce/organization";
        
         logger.info(" welcome organization");
        
        return resUrl;
    }

	@RequestMapping(value="/ci")
	public String introCi() {
		
		String resUrl = "introduce/ci";
		
		 logger.info(" welcome ci");
		
		return resUrl;
	}
}
