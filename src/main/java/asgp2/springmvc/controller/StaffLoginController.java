package asgp2.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import asgp2.springmvc.model.Staff;
import asgp2.springmvc.model.StaffLogin;
import asgp2.springmvc.service.StaffService;
import asgp2.springmvc.util.DateUtil;

@Controller
public class StaffLoginController {
	
	@Autowired
	StaffService staffService;
	
	@RequestMapping(value = "/staffLogin", method = RequestMethod.GET)
	public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=null;
		if(request.getSession()!=null){
			HttpSession session=request.getSession();
			if(session.getAttribute("staff")!=null){
				mav=new ModelAndView("welcomeStaff");
				return mav;
			}
		}
		mav = new ModelAndView("staffLogin");
		mav.addObject("staffLogin", new StaffLogin());
		return mav;
	}
	
	@RequestMapping(value = "/staffLoginProcess", method = RequestMethod.POST)
	public ModelAndView loginProcess(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("staffLogin") StaffLogin staffLogin) {
		ModelAndView mav = null;
		Staff staff = staffService.validateUser(staffLogin);
		if (null != staff) {
			HttpSession session=request.getSession(true);
			session.setAttribute("staff", staff);			
			staffService.updateLastAccessDate(staff.getId(),DateUtil.getCurrentDate());
			mav = new ModelAndView("welcomeStaff");
		} else {
			mav = new ModelAndView("staffLogin");
			mav.addObject("message", "Username or Password is wrong!!");
		}
		return mav;
	}
}
