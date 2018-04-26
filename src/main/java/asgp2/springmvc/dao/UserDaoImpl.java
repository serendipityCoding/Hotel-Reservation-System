package asgp2.springmvc.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import asgp2.springmvc.model.Login;
import asgp2.springmvc.model.User;

public class UserDaoImpl implements UserDao {

	@Autowired
	DataSource datasource;

	@Autowired
	JdbcTemplate jdbcTemplate;

	public List<User> getAllUser() {
		String sql = "select * from user";

		List<User> users = jdbcTemplate.query(sql, new UserMapper());

		return users.size() > 0 ? users : null;
	}

	public void register(User user) {

		String sql = "insert into user values(?,?,?,?,?,?,?,?,?,?)";
		
		jdbcTemplate.update(sql,
				new Object[] { user.getId(), user.getUsername(), user.getPassword(), user.getEmail(), user.getFirstname(),
						user.getLastname(), user.getPhone(), user.getAddress(), user.getCreateDate(),user.getCreateDate()});

	}

	public void updateLastAccessDate(String id, String lastAccessDate) {
		String sql = "update user set lastAccessDate = '" + lastAccessDate + "' where id = '" + id + "'";
		jdbcTemplate.update(sql);
	}

	public User validateUser(Login login) {

		String sql = "select * from user where username='" + login.getUsername() + "' and password='"
				+ login.getPassword() + "'";

		List<User> users = jdbcTemplate.query(sql, new UserMapper());

		return users.size() > 0 ? users.get(0) : null;
	}

	public boolean emailDuplication(User user) {
		String sql = "select * from user where email='" + user.getEmail() + "'";
		List<User> users = jdbcTemplate.query(sql, new UserMapper());
		if (users.size() > 0)
			return true;
		else
			return false;
	}
}

class UserMapper implements RowMapper<User> {

	public User mapRow(ResultSet rs, int arg1) throws SQLException {
		User user = new User();
		user.setId(rs.getString("id"));
		user.setUsername(rs.getString("username"));
		user.setPassword(rs.getString("password"));
		user.setFirstname(rs.getString("firstname"));
		user.setLastname(rs.getString("lastname"));
		user.setEmail(rs.getString("email"));
		user.setAddress(rs.getString("address"));
		user.setPhone(rs.getString("phone"));

		return user;
	}
}