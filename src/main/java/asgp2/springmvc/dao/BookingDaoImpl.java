package asgp2.springmvc.dao;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.sql.DataSource;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import asgp2.springmvc.model.Booking;
import asgp2.springmvc.model.Order;
import asgp2.springmvc.model.RoomType;

public class BookingDaoImpl implements BookingDao {
	@Autowired
	DataSource datasource;

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public int createBooking(int roomID, int userID, Order order) {
		String sql = "insert into Bookings values(NULL,?,?,?,?,?,0,0)";
		try(Connection connection = (Connection) datasource.getConnection();
			PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);) {
			statement.setInt(1,roomID);
			statement.setInt(2,userID);
			statement.setString(3,order.getRoomType());
			statement.setString(4,order.getFromDate());
			statement.setString(5,order.getToDate());
			int affectedRows = statement.executeUpdate();
			if (affectedRows == 0) {
	            throw new SQLException("Creating booking failed, no rows affected.");
	        }
			ResultSet generatedKeys = statement.getGeneratedKeys();
			if (generatedKeys.next()) {
                return (int)generatedKeys.getLong(1);
            }
            else {
                throw new SQLException("Creating user failed, no ID obtained.");
            }
		} 
		catch(SQLException e){
			
		}
		return -1;
	}

	@Override
	public List<Booking> getBookingHistory(int userID) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate localDate = LocalDate.now();
		String sql="SELECT * FROM Bookings WHERE userID = '"+userID+"' and fromDate <='"+dtf.format(localDate)+"'ORDER BY fromDate desc";
		List<Booking> bookings=jdbcTemplate.query(sql, new BookingMapper());
		return bookings;
	}
	
	@Override 
	public List<Booking> getFutureBooking(int userID){
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate localDate = LocalDate.now();
		String sql="SELECT * FROM Bookings WHERE userID = '"+userID+"' and fromDate >'"+dtf.format(localDate)+"'ORDER BY fromDate desc";
		List<Booking> bookings=jdbcTemplate.query(sql, new BookingMapper());
		return bookings;
	}
	
	@Override
	public int cancelBooking(int bookingID){
		String sql = "update Bookings set isCancel=1 where id=?";
		try(Connection connection = (Connection) datasource.getConnection();
			PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);) {
			statement.setInt(1,bookingID);
			int affectedRows = statement.executeUpdate();
			if (affectedRows == 0) {
	            throw new SQLException("Update booking failed, no rows affected.");
	        }
			ResultSet generatedKeys = statement.getGeneratedKeys();
			if (generatedKeys.next()) {
                return (int)generatedKeys.getLong(1);
            }
            else {
                throw new SQLException("Creating user failed, no ID obtained.");
            }
		} 
		catch(SQLException e){
			
		}
		return -1;
	}
}
class BookingMapper implements RowMapper<Booking> {

	public Booking mapRow(ResultSet rs, int arg1) throws SQLException {
		Booking booking = new Booking();
		booking.setId(rs.getInt("id"));
		booking.setUserID(rs.getInt("userID"));
		booking.setRoomID(rs.getInt("roomID"));
		booking.setFromDate(rs.getString("fromDate"));
		booking.setToDate(rs.getString("toDate"));
		return booking;
	}
}

