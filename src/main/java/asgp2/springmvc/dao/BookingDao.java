package asgp2.springmvc.dao;

import java.util.List;

import asgp2.springmvc.model.Booking;
import asgp2.springmvc.model.Order;

public interface BookingDao {
	int createBooking(int roomID, int userID, Order order);
	List<Booking> getBookingHistory(int userID);
}
