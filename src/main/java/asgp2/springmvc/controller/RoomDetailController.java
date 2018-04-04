package asgp2.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import asgp2.springmvc.model.RoomType;
import asgp2.springmvc.service.RoomTypeService;

@Controller
public class RoomDetailController {
	@Autowired
	RoomTypeService roomTypeService;
	
	@RequestMapping(value="/roomDetail", method=RequestMethod.GET)
	public ModelAndView showRoomDetail(HttpServletRequest request, HttpServletResponse reponse){
		ModelAndView mav=new ModelAndView("detail");
		int roomTypeID=Integer.parseInt(request.getParameter("typeID"));
		RoomType roomType=roomTypeService.getRoomDetail(roomTypeID);
		mav.addObject("roomDetail",roomType);
		return mav;
	}
}
