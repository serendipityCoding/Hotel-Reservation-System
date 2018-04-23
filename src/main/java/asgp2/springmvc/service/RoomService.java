package asgp2.springmvc.service;

import java.util.List;

import asgp2.springmvc.model.Order;
import asgp2.springmvc.model.RoomInfo;

public interface RoomService {
	int assignRoom(Order order);

	List<RoomInfo> getAllRooms();

	void updateActiveStatus(int roomID, int isActive);
}
