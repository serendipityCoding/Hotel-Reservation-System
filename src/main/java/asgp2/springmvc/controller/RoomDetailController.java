package asgp2.springmvc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import asgp2.springmvc.model.Criteria;
import asgp2.springmvc.model.Order;
import asgp2.springmvc.model.RoomType;
import asgp2.springmvc.service.RoomTypeService;

@Controller
public class RoomDetailController {
	@Autowired
	RoomTypeService roomTypeService;
	
	@RequestMapping(value="/roomDetail", method=RequestMethod.GET)
	public ModelAndView showRoomDetail(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView("detail");
		int roomTypeID=Integer.parseInt(request.getParameter("typeID"));
		RoomType roomType=roomTypeService.getRoomDetail(roomTypeID);
		HttpSession session=request.getSession();	
		Criteria criteria=(Criteria) session.getAttribute("criteria");
		int maxAvailRoom=roomTypeService.getAvailRoomCount(criteria,roomTypeID);
		mav.addObject("roomDetail",roomType);
		mav.addObject("maxAvailRoom",maxAvailRoom);
		mav.addObject("order",new Order());
		mav.addObject("startDate",criteria.getStartDate());
		mav.addObject("endDate",criteria.getEndDate());
		mav.addObject("location",criteria.getLocation());
		return mav;
	}
	@RequestMapping(value="/roomAvail", method=RequestMethod.POST,headers = "Content-Type=application/json")
	@ResponseBody
	public int getRoomAvailable(HttpServletRequest request, HttpServletResponse response, @RequestBody String data){
		JSONObject jsonObj = new JSONObject(data);
		Criteria criteria=new Criteria();
		criteria.setStartDate(jsonObj.getString("fromDate"));
		criteria.setEndDate(jsonObj.getString("toDate"));
		criteria.setLocation(jsonObj.getString("location"));
		int maxAvailRoom=roomTypeService.getAvailRoomCount(criteria,jsonObj.getInt("roomType"));
		return maxAvailRoom;		
	}
}
