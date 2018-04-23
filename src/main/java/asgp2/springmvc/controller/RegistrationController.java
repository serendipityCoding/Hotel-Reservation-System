package asgp2.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import asgp2.springmvc.model.User;
import asgp2.springmvc.model.Login;
import asgp2.springmvc.model.Response;
import asgp2.springmvc.service.UserService;
import asgp2.springmvc.util.DateUtil;
import asgp2.springmvc.util.TokenUtil;

@Controller
public class RegistrationController {
	@Autowired
	public UserService userService;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView showRegister(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("register");
		mav.addObject("user", new User());
		mav.addObject("login",new Login());
		return mav;
	}

	@RequestMapping(value = "/registerProcess", method = RequestMethod.POST)
	public ModelAndView addUser(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("user") User user) {

		if(userService.emailDuplication(user)==false){
			user.setCreateDate(DateUtil.getCurrentDate());
			userService.register(user);
			return new ModelAndView("search");
		}
		else{
			return null;
		}		
	}
	@RequestMapping(value="/registerMini",method = RequestMethod.POST,headers = "Content-Type=application/json")
	@ResponseBody
	public Response registerUserAjax(HttpServletRequest request, HttpServletResponse response,@RequestBody User user){
		Response res=new Response();
		if(userService.emailDuplication(user)==false){
			user.setId(TokenUtil.generateID());
			user.setCreateDate(DateUtil.getCurrentDate());
			userService.register(user);
			HttpSession session=request.getSession();
			session.setAttribute("user", user);
			userService.updateLastAccessDate(user.getId(),DateUtil.getCurrentDate());
			res.setSuccess(true);
			res.setMessage("Register successfully");
		}
		else{
			res.setSuccess(false);
			res.setMessage("You have registered before!");
		}
		return res;
	}
}
