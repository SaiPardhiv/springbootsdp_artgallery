package com.klef.jfsd.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender javaMailSender;

    public void sendRegistrationEmail(String toEmail) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("ipardhivsaikumar@gmail.com"); // Set your email here
        message.setTo(toEmail);
        message.setSubject("Registration Successful");
        message.setText("Dear user, \n\nYour account has been successfully registered.\n\nThank you!");

        javaMailSender.send(message);
    }
}
