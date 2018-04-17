package asgp2.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import asgp2.springmvc.model.Response;
import asgp2.springmvc.model.Staff;
import asgp2.springmvc.model.StaffLogin;
import asgp2.springmvc.service.StaffService;
import asgp2.springmvc.util.DateUtil;
import asgp2.springmvc.util.EmailUtil;
import asgp2.springmvc.util.TokenUtil;

@Controller
public class StaffManagementController {
	private static final Logger logger = Logger.getLogger(StaffManagementController.class);
	
	@Autowired
	StaffService staffService;
	
	@RequestMapping(value = "/staffList", method = RequestMethod.GET)
	public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("staffList");
		List<Staff> staffRes=staffService.getAllStaff();
		mav.addObject("staffList", staffRes);
		return mav;
	}
	
	@RequestMapping(value="/changeStatus",method=RequestMethod.POST,headers="Content-Type=application/json")
	@ResponseBody
	public void changeStatus(HttpServletRequest request, HttpServletResponse response,@RequestBody String data){
		JSONObject jsonObj = new JSONObject(data);
		int staffID=jsonObj.getInt("id");
		int isActive=jsonObj.getInt("active");
		staffService.updateActiveStatus(staffID, isActive);
	}
	
	@RequestMapping(value="/addManager", method=RequestMethod.POST, headers="Content-Type=application/json")
	@ResponseBody
	public Response addManager(HttpServletRequest request, HttpServletResponse response,@RequestBody String data){
		JSONObject jsonObj=new JSONObject(data);
		String email=jsonObj.getString("email");
		String name=jsonObj.getString("name");
		String employeeID=jsonObj.getString("employeeID");
		HttpSession session=request.getSession();
		Staff loginStaff=(Staff) session.getAttribute("staff");
		Staff staff=new Staff();
		staff.setEmail(email);
		staff.setName(name);
		staff.setEmployeeId(employeeID);
		staff.setCreateById(loginStaff.getId());
		staff.setCreateByName(loginStaff.getName());
		staff.setCreateDate(DateUtil.getCurrentDate());
		staff.setRole(2);
		staff.setIsActive(1);
		staff.setInvitationToken(TokenUtil.generateToken());
		EmailUtil.sendManagerInvitationEmail(staff);
		Response res=new Response();
		try{
			int managerID=staffService.inviteNewManager(staff);			
			res.setSuccess(true);
			res.setMessage("Manager ID: "+managerID);
		}
		catch(Exception e){
			res.setSuccess(false);
			res.setMessage("Manager registration failure");			
		}
		return res;
	}
	
}
