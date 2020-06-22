package com.www.utils;

import com.sun.mail.util.MailSSLSocketFactory;
import org.junit.Test;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.GeneralSecurityException;
import java.util.Date;
import java.util.Properties;

public class MailUtil {

    //
    @Test
    public  void sendMail(String  startTime, String endTime,String targetQQ) throws GeneralSecurityException, MessagingException {
        Properties props = new Properties();

        // 开启debug调试
        props.setProperty("mail.debug", "true");
        // 发送服务器需要身份验证
        props.setProperty("mail.smtp.auth", "true");
        // 设置邮件服务器主机名
        props.setProperty("mail.host", "smtp.qq.com");
        // 发送邮件协议名称
        props.setProperty("mail.transport.protocol", "smtp");

        // ssl 加密
        MailSSLSocketFactory sf = new MailSSLSocketFactory();
        sf.setTrustAllHosts(true);
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.socketFactory", sf);

        Session session = Session.getInstance(props);

        Message msg = new MimeMessage(session);
        msg.setSubject("停车信息");
        StringBuilder builder = new StringBuilder();
        builder.append("您于" + startTime +" 到 "+ endTime + "期间在桂溪公园园内停车场停车");
        builder.append("\n如不是您的操作，请尽快报警");
        msg.setText(builder.toString());
        msg.setFrom(new InternetAddress("2338053323@qq.com"));

        Transport transport = session.getTransport();
        transport.connect("smtp.qq.com", "2338053323@qq.com", "pgfrxrhjwzjaeage");

        transport.sendMessage(msg, new Address[] { new InternetAddress(targetQQ) });
        transport.close();
    }




}
