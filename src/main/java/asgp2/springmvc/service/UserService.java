package asgp2.springmvc.service;

import java.util.List;

import asgp2.springmvc.model.Login;
import asgp2.springmvc.model.User;

public interface UserService {

	void register(User user);

	void updateLastAccessDate(int id, String lastAccessDate);

	User validateUser(Login login);

	boolean emailDuplication(User user);

	List<User> getAllUser();
}
