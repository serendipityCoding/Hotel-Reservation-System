package asgp2.springmvc.controller;

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

import asgp2.springmvc.model.Login;
import asgp2.springmvc.model.Response;
import asgp2.springmvc.model.Staff;
import asgp2.springmvc.service.StaffService;

@Controller
public class StaffRegistrationController {
	@Autowired
	StaffService staffService;
	
	@RequestMapping(value = "/staffRegistration", method = RequestMethod.GET)
	public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response) {
		String employeeID=request.getParameter("employeeID");
		String invitationToken=request.getParameter("token");
		boolean isValid=staffService.invitationValidate(employeeID,invitationToken);
		if(isValid==true){
			ModelAndView mav=new ModelAndView("staffRegister");
			mav.addObject("employeeID",employeeID);
			return mav;
		}
		return null;
	}
	@RequestMapping(value="/staffRegister", method=RequestMethod.POST, headers = "Content-Type=application/json")
	@ResponseBody
	public Response registerStaff(HttpServletRequest request, HttpServletResponse response, @RequestBody String data){
		JSONObject jsonObj = new JSONObject(data);
		String employeeID=jsonObj.getString("employeeID");
		String username=jsonObj.getString("username");
		String password=jsonObj.getString("password");
		Staff staff=new Staff();
		staff.setEmployeeId(employeeID);
		staff.setUsername(username);
		staff.setPassword(password);
		Response res=new Response();
		try{
			staffService.register(staff);
			res.setSuccess(true);
			res.setMessage("Register Successfully");
		}
		catch(Exception e){
			res.setSuccess(false);
			res.setMessage("Register failure");
		}
		return res;
	}
}
