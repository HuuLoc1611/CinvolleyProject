/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author Admin
 */


import static java.awt.SystemColor.text;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class DaoSendMail {

        private final String MAIL = "volleycinshop@gmail.com";
    private final String PASSWORD = "vbbwjxrxfyqsqhuk";
   // vbbwjxrxfyqsqhuk

    public void sentEmail(String toEmail, String subject, String text) {

        // Config
        Properties props = new Properties();
         //Enable authentication login mail
        
        
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", 587);
        props.put("mail.smtp.ssl.trust", "*");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
         
         
     props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        // Authenticator
        Session session = Session.getInstance(props, new Authenticator() {
           
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(MAIL, PASSWORD);
            }
        });

        // Mail info
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(MAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
          message.setSubject(subject, "UTF-8");
           message.setText(text, "UTF-8");

            Transport.send(message);
           
        } catch (Exception e) {
            System.out.println(e);
        }
    }
   /* public static void main(String[] args) {
        DaoSendMail d = new DaoSendMail();
        d.sentEmail("ngohuuloc54@gmail.com", "lộc", "lộc");
    }*/
    
}