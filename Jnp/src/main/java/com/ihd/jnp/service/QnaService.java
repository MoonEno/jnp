package com.ihd.jnp.service;

import javax.transaction.SystemException;


import com.ihd.jnp.vo.MailVo;

public interface QnaService {
    
    public MailVo sendEmailContents(MailVo param) throws SystemException;
}
