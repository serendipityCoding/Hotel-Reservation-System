package asgp2.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import asgp2.springmvc.dao.BookingDao;
import asgp2.springmvc.model.Booking;
import asgp2.springmvc.model.Order;

public class BookingServiceImpl implements BookingService{
	@Autowired
	public BookingDao bookingDao;
	
	@Override
	public int createBooking(int roomID, String userID, Order order){
		return bookingDao.createBooking(roomID, userID, order);
	}

	@Override
	public List<Booking> getBookingHistory(String userID) {
		return bookingDao.getBookingHistory(userID);
	}
	
	@Override 
	public List<Booking> getFutureBooking(String userID){
		return bookingDao.getFutureBooking(userID);
	}
	
	@Override
	public int cancelBooking(int bookingID){
		return bookingDao.cancelBooking(bookingID);
	}
}
