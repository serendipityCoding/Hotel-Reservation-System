package asgp2.springmvc.service;

import java.util.List;

import asgp2.springmvc.model.Criteria;
import asgp2.springmvc.model.RoomType;;

public interface RoomTypeService {
	List<RoomType> searchRoom(Criteria criteria);

	RoomType getRoomDetail(int roomTypeID);
}
