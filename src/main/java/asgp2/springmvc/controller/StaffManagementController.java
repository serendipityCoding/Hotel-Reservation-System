package asgp2.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import asgp2.springmvc.model.Staff;
import asgp2.springmvc.model.StaffLogin;
import asgp2.springmvc.service.StaffService;

@Controller
public class StaffManagementController {
	@Autowired
	StaffService staffService;
	
	@RequestMapping(value = "/staffList", method = RequestMethod.GET)
	public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("staffList");
		List<Staff> staffRes=staffService.getAllStaff();
		mav.addObject("staffList", staffRes);
		return mav;
	}
	
	@RequestMapping(value="changeStatus",method=RequestMethod.POST,headers="Content-Type=application/json")
	@ResponseBody
	public void changeStatus(HttpServletRequest request, HttpServletResponse response,@RequestBody String data){
		JSONObject jsonObj = new JSONObject(data);
		int staffID=jsonObj.getInt("id");
		int isActive=jsonObj.getInt("active");
		staffService.updateActiveStatus(staffID, isActive);
	}
}
