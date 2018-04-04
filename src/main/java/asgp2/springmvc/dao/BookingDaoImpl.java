package asgp2.springmvc.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import asgp2.springmvc.model.Booking;

public class BookingDaoImpl implements BookingDao{
	@Autowired
	DataSource datasource;

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public void createBooking(Booking booking){
		
	}
}
