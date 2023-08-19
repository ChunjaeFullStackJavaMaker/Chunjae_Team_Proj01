package com.chunjae_pro01.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
public class SMTP extends Authenticator{
    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("admin", "1234");
    }
}
