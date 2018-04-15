package asgp2.springmvc.dao;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.sql.DataSource;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import asgp2.springmvc.model.Login;
import asgp2.springmvc.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import asgp2.springmvc.model.Staff;
import asgp2.springmvc.model.StaffLogin;

public class StaffDaoImpl implements StaffDao{

	@Autowired
	DataSource datasource;

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public List<Staff> getAllStaff(){
		String sql = "select * from Staff where role=2";

		List<Staff> staff = jdbcTemplate.query(sql, new StaffMapper());

		return staff.size() > 0 ? staff : null;
	}
	public void register(Staff staff) {

		String sql = "insert into Staff values(NULL,?,?,?,?,?,?,?,?,?,?)";

		jdbcTemplate.update(sql, new Object[] { staff.getName(), staff.getUsername(), staff.getPassword(), staff.getEmail(), staff.getRole(),
				staff.getCreateDate(), null, staff.getIsActive(), staff.getCreateById(), staff.getCreateByName() });
	}
	
	public void updateLastAccessDate(int id, String lastAccessDate){
		String sql="update Staff set `lastAccessDate` = '"+lastAccessDate+"' where `id` = '"+id+"'";
		jdbcTemplate.update(sql);
	}
	
	public void updateActiveStatus(int id, int isActive){
		String sql="update Staff set `isActive` = '"+isActive+"' where `id` = '"+id+"'";
		jdbcTemplate.update(sql);
	}
	
	public Staff validateUser(StaffLogin staffLogin) {

		String sql = "select * from Staff where `username`='" + staffLogin.getUsername() + "' and `password`='"
				+ staffLogin.getPassword() + "' and `role`='"+staffLogin.getRole()+"'";

		List<Staff> staff = jdbcTemplate.query(sql, new StaffMapper());

		return staff.size() > 0 ? staff.get(0) : null;
	}
	
	public boolean emailDuplication(Staff staff){
		String sql= "select * from Staff where `email`='"+staff.getEmail()+"'";
		List<Staff> staffs=jdbcTemplate.query(sql, new StaffMapper());
		if(staffs.size()>0) return true;
		else return false;
	}
}
class StaffMapper implements RowMapper<Staff> {

	public Staff mapRow(ResultSet rs, int arg1) throws SQLException {
		Staff staff = new Staff();
		staff.setId(rs.getInt("id"));
		staff.setName(rs.getString("name"));
		staff.setUsername(rs.getString("username"));
		staff.setPassword(rs.getString("password"));
		staff.setEmail(rs.getString("email"));
		staff.setRole(rs.getInt("role"));
		staff.setCreateDate(rs.getString("createDate"));
		staff.setLastAccessDate(rs.getString("lastAccessDate"));
		staff.setIsActive(rs.getInt("isActive"));
		staff.setCreateById(rs.getInt("createById"));
		staff.setCreateByName(rs.getString("createByName"));
		
		return staff;
	}
}
