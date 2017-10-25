package com.ihd.jnp.service;

import javax.transaction.SystemException;

import org.springframework.stereotype.Service;

import com.ihd.jnp.vo.MailVo;

@Service
public class QnaServiceImpl implements QnaService {

    @Override
    public MailVo sendEmailContents(MailVo param) throws SystemException {
        
        
         // 여기에 메일 보내는 서비스 로직 추가
        
        return param;
    }

    
    
}
