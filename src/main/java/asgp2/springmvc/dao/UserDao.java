package asgp2.springmvc.dao;

import java.util.List;

import asgp2.springmvc.model.Login;
import asgp2.springmvc.model.User;

public interface UserDao {

	void register(User user);

	void updateLastAccessDate(String id, String lastAccessDate);

	User validateUser(Login login);

	boolean emailDuplication(User user);
	
	List<User> getAllUser();
}
