package com.ihd.jnp.service;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.stereotype.Service;

import com.ihd.jnp.vo.MailVo;
import com.sun.mail.util.MailConnectException;

@Service
public class QnaServiceImpl implements QnaService {

    @Override
    public MailVo sendEmailContents(MailVo param) throws MailConnectException {
        
        
        SimpleEmail email = new SimpleEmail();
        String host = "smtp.gmail.com";
        String userName ="moonshue@gmail.com";
        String password = "dlsgh1129!";
//        int port = 587;
        
        String recipient = param.getEmail();
        String subject = param.getTitle();
        String body = param.getMessage();
        
        email.setCharset("UTF-8");
        email.setHostName(host);
        email.setAuthentication(userName, password);
        
        try {
            
            email.addTo(userName);
            email.setFrom(recipient);
            email.setSubject(subject);
            email.setContent(body, "text/plain; charset=UTF-8"); 
        } catch(EmailException e) {
            e.printStackTrace();
        }
        
        try {
            email.send();
        } catch (EmailException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
         // 여기에 메일 보내는 서비스 로직 추가
        
/*        // 메일 관련 정보

        // 메일 내용

        
        // 프로퍼티 설정
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        
        // 메일 세션 유지
        Session session = Session.getDefaultInstance(props);
        MimeMessage msg = new MimeMessage(session);
        
        // 메일 관련 코드
        msg.setSubject(subject, "UTF-8");
        msg.setText(body, "UTF-8");
        
        // 받는 사람 메일 주소
        msg.setFrom(new InternetAddress(userName));
        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
        
        // 발송처리
        Transport transport = session.getTransport("smtps");
        transport.connect(host, port, userName, password);
        transport.sendMessage(msg, msg.getAllRecipients());
        transport.close();*/
        
        
        return param;
    }

    
    
}
