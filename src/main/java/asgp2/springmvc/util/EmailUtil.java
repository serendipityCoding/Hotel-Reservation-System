package asgp2.springmvc.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import asgp2.springmvc.model.Order;
import asgp2.springmvc.model.Staff;
import asgp2.springmvc.model.User;

public class EmailUtil {
	public static void sendManagerInvitationEmail(Staff staff){
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		Session session = Session.getDefaultInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("jiaminli.icy@gmail.com","icy54378966");
				}
			});

		try {
			String url="http://localhost:8080/asgp2/staffRegistration?employeeID="+staff.getEmployeeId()+"&&token="+staff.getInvitationToken();
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("jiaminli.icy@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(staff.getEmail()));
			message.setSubject("Manager Invitation Email: Registration Form");
			String body="<p>Dear "+staff.getName()+" (EmployeeID: "+staff.getEmployeeId()+"):</p>"
					+"<p>Please use the following link to register as a hotel manager "
					+"<a href='"+url+"'>Register Here</a></p>"
					+ "<p>Thanks a lot for your effort</p><p></p><p>Icy LI</p><p>Chief Manager</p>";
			MimeBodyPart mimeBodyPart=new MimeBodyPart();
		    mimeBodyPart.setContent(body,"text/html");	      
			message.setText(body);
			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
	
	public static void sendReservationConfirmationEmail(User user) throws IOException{
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		Session session = Session.getDefaultInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("jiaminli.icy@gmail.com","icy54378966");
				}
			});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("jiaminli.icy@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(user.getEmail()));
			message.setSubject("Manager Invitation Email: Registration Form");
			String body="<p>Dear "+user.getFirstname()+":</p>"
					+"<p>Thank you for reserve at our hotel. Your receipt is attached to this email."
					+ "Please keep a copy in your devices or print it out when you check in."
					+ "<p>Thanks a lot for your effort</p><p></p><p></p><p>GOGO Pikachu</p>";
			Multipart multipart = new MimeMultipart();

	        MimeBodyPart textBodyPart = new MimeBodyPart();
	        textBodyPart.setContent(body, "text/html");

	        MimeBodyPart attachmentBodyPart= new MimeBodyPart();
	        DataSource source = new FileDataSource("/Users/lijiamin/desktop/CS4280MVCProj/asgp2/"+user.getId()+".pdf"); // ex : "C:\\test.pdf"
	        attachmentBodyPart.setDataHandler(new DataHandler(source));
	        attachmentBodyPart.setFileName("receipt.pdf"); // ex : "test.pdf"

	        multipart.addBodyPart(textBodyPart);  // add the text part
	        multipart.addBodyPart(attachmentBodyPart); // add the attachement part

	        message.setContent(multipart);
			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}