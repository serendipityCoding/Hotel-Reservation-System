package asgp2.springmvc.controller;

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

import asgp2.springmvc.model.Login;
import asgp2.springmvc.model.Response;
import asgp2.springmvc.model.User;
import asgp2.springmvc.service.UserService;
import asgp2.springmvc.util.DateUtil;

@Controller
public class LoginController {

	@Autowired
	UserService userService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("login");
		mav.addObject("login", new Login());
		return mav;
	}

	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST,headers = "Content-Type=application/json")
	@ResponseBody
	public Response loginProcess(HttpServletRequest request, HttpServletResponse response,
			@RequestBody String data) {
		JSONObject jsonObj = new JSONObject(data);
		Login login=new Login();
		login.setUsername(jsonObj.getString("username"));
		login.setPassword(jsonObj.getString("password"));
		Response res=new Response();
		User user = userService.validateUser(login);

		if (null != user) {
			HttpSession session=request.getSession(true);
			session.setAttribute("user", user);			
			userService.updateLastAccessDate(user.getId(),DateUtil.getCurrentDate());
			res.setSuccess(true);
			res.setMessage("You are logged in");
		} else {
			res.setSuccess(false);
			res.setMessage("Wrong username or password");
		}
		
		return res;
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.POST, headers="Content-Type=application/json")
	@ResponseBody
	public Response logout(HttpServletRequest request, HttpServletResponse response, @RequestBody String data){
		HttpSession session=request.getSession();
		if(session.getAttribute("user")!=null){
			session.removeAttribute("user");
		}
		session.invalidate();
		Response res=new Response();
		res.setSuccess(true);
		res.setMessage("Logged out");
		return res;
	}
}
