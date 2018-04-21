package asgp2.springmvc.service;

import org.springframework.beans.factory.annotation.Autowired;

import asgp2.springmvc.dao.UnregisterUserDao;
import asgp2.springmvc.model.UnregisterUser;

public class UnregisterUserServiceImpl implements UnregisterUserService{
	@Autowired
	public UnregisterUserDao unregisterUserDao;
	
	public void createUnregisterUser(UnregisterUser user){
		 unregisterUserDao.createUnregisterUser(user);
	}
}
