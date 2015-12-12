package com.runnerdave.spring.web.test.tests;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.List;

import javax.sql.DataSource;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.runnerdave.spring.web.dao.Offer;
import com.runnerdave.spring.web.dao.OffersDao;
import com.runnerdave.spring.web.dao.User;
import com.runnerdave.spring.web.dao.UsersDao;

@ActiveProfiles("dev")
@ContextConfiguration(locations = { "classpath:com/runnerdave/spring/web/test/config/datasource.xml",
		"classpath:com/runnerdave/spring/web/config/security-context.xml",
		"classpath:com/runnerdave/spring/web/config/dao-context.xml" })
@RunWith(SpringJUnit4ClassRunner.class)
public class OfferDaoTests {

	@Autowired
	private OffersDao offersDao;

	@Autowired
	private UsersDao userDao;

	@Autowired
	private DataSource dataSource;

	@Before
	public void init() {
		JdbcTemplate jdbc = new JdbcTemplate(dataSource);

		jdbc.execute("delete from offers");
		jdbc.execute("delete from users");
	}

	@Test
	public void testCreateOffer() {

		User user = new User("johnwpurce", "nombrecito", "hellothere", "john@kkk.com", true, "user");

		userDao.create(user);

		Offer offer = new Offer(user, "This is a test offer.");

		assertTrue("Offer creation should return true", offersDao.create(offer));

		List<Offer> offers = offersDao.getOffers();

		assertEquals("Should be one offer in database.", 1, offers.size());

		assertEquals("Retrieved offer should match created offer.", offer, offers.get(0));

		// Get the offer with ID filled in.
		offer = offers.get(0);

		offer.setText("Updated offer text.");
		assertTrue("Offer update should return true", offersDao.update(offer));

		Offer updated = offersDao.getOffer(offer.getId());

		assertEquals("Updated offer should match retrieved updated offer", offer, updated);

		offersDao.delete(offer.getId());

		List<Offer> empty = offersDao.getOffers();

		assertEquals("Offers lists should be empty.", 0, empty.size());
	}
	
	@Test
	public void testGetOffersByUsername() {
		User user = new User("johnwpurce", "nombresote", "hellothere", "john@kkk.com", true, "user");

		userDao.create(user);

		Offer offer1 = new Offer(user, "This is a test offer.");

		assertTrue("Offer creation should return true", offersDao.create(offer1));
		
		Offer offer2 = new Offer(user, "This is a test offer 2.");

		assertTrue("Offer creation should return true", offersDao.create(offer2));
		
		List<Offer> offersByUsername = offersDao.getOffersByUsername(user.getUsername());

		assertTrue("Offers lists should not be empty.", offersByUsername.size() == 2);
	}
	
	@After
	public void cleanup() {
		JdbcTemplate jdbc = new JdbcTemplate(dataSource);
		jdbc.execute("delete from offers");
		jdbc.execute("delete from users");
		
	}

}
