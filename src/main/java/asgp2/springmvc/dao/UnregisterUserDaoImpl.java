package asgp2.springmvc.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import asgp2.springmvc.model.UnregisterUser;

public class UnregisterUserDaoImpl implements UnregisterUserDao{
	@Autowired
	DataSource datasource;

	@Autowired
	JdbcTemplate jdbcTemplate;

	public void createUnregisterUser(UnregisterUser user){
		String sql = "insert into unregisterUser values(?,?,?,?,?)";

		jdbcTemplate.update(sql,
				new Object[] { user.getId(), user.getEmail(), user.getName(),user.getPhone(), user.getCreateDate()});

	}
}
