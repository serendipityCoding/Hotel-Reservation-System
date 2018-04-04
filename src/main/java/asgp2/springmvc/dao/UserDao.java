package asgp2.springmvc.dao;

import asgp2.springmvc.model.Login;
import asgp2.springmvc.model.User;

public interface UserDao {

	void register(User user);

	void updateLastAccessDate(int id, String lastAccessDate);

	User validateUser(Login login);

	boolean emailDuplication(User user);
}