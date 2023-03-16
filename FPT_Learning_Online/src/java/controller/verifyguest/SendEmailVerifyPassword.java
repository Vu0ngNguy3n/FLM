/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.verifyguest;

import Utill.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmailVerifyPassword {

    final String fromEmail = "vuongnvhe163581@fpt.edu.vn";
    final String password = "knhhzrgghetorjnl";

    public static void SendEmail(String to, String sub,
            String msg, final String user, final String pass) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(sub);
            message.setContent(msg, "text/html");
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public static void  Send(String to, String sub, String msg ) {
        SendEmailVerifyPassword.SendEmail(to, sub, msg, "vuongnvhe163581@fpt.edu.vn", "knhhzrgghetorjnl");
    }

    public static void main(String[] args) {
        String subject = "Confirm Your email !";
        String message = "This is your Code:" + 123;
        for (int i = 0; i < 1; i++) {
            SendEmailVerifyPassword.SendEmail("hieubeo2882001@gmail.com", subject, "<!DOCTYPE html>\n"
                    + "cc", "vuongnvhe163581@fpt.edu.vn", "idldsqvslrmynaln");
        }
    }
}
