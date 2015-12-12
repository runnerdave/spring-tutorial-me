package com.runnerdave.spring.web.dao;

import java.util.List;

import javax.sql.DataSource;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSourceUtils;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
@Component("offersDao")
public class OffersDao extends BaseDao {

	private NamedParameterJdbcTemplate jdbc;

	public OffersDao() {
		System.out.println("Succesfully loaded Offers DAO");
	}

	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	@SuppressWarnings("unchecked")
	public List<Offer> getOffers() {

		Criteria crit = session().createCriteria(Offer.class);
		crit.createAlias("user", "u").add(Restrictions.eq("u.enabled", true));
		return crit.list();

	}

	@SuppressWarnings("unchecked")
	public List<Offer> getOffersByUsername(String username) {

		Criteria crit = session().createCriteria(Offer.class);
		crit.createAlias("user", "u");
		crit.add(Restrictions.eq("u.enabled", true));
		crit.add(Restrictions.eq("u.username", username));
		return crit.list();
	}

	public void saveOrUpdate(Offer offer) {

		session().saveOrUpdate(offer);
	}

	@Transactional
	public int[] create(List<Offer> offers) {

		SqlParameterSource[] params = SqlParameterSourceUtils.createBatch(offers.toArray());

		return jdbc.batchUpdate("insert into offers (text, username) values (:text, :username)", params);
	}

	public boolean delete(int id) {
		
		Query query = session().createQuery("delete from Offer where id=:id");
		
		query.setLong("id", id);
		return query.executeUpdate() == 1;
	}

	public Offer getOffer(int id) {
		Criteria crit = session().createCriteria(Offer.class);
		crit.createAlias("user", "u");
		crit.add(Restrictions.eq("u.enabled", true));
		crit.add(Restrictions.idEq(id));
		return (Offer) crit.uniqueResult();
	}
}
