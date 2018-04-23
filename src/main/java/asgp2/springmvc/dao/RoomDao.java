package asgp2.springmvc.dao;

import java.util.List;

import asgp2.springmvc.model.Order;
import asgp2.springmvc.model.RoomInfo;

public interface RoomDao {
	int assignRoom(Order order);

	List<RoomInfo> getAllRooms();

	void updateActiveStatus(int roomID, int isActive);
}
