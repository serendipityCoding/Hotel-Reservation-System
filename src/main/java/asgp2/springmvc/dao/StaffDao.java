package asgp2.springmvc.dao;

import java.util.List;

import asgp2.springmvc.model.Staff;
import asgp2.springmvc.model.StaffLogin;

public interface StaffDao {
	void register(Staff staff);
	void updateLastAccessDate(int id, String lastAccessDate);
	void updateActiveStatus(int id, int isActive);
	Staff validateUser(StaffLogin staffLogin);
	boolean emailDuplication(Staff staff);
	List<Staff> getAllStaff();
}
