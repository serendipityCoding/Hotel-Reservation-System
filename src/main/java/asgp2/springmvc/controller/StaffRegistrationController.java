package asgp2.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import asgp2.springmvc.model.Login;
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
			return mav;
		}
		return null;
	}
}
