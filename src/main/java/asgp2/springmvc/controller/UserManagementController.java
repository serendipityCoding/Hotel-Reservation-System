package asgp2.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import asgp2.springmvc.model.User;
import asgp2.springmvc.service.UserService;

@Controller
public class UserManagementController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("userList");
		List<User> users=userService.getAllUser();
		mav.addObject("userList", users);
		return mav;
	}
}
