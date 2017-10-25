package com.ihd.jnp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/business")
public class BusinessController {

    private static final Logger logger = LoggerFactory.getLogger(BusinessController.class);

    @RequestMapping(value = "/mainBiz")
    public String mainBusiness() {

        String resUrl = "/business/mainBiz";

        return resUrl;
    }
}
