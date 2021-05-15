package com.SPASM.required;

import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.SPASM.model.ForgotModel;

public class SendMail {
	public String getRandom() {
		Random rnd=new Random();
		int number=rnd.nextInt(999999);
		return String.format("%06d", number);
	}
	public boolean sendMail(ForgotModel u) throws AddressException, MessagingException {
		boolean test=false;
		final String fromEmail="spasmproject@gmail.com";
		final String password="8420660515";
		String toMail=u.getEmail();
		Properties p=new Properties();
		p.setProperty("mail.smtp.host", "smtp.gmail.com");
		p.setProperty("mail.smtp.port", "587");
		p.setProperty("mail.smtp.auth", "true");
		
		p.setProperty("mail.smtp.starttls.enable", "true");
		p.put("gmail.smtp.socketFactory.port", "587");
		p.put("gmail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		
		
		Session session=Session.getInstance(p, new Authenticator() {
			@Override
			 protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, password);
				
			}
		});
		 Message message=new MimeMessage(session);
		 message.setFrom(new InternetAddress(fromEmail));
		 message.addRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
		 message.setSubject(u.getCode()+" is your e-Ducation account recovery code");
		 message.setText("We received a request to reset your e-Ducation password.\r\n"
		 		+ "Enter the following passwords reset code: "+u.getCode());
		 Transport.send(message);
		 test=true;
		return test;
	}
}
