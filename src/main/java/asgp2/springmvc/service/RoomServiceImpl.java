package asgp2.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import asgp2.springmvc.dao.RoomDao;
import asgp2.springmvc.model.Order;
import asgp2.springmvc.model.RoomInfo;
import asgp2.springmvc.model.User;

public class RoomServiceImpl implements RoomService{
	@Autowired
	public RoomDao roomDao;
		
	public int assignRoom(Order order){
		return roomDao.assignRoom(order);
	}

	@Override
	public List<RoomInfo> getAllRooms() {
		return roomDao.getAllRooms();
	}

	@Override
	public void updateActiveStatus(int roomID, int isActive) {
		roomDao.updateActiveStatus(roomID, isActive);
	}
}
