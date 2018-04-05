package asgp2.springmvc.service;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import asgp2.springmvc.dao.RoomTypeDao;
import asgp2.springmvc.model.Criteria;
import asgp2.springmvc.model.RoomType;

public class RoomTypeServiceImpl implements RoomTypeService{
	
	@Autowired
	public RoomTypeDao roomTypeDao;
	
	@Override
	public List<RoomType> searchRoom(Criteria criteria) {
		return roomTypeDao.searchRoom(criteria);
	}

	@Override
	public RoomType getRoomDetail(int roomTypeID) {
		return roomTypeDao.getRoomDetail(roomTypeID);
	}
	
	public int getAvailRoomCount(Criteria criteria, int roomType){
		return roomTypeDao.getAvailRoomCount(criteria, roomType);
	}

}
