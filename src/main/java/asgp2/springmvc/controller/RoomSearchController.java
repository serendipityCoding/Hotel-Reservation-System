package asgp2.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import asgp2.springmvc.model.Criteria;
import asgp2.springmvc.model.RoomType;
import asgp2.springmvc.service.RoomTypeService;
@Controller
public class RoomSearchController {
	@Autowired
	RoomTypeService roomTypeService;
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public ModelAndView showCriteria(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView("search");
		mav.addObject("criteria",new Criteria());
		return mav;
	}
	@RequestMapping(value="/searchProcess",method=RequestMethod.POST)
	public ModelAndView getSearchResult(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("criteria") Criteria criteria){
		ModelAndView mav=null;
		List<RoomType> roomTypes=roomTypeService.searchRoom(criteria);
		HttpSession session=request.getSession();
		session.setAttribute("criteria", criteria);
		if(roomTypes.size()!=0){
			mav= new ModelAndView("result");
			mav.addObject("roomType",roomTypes);
		}
		return mav;
	}
}