package asgp2.springmvc.service;

import org.springframework.beans.factory.annotation.Autowired;

import asgp2.springmvc.dao.BookingDao;
import asgp2.springmvc.model.Booking;

public class BookingServiceImpl implements BookingService{
	@Autowired
	public BookingDao bookingDao;
	
	public void createBooking(Booking booking){
		bookingDao.createBooking(booking);
	}
}
