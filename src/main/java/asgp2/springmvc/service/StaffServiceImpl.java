package asgp2.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import asgp2.springmvc.dao.StaffDao;
import asgp2.springmvc.model.Staff;
import asgp2.springmvc.model.StaffLogin;

public class StaffServiceImpl implements StaffService {

	@Autowired
	public StaffDao staffDao;
	@Override
	public void register(Staff staff) {
		staffDao.register(staff);
	}

	@Override
	public void updateLastAccessDate(int id, String lastAccessDate) {
		staffDao.updateLastAccessDate(id, lastAccessDate);
	}

	@Override
	public void updateActiveStatus(int id, int isActive) {
		staffDao.updateActiveStatus(id,isActive);
	}

	@Override
	public Staff validateUser(StaffLogin staffLogin) {
		return staffDao.validateUser(staffLogin);
	}

	@Override
	public boolean emailDuplication(Staff staff) {
		return staffDao.emailDuplication(staff);
	}

	@Override
	public List<Staff> getAllStaff() {
		return staffDao.getAllStaff();
	}
}
