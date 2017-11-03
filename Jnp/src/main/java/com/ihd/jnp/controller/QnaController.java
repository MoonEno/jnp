/**
 * (주)오픈잇 | http://www.openit.co.kr
 * Copyright (c)2006-2017, openit Inc.
 * All rights reserved.
 */
package com.ihd.jnp.controller;

import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ihd.jnp.service.QnaService;
import com.ihd.jnp.vo.MailVo;

@Controller
@RequestMapping(value = "/qna")
public class QnaController {

    private static final Logger logger = LoggerFactory.getLogger(QnaController.class);

    @Autowired
    QnaService qnaService;
    
    @RequestMapping(value = "/sendEmail")
    public String sendEmail() {

        String resUrl = "qna/sendMail";

        return resUrl;
    }
    
    
    @RequestMapping(value="/qnaContents" , method = RequestMethod.POST)
    public String emailContents(MailVo mailVo) {
        
        String resUrl = "";
        
        // jsp에서 client가 보낸 값을 service로 이동시켜 로직 처리
        try {
            qnaService.sendEmailContents(mailVo);
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        
        return resUrl;
    }

}
