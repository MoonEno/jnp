package com.ihd.jnp.service;


import com.ihd.jnp.vo.MailVo;
import com.sun.mail.util.MailConnectException;

public interface QnaService {
    
    public MailVo sendEmailContents(MailVo param) throws MailConnectException;
}
