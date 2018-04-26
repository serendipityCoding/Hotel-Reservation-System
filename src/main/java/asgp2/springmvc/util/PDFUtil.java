package asgp2.springmvc.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.ParserConfigurationException;

import org.xhtmlrenderer.pdf.ITextRenderer;

import com.lowagie.text.DocumentException;

import asgp2.springmvc.model.Order;
import asgp2.springmvc.model.User;


public class PDFUtil {
	public static void generateOrderPDF(User user, ArrayList<Integer> bookingIDs, List<Order> orders) throws IOException, DocumentException {
		String inputFileName=generateHTML(user,bookingIDs,orders);
	        String url = new File(inputFileName).toURI().toURL().toString();

	        OutputStream out = new FileOutputStream("/Users/lijiamin/desktop/CS4280MVCProj/asgp2/"+user.getId()+".pdf");

	        //Flying Saucer part
	        ITextRenderer renderer = new ITextRenderer();

	        renderer.setDocument(url);
	        renderer.layout();
	        renderer.createPDF(out);

	        out.close();
	}

	private static String generateHTML(User user,ArrayList<Integer> bookingIDs, List<Order> orders) {
		String html="<html><body><p>Customer Information:</p><p>Name:"+user.getFirstname()+" "+user.getLastname()+"</p>"
						+ "<p>ID: "+user.getId()+"</p>"
						+ "<p>Email: "+user.getEmail()+"</p>"
						+ "<p>Tel: "+user.getPhone()+"</p>"
						+ "<p></p><p></p><p>Your orders:</p><ul>";
		int idNo=0;
		for(Order order:orders){
			for(int i=0;i<order.getRoomCount();i++){
				html+="<li><p>Booking ID:"+bookingIDs.get(idNo++)+"</p>"
						+"<p>Start Date: "+order.getFromDate()+"</p>"
						+"<p>End Date: "+order.getToDate()+"</p>"
						+ "<p>Location: "+order.getLocation()+"</p>"
						+ "<p>Room Type: "+order.getRoomType()+"</p>"
						+ "<p>Price: "+order.getPrice()+" HKD</p></li>";					
			}
		}	
		html+="</ul><p>If you have any enquiries about the order above, feel free to contact us through email jiaminli.icy@gmail.com. We will get back to you soon.</p></body></html>";
		System.out.print(html);
		String fileName="/Users/lijiamin/desktop/CS4280MVCProj/asgp2/"+user.getId()+".html";
		BufferedWriter bw = null;
		try {
			bw = new BufferedWriter(new FileWriter(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			bw.write(html);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			bw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fileName;
	}
}
