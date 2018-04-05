package asgp2.springmvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import asgp2.springmvc.model.Order;

@Controller
public class RoomBookingController {
	@RequestMapping(value="/booking",method=RequestMethod.POST)
	public ModelAndView addOrderToCart(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("order")Order order){
		HttpSession session=request.getSession();
		if(session.getAttribute("orders")==null){
			List<Order> orders=new ArrayList<>();
			orders.add(order);
			session.setAttribute("orders", order);
		}
		else{
			List<Order> orders=(List<Order>) session.getAttribute("orders");
			orders.add(order);
			session.setAttribute("orders", order);
		}
		ModelAndView mav=new ModelAndView("search");
		return mav;
	}
}
