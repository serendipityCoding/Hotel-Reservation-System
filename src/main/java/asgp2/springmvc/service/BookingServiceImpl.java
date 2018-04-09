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
	public int createBooking(int roomID, int userID, Order order){
		return bookingDao.createBooking(roomID, userID, order);
	}

	@Override
	public List<Booking> getBookingHistory(int userID) {
		return bookingDao.getBookingHistory(userID);
	}
}
