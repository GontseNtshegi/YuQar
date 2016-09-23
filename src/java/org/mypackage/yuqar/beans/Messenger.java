/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.yuqar.beans;

/**
 *
 * @author Gontse Ntshegi
 */

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Messenger {
    
    public Messenger()
    {
        
    }
    
    public void sendEmail(String email, String password, String username)
    {
        Properties props = new Properties();
        Session session = Session.getDefaultInstance(props, null);

        String msgBody = "Password: "+password;

        try
        {
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress("Admin@YuqarTechnologies.co.za", "Yuqar.co.za Admin"));
            msg.addRecipient(Message.RecipientType.TO,new InternetAddress("gontse.ntshegi@gmail.com", "Mr. "+username));
            msg.setSubject("YuQar Password change!!");
            msg.setText(msgBody);
            Transport.send(msg);

        } 
        catch(AddressException e) {
           
    
        } catch(MessagingException e) {
         
        }
        catch(Exception e)
        {
            
        }
    }
}
