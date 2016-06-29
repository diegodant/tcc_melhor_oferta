package br.com.melhoroferta.utilidades;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 

public class EnviaEmail extends HttpServlet {

    private static final String to =  "contato@melhoroferta.net";
    private static final String host = "smtp.melhoroferta.net";
    private static final String userhost = "contato@melhoroferta.net";
    private static final String senha = "meof2012";

    private class SMTPAuthenticator extends javax.mail.Authenticator {

        @Override
        public PasswordAuthentication getPasswordAuthentication() {
            String username = userhost;
            String password = senha;
            return new PasswordAuthentication(username, 
password);
        }
    }

    @Override
    public void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException,
            IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        String cmd = request.getParameter("cmd");
        if (cmd.equalsIgnoreCase("envia_email")) {
            sendMail(request, response);

        }
    }

    public void sendMail(HttpServletRequest req,  HttpServletResponse res) throws ServletException, IOException {
        PrintWriter out = res.getWriter();
        res.setContentType("text/html");
        
        boolean debug = false;

        try {
            Properties props = new Properties();
            props.put("mail.smtp.host",host);
            props.put("mail.smtp.auth", "true");
            
            Authenticator auth = new SMTPAuthenticator();
            Session session = Session.getDefaultInstance(props,auth);

            session.setDebug(debug);

            MimeMessage message = new MimeMessage(session);

            message.setFrom(new InternetAddress(req.getParameter("Email")));
            Address toAddress = new InternetAddress(to);
            message.addRecipient(Message.RecipientType.TO,
                    toAddress);

            message.setSubject(req.getParameter("Assunto"));

            message.setText(req.getParameter("Mensagem"));

            Transport.send(message);

            out.println("E-mail enviado");
        } catch (MessagingException e) {
            out.println("Email nao pode ser enviado! " + e.getMessage());

        }
    }
}
