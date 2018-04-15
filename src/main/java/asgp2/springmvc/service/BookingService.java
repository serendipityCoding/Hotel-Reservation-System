package asgp2.springmvc.service;

import java.util.List;

import asgp2.springmvc.model.Booking;
import asgp2.springmvc.model.Order;

public interface BookingService {
	int createBooking(int roomID, int userID, Order order);
	List<Booking> getBookingHistory(int userID);
	List<Booking> getFutureBooking(int userID);
	int cancelBooking(int bookingID);
}
