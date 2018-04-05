package asgp2.springmvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import asgp2.springmvc.model.RoomType;
import asgp2.springmvc.model.Criteria;

public class RoomTypeDaoImpl implements RoomTypeDao{
	@Autowired
	DataSource datasource;

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public List<RoomType> searchRoom(Criteria criteria){
		String sql="SELECT * "
                +            "FROM RoomType,("          
                +                          "SELECT roomType AS t "
                +                          "FROM Rooms, (SELECT Locations.id FROM Locations WHERE location='"+criteria.getLocation()+"') loc "
                +                          "WHERE Rooms.location= loc.id "
                +                                "AND Rooms.id NOT IN( "
                +                                  "SELECT Rooms.id "
                +                                  "FROM Rooms JOIN Bookings "
                +                                  "ON Rooms.id=Bookings.roomID "
                +                                  "WHERE '"+criteria.getStartDate()+ "'<=Bookings.fromDate AND '"+criteria.getEndDate()+ "' >=Bookings.toDate "
                +                                      "OR '"+criteria.getStartDate()+ "'<Bookings.fromDate AND '"+criteria.getEndDate()+ "' >=Bookings.toDate "
                +                                      "OR '"+criteria.getStartDate()+ "'<=Bookings.fromDate AND '"+criteria.getEndDate()+ "' >Bookings.toDate)"
                +                          "GROUP BY roomType) temp "
                +              "WHERE RoomType.id = temp.t";
		List<RoomType> roomType=jdbcTemplate.query(sql, new RoomTypeMapper());
		return roomType;
	}

	@Override
	public RoomType getRoomDetail(int roomTypeID) {
		String sql="select * from RoomType where id='"+roomTypeID+"'";
		List<RoomType> roomType=jdbcTemplate.query(sql, new RoomTypeMapper());
		return roomType.get(0);
	}
	
	public int getAvailRoomCount(Criteria criteria, int roomType){
		String sql="SELECT COUNT(*) AS t "
                +  "FROM Rooms, (SELECT Locations.id FROM Locations WHERE location='"+criteria.getLocation()+"') loc "
                +  "WHERE Rooms.location= loc.id AND Rooms.roomType='"+roomType+"'"
                +         "AND Rooms.id NOT IN( "
                +                                "SELECT Rooms.id "
                +                                "FROM Rooms JOIN Bookings "
                +                                "ON Rooms.id=Bookings.roomID "
                +                                "WHERE '"+criteria.getStartDate()+ "'<=Bookings.fromDate AND '"+criteria.getEndDate()+ "' >=Bookings.toDate "
                +                                   "OR '"+criteria.getStartDate()+ "'<Bookings.fromDate AND '"+criteria.getEndDate()+ "' >=Bookings.toDate "
                +                                   "OR '"+criteria.getStartDate()+ "'<=Bookings.fromDate AND '"+criteria.getEndDate()+ "' >Bookings.toDate)";

		int count=jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}
	
}

class RoomTypeMapper implements RowMapper<RoomType> {

	public RoomType mapRow(ResultSet rs, int arg1) throws SQLException {
		RoomType roomType = new RoomType();
		roomType.setId(rs.getInt("id"));
		roomType.setType(rs.getString("type"));
		roomType.setSize(rs.getFloat("size"));
		roomType.setSingleBedNo(rs.getInt("singleBedNo"));
		roomType.setDoubleBedNo(rs.getInt("doubleBedNo"));
		roomType.setGuestNo(rs.getInt("guestNo"));
		roomType.setHasRefrigerator(rs.getBoolean("hasRefrigerator"));
		roomType.setHasLivingRoom(rs.getBoolean("hasLivingRoom"));
		roomType.setHasWIFI(rs.getBoolean("hasWIFI"));
		roomType.setHasParkingLot(rs.getBoolean("hasParkingLot"));
		roomType.setDescription(rs.getString("description"));
		roomType.setPrice(rs.getFloat("price"));
		return roomType;
	}
}
