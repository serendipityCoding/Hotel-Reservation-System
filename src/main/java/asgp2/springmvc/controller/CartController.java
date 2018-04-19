package asgp2.springmvc.controller;

import java.util.List;

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
import org.json.JSONObject;

import asgp2.springmvc.model.User;
import asgp2.springmvc.model.Order;
import asgp2.springmvc.model.Response;
import asgp2.springmvc.model.Login;
import asgp2.springmvc.service.BookingService;
import asgp2.springmvc.service.RoomService;

@Controller
public class CartController {
	private static final Logger logger = Logger.getLogger(CartController.class);
	
	@Autowired
	BookingService bookingService;
	
	@Autowired
	RoomService roomService;
	
	@RequestMapping(value="/cart",method=RequestMethod.GET)
	public ModelAndView showCart(HttpServletRequest request, HttpServletResponse response){
		HttpSession session=request.getSession();
		List<Order> orders=(List<Order>) session.getAttribute("orders");
		ModelAndView mav=new ModelAndView("cart");
		mav.addObject("login",new Login());
		return mav;
	}
	@RequestMapping(value="/checkout", method=RequestMethod.POST,headers = "Content-Type=application/json")
	@ResponseBody
	public Response checkout(HttpServletRequest request, HttpServletResponse response,@RequestBody List<Order> orders){
		HttpSession session=request.getSession();
		int userID=((User)session.getAttribute("user")).getId();
		logger.info(userID);
		for(Order order: orders){
			logger.info(order.getPrice());
			for(int i=0;i<order.getRoomCount();i++){
				int roomID=roomService.assignRoom(order);
				logger.info(roomID);
				int bookingID=bookingService.createBooking(roomID, userID, order);
				logger.info(bookingID);
			}
		}
		session.removeAttribute("orders");
		Response res=new Response();
		res.setSuccess(true);
		res.setMessage("Assign room successfully");
		return res;
	}
	@RequestMapping(value="/cancelBooking",method=RequestMethod.POST,headers="Content-Type=application/json")
	@ResponseBody
	public void cancelBooking(HttpServletRequest request, HttpServletResponse response,@RequestBody String data){
		JSONObject jsonObj = new JSONObject(data);
		int oldBookingID=jsonObj.getInt("bookingID");
		int bookingID=bookingService.cancelBooking(oldBookingID);
	}
}
