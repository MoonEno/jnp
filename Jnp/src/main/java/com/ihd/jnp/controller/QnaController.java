/**
 * (주)오픈잇 | http://www.openit.co.kr
 * Copyright (c)2006-2017, openit Inc.
 * All rights reserved.
 */
package com.ihd.jnp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "qna")
public class QnaController {

    private static final Logger logger = LoggerFactory.getLogger(QnaController.class);

    @RequestMapping(value = "/qnaPage")
    public String qnaPage() {

        String resUrl = "qna/sendMail";

        return resUrl;
    }

}
