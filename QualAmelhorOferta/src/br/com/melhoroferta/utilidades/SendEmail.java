/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.melhoroferta.utilidades;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Diego
 */
public class SendEmail {
    
    private static final String to =  "contato@melhoroferta.net";
    private static final String host = "smtp.melhoroferta.net";
    private static final String userhost = "contato@melhoroferta.net";
    private static final String senha = "meof2012";
    
    public SendEmail(String email , String assunto , String mensagem){
        try{
        Properties props = new Properties();
            props.put("mail.smtp.host",host);
            props.put("mail.smtp.auth", "true");
            
            Authenticator auth = new SMTPAuthenticator();
            Session session = Session.getDefaultInstance(props,auth);
   
            session.setDebug(true);

            MimeMessage message = new MimeMessage(session);

            message.setFrom(new InternetAddress(to));
            Address toAddress = new InternetAddress(email);
            message.addRecipient(Message.RecipientType.TO,
                    toAddress);

            message.setSubject(assunto);

            message.setText(mensagem);

            Transport.send(message);
            
        }catch(Exception e){
            e.getMessage();
        }
    }
        
    
     private class SMTPAuthenticator extends javax.mail.Authenticator {

        @Override
        public PasswordAuthentication getPasswordAuthentication() {
            String username = userhost;
            String password = senha;
            return new PasswordAuthentication(username, 
password);
        }
    }
}
