package asgp2.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import asgp2.springmvc.model.RoomInfo;
import asgp2.springmvc.model.Staff;
import asgp2.springmvc.model.StaffLogin;
import asgp2.springmvc.model.User;
import asgp2.springmvc.service.RoomService;
import asgp2.springmvc.service.RoomTypeService;

@Controller
public class RoomManagementController {
	@Autowired
	RoomService roomService;
	
	@Autowired
	RoomTypeService roomTypeService;
	
	@RequestMapping(value = "/roomList", method = RequestMethod.GET)
	public ModelAndView getRoomList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		if(session.getAttribute("staff")==null){
			ModelAndView mav = new ModelAndView("staffLogin");
			mav.addObject("staffLogin", new StaffLogin());
			return mav;
		}
		else if(((Staff)session.getAttribute("staff")).getRole()!=2){
			return null;
		}
		else{
			ModelAndView mav = new ModelAndView("roomList");
			List<RoomInfo> rooms=roomService.getAllRooms();
			mav.addObject("roomList", rooms);
			return mav;
		}
	}
	@RequestMapping(value="/changeRoomStatus",method=RequestMethod.POST,headers="Content-Type=application/json")
	@ResponseBody
	public void changeStatus(HttpServletRequest request, HttpServletResponse response,@RequestBody String data){
		JSONObject jsonObj = new JSONObject(data);
		int roomID=jsonObj.getInt("id");
		int isActive=jsonObj.getInt("active");
		roomService.updateActiveStatus(roomID, isActive);
	}
}
