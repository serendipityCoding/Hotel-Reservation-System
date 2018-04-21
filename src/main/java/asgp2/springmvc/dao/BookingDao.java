package asgp2.springmvc.dao;

import java.util.List;

import asgp2.springmvc.model.Booking;
import asgp2.springmvc.model.Order;

public interface BookingDao {
	int createBooking(int roomID, String userID, Order order);
	List<Booking> getBookingHistory(String userID);
	List<Booking> getFutureBooking(String userID);
	int cancelBooking(int bookingID);
}
