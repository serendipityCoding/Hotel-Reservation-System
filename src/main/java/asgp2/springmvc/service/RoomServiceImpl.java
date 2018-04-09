package asgp2.springmvc.service;

import org.springframework.beans.factory.annotation.Autowired;

import asgp2.springmvc.dao.RoomDao;
import asgp2.springmvc.model.Order;

public class RoomServiceImpl implements RoomService{
	@Autowired
	public RoomDao roomDao;
		
	public int assignRoom(Order order){
		return roomDao.assignRoom(order);
	}
}
