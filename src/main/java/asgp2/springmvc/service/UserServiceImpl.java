package asgp2.springmvc.service;

import org.springframework.beans.factory.annotation.Autowired;

import asgp2.springmvc.dao.UserDao;
import asgp2.springmvc.model.Login;
import asgp2.springmvc.model.User;

public class UserServiceImpl implements UserService {

	@Autowired
	public UserDao userDao;

	public void register(User user) {
		userDao.register(user);
	}

	public void updateLastAccessDate(int id, String lastAccessDate) {
		userDao.updateLastAccessDate(id, lastAccessDate);
	}

	public User validateUser(Login login) {
		return userDao.validateUser(login);
	}

	public boolean emailDuplication(User user) {
		return userDao.emailDuplication(user);
	}
}
