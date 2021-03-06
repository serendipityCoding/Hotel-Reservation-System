package asgp2.springmvc.controller;

import java.io.IOException;
import java.util.ArrayList;
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

import com.lowagie.text.DocumentException;

import org.json.JSONObject;

import asgp2.springmvc.model.User;
import asgp2.springmvc.model.Order;
import asgp2.springmvc.model.Response;
import asgp2.springmvc.model.UnregisterUser;
import asgp2.springmvc.model.Login;
import asgp2.springmvc.service.BookingService;
import asgp2.springmvc.service.RoomService;
import asgp2.springmvc.service.UnregisterUserService;
import asgp2.springmvc.util.DateUtil;
import asgp2.springmvc.util.EmailUtil;
import asgp2.springmvc.util.PDFUtil;
import asgp2.springmvc.util.TokenUtil;

@Controller
public class CartController {
	private static final Logger logger = Logger.getLogger(CartController.class);
	
	@Autowired
	BookingService bookingService;
	
	@Autowired
	UnregisterUserService unregisterUserService;
	
	@Autowired
	RoomService roomService;
	
	@RequestMapping(value="/cart",method=RequestMethod.GET)
	public ModelAndView showCart(HttpServletRequest request, HttpServletResponse response){
		HttpSession session=request.getSession();
		List<Order> orders=(List<Order>) session.getAttribute("orders");
		ModelAndView mav=new ModelAndView("cart");
		mav.addObject("login",new Login());
		mav.addObject("user", new User());
		return mav;
	}
	@RequestMapping(value="/checkout", method=RequestMethod.POST,headers = "Content-Type=application/json")
	@ResponseBody
	public Response checkout(HttpServletRequest request, HttpServletResponse response,@RequestBody List<Order> orders) throws IOException, DocumentException{
		HttpSession session=request.getSession();
		Response res=new Response();
		if(session.getAttribute("user")!=null){
			String userID=((User)session.getAttribute("user")).getId();
			ArrayList<Integer> bookingIDs=new ArrayList<>();
			for(Order order: orders){
				for(int i=0;i<order.getRoomCount();i++){
					int roomID=roomService.assignRoom(order);
					int bookingID=bookingService.createBooking(roomID, userID, order);			
					bookingIDs.add(bookingID);
				}
			}
			session.removeAttribute("orders");
			PDFUtil.generateOrderPDF((User)session.getAttribute("user"), bookingIDs, orders);
			EmailUtil.sendReservationConfirmationEmail((User)session.getAttribute("user"));
			res.setSuccess(true);
			res.setMessage("Assign room successfully");
		}
		else if(session.getAttribute("unregisteredUser")!=null){
			String userID=((UnregisterUser)session.getAttribute("unregisteredUser")).getId();	
			for(Order order: orders){
				logger.info(order.getPrice());
				for(int i=0;i<order.getRoomCount();i++){
					int roomID=roomService.assignRoom(order);
					int bookingID=bookingService.createBooking(roomID, userID, order);
				}
			}
			session.removeAttribute("orders");
			session.removeAttribute("unregisteredUser");
			res.setSuccess(true);
			res.setMessage("Assign room successfully");
		}
		else{
			res.setSuccess(false);
			res.setMessage("Please provide email address");
		}
		return res;
	}
	@RequestMapping(value="/cancelBooking",method=RequestMethod.POST,headers="Content-Type=application/json")
	@ResponseBody
	public void cancelBooking(HttpServletRequest request, HttpServletResponse response,@RequestBody String data){
		JSONObject jsonObj = new JSONObject(data);
		int oldBookingID=jsonObj.getInt("bookingID");
		int bookingID=bookingService.cancelBooking(oldBookingID);
	}
	@RequestMapping(value="/oneTimeReserve", method=RequestMethod.POST, headers="Content-Type=application/json")
	@ResponseBody
	public Response oneTimeReserve(HttpServletRequest request, HttpServletResponse response,@RequestBody UnregisterUser user){
		user.setCreateDate(DateUtil.getCurrentDate());
		user.setId(TokenUtil.generateID());
		unregisterUserService.createUnregisterUser(user);
		HttpSession session=request.getSession();
		session.setAttribute("unregisteredUser", user);
		Response res=new Response();
		res.setSuccess(true);
		res.setMessage("Registered");
		return res;
	}
}
