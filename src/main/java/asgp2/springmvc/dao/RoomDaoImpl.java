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
import asgp2.springmvc.model.Room;
import asgp2.springmvc.model.RoomInfo;
import asgp2.springmvc.model.Staff;
import asgp2.springmvc.model.User;

public class RoomDaoImpl implements RoomDao {
	private static final Logger logger = Logger.getLogger(RoomDaoImpl.class);

	@Autowired
	DataSource datasource;

	@Autowired
	JdbcTemplate jdbcTemplate;

	public int assignRoom(Order order) {
		String sql = "SELECT Rooms.id AS room " 
					+ "FROM Rooms, (SELECT Locations.id "
					+ 				"FROM Locations "
					+ 				"WHERE location='"
					+ 				order.getLocation() + "') loc " 
					+ "WHERE Rooms.location= loc.id " 
					+ "AND Rooms.id NOT IN( "
					+ 						"SELECT Rooms.id " 
					+ 						"FROM Rooms JOIN Bookings " 
					+ 						"ON Rooms.id=Bookings.roomID " 
					+ 						"WHERE Bookings.isCancel=0 AND '"+ order.getFromDate() + "'<=Bookings.fromDate AND '" + order.getToDate() + "' >=Bookings.toDate "
					+ 							"OR Bookings.isCancel=0 AND'" + order.getFromDate() + "'<Bookings.fromDate AND '" + order.getToDate()+ "' >=Bookings.toDate " 
					+ 							"OR Bookings.isCancel=0 AND'" + order.getFromDate() + "'<=Bookings.fromDate AND '"+ order.getToDate() + "' >Bookings.toDate)" + "LIMIT 1";
		logger.info(sql);
		try {
			int room = jdbcTemplate.queryForObject(sql, Integer.class);
			return room;
		} catch (EmptyResultDataAccessException e) {
			logger.debug(e.getMessage());
		}
		return -1;
	}

	@Override
	public List<RoomInfo> getAllRooms() {
		String sql = "select Rooms.id as id, Rooms.roomID as roomID, "
					+"Rooms.floor as floor, RoomType.`type` as roomType, Rooms.isActive as isActive , "
					+"Locations.location as location from Rooms, Locations, RoomType "
					+"where Rooms.roomType=RoomType.id and Rooms.location=Locations.id";

		List<RoomInfo> rooms = jdbcTemplate.query(sql, new RoomInfoMapper());

		return rooms.size() > 0 ? rooms : null;
	}

	@Override
	public void updateActiveStatus(int roomID, int isActive) {
		String sql="UPDATE Rooms set isActive=? where id=?";
		jdbcTemplate.update(sql, new Object[]{roomID, isActive});
	}
}
class RoomInfoMapper implements RowMapper<RoomInfo> {

	public RoomInfo mapRow(ResultSet rs, int arg1) throws SQLException {
		RoomInfo roomInfo = new RoomInfo();
		roomInfo.setId(rs.getInt("id"));
		roomInfo.setRoomID(rs.getInt("roomID"));
		roomInfo.setFloorNo(rs.getInt("floor"));
		roomInfo.setRoomType(rs.getString("roomType"));
		roomInfo.setLocation(rs.getString("location"));
		roomInfo.setIsActive(rs.getInt("isActive"));

		return roomInfo;
	}
}
