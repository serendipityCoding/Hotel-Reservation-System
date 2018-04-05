package asgp2.springmvc.dao;

import java.util.List;

import asgp2.springmvc.model.Criteria;
import asgp2.springmvc.model.RoomType;

public interface RoomTypeDao {
	List<RoomType> searchRoom(Criteria criteria);

	RoomType getRoomDetail(int roomTypeID);
	
	int getAvailRoomCount(Criteria criteria, int roomType);
}
