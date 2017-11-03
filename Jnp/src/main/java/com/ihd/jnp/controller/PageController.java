package com.ihd.jnp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/page")
public class PageController {

    private static final Logger logger = LoggerFactory.getLogger(PageController.class);
    
    /**
     *  :::::::::::::::::::::::::::::::
     *  ::::: DEFAULT METHOD ROLE :::::
     *  :::::::::::::::::::::::::::::::
     *  
     *  * Description Below Method (author, date, method desc ..)
     *  
     *  public ModelAndView(Model) methodName(Parameter paramName) {
     *      
     *      1차 - Method Join Log [methodName join - param value ] 
     *      
     *      영역 : 필요 변수 선언 및 생성
     *      
     *      try {
     *      
     *        2차 - Request Business Logic Log [mehodName Req - core param value ] 
     *        영역 : 필요 변수 값 세팅 및 Service logic Mapping
     *        
     *      } catch (Exception e ) {
     *        
     *        3차 - Error Log [methodName Error - Exception Error Log]
     *        resultCode setting
     *      }
     *      
     *      4차 - result value Log [methodName result - resultCode ]
     *      영역 : model 값 view 전송 및 resultCode 출력
     *  
     *  }
     *  
     *  
     * **/
    
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
