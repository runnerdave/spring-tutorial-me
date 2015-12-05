package com.runnerdave.spring.web.test.tests;

import static org.junit.Assert.*;

import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.runnerdave.spring.web.dao.User;
import com.runnerdave.spring.web.dao.UsersDao;

@ActiveProfiles("dev")
@ContextConfiguration(locations = { "classpath:com/runnerdave/spring/web/test/config/datasource.xml",
		"classpath:com/runnerdave/spring/web/config/security-context.xml",
		"classpath:com/runnerdave/spring/web/config/dao-context.xml" })
@RunWith(SpringJUnit4ClassRunner.class)
public class UserDaoTests {
	
	@Autowired
	private UsersDao userDao;
	
	@Autowired
	private DataSource dataSource;
	
	@Before
	public void init() {
		JdbcTemplate jdbc = new JdbcTemplate(dataSource);
		jdbc.execute("delete from users");
		jdbc.execute("delete from authorities");
	}
	
	@Test
	public void testCreateUser(){
		User user = new User("johnwpurce", "hellothere", "john@kkk.com", true, "user");
		
		assertTrue("User creation should return true", userDao.create(user));
	}
}
