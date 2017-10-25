package com.ihd.jnp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/page")
public class PageController {

    private static final Logger logger = LoggerFactory.getLogger(PageController.class);

    @RequestMapping(value = "/mainPage")
    public String welcomePage() {

        String resUrl = "main";

        return resUrl;
    }
    
    
    @RequestMapping(value = "/location")
    public String companyLocation() {
        
        String resUrl = "location/location";
        
        return resUrl;
    }
    
    @RequestMapping(value = "/salesChart")
    public String salesChart() {
        
        String resUrl = "chart/salesChart";
        
        return resUrl;
    }

}
