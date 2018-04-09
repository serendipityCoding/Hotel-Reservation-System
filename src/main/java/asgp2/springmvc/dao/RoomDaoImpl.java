package asgp2.springmvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import asgp2.springmvc.controller.CartController;
import asgp2.springmvc.model.Order;

public class RoomDaoImpl implements RoomDao {
	private static final Logger logger = Logger.getLogger(RoomDaoImpl.class);

	@Autowired
	DataSource datasource;

	@Autowired
	JdbcTemplate jdbcTemplate;

	public int assignRoom(Order order) {
		String sql = "SELECT Rooms.id AS room " + "FROM Rooms, (SELECT Locations.id FROM Locations WHERE location='"
				+ order.getLocation() + "') loc " + "WHERE Rooms.location= loc.id " + "AND Rooms.id NOT IN( "
				+ "SELECT Rooms.id " + "FROM Rooms JOIN Bookings " + "ON Rooms.id=Bookings.roomID " + "WHERE '"
				+ order.getFromDate() + "'<=Bookings.fromDate AND '" + order.getToDate() + "' >=Bookings.toDate "
				+ "OR '" + order.getFromDate() + "'<Bookings.fromDate AND '" + order.getToDate()
				+ "' >=Bookings.toDate " + "OR '" + order.getFromDate() + "'<=Bookings.fromDate AND '"
				+ order.getToDate() + "' >Bookings.toDate)" + "LIMIT 1";
		logger.info(sql);
		try {
			int room = jdbcTemplate.queryForObject(sql, Integer.class);
			return room;
		} catch (EmptyResultDataAccessException e) {
			logger.debug(e.getMessage());
		}
		return -1;
	}
}
