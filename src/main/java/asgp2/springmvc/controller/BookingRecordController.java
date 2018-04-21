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

import asgp2.springmvc.model.Booking;
import asgp2.springmvc.model.Criteria;
import asgp2.springmvc.model.User;
import asgp2.springmvc.service.BookingService;

@Controller
public class BookingRecordController {
	private static final Logger logger = Logger.getLogger(BookingRecordController.class);
	@Autowired
	BookingService bookingService;
	
	@RequestMapping(value="/record", method=RequestMethod.GET)
	public ModelAndView showBookingRecord(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView("record");
		HttpSession session=request.getSession();
		String userID=((User)session.getAttribute("user")).getId();
		List<Booking> pastBookings=bookingService.getBookingHistory(userID);
		List<Booking> futureBookings=bookingService.getFutureBooking(userID);
		mav.addObject("pastBookings",pastBookings);
		mav.addObject("futureBookings",futureBookings);
		mav.addObject("criteria",new Criteria());
		return mav;
	}
}
