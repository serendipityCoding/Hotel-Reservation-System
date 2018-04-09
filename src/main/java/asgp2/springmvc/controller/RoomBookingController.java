package asgp2.springmvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import asgp2.springmvc.model.Order;
import asgp2.springmvc.model.Response;

@Controller
@RequestMapping("/booking")
public class RoomBookingController {
	private static final Logger logger = Logger.getLogger(RoomBookingController.class);
	@RequestMapping(method=RequestMethod.POST,headers = "Content-Type=application/json")
	@ResponseBody
	public Response addOrderToCart(HttpServletRequest request, HttpServletResponse response, @RequestBody Order order) throws IOException{
		HttpSession session=request.getSession();
		if(session.getAttribute("orders")==null){
			List<Order> orders=new ArrayList<>();
			orders.add(order);
			session.setAttribute("orders", orders);
		}
		else{
			List<Order> orders=(List<Order>) session.getAttribute("orders");
			orders.add(order);
			session.setAttribute("orders", orders);
		}
		Response r=new Response();
		r.setSuccess(true);
		r.setMessage("Reservation add to Cart");
		return r;
	}

}
