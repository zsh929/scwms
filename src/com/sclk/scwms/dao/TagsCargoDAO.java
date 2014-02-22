package com.sclk.scwms.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sclk.scwms.model.TagsCargo;
import com.sclk.scwms.vo.CargoVO;

/**
 * A data access object (DAO) providing persistence and search support for
 * TagsCargo entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.sclk.scwms.model.TagsCargo
 * @author MyEclipse Persistence Tools
 */

public class TagsCargoDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(TagsCargoDAO.class);
	// property constants
	public static final String TAGS_ID = "tagsId";
	public static final String CARGO_ID = "cargoId";

	protected void initDao() {
		// do nothing
	}

	public void save(TagsCargo transientInstance) {
		log.debug("saving TagsCargo instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TagsCargo persistentInstance) {
		log.debug("deleting TagsCargo instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TagsCargo findById(java.lang.Integer id) {
		log.debug("getting TagsCargo instance with id: " + id);
		try {
			TagsCargo instance = (TagsCargo) getHibernateTemplate().get(
					"com.sclk.scwms.model.TagsCargo", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TagsCargo instance) {
		log.debug("finding TagsCargo instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding TagsCargo instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from TagsCargo as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByTagsId(Object tagsId) {
		return findByProperty(TAGS_ID, tagsId);
	}

	public List findByCargoId(Object cargoId) {
		return findByProperty(CARGO_ID, cargoId);
	}

	public List findAll() {
		log.debug("finding all TagsCargo instances");
		try {
			String queryString = "from TagsCargo";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TagsCargo merge(TagsCargo detachedInstance) {
		log.debug("merging TagsCargo instance");
		try {
			TagsCargo result = (TagsCargo) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TagsCargo instance) {
		log.debug("attaching dirty TagsCargo instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TagsCargo instance) {
		log.debug("attaching clean TagsCargo instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TagsCargoDAO getFromApplicationContext(ApplicationContext ctx) {
		return (TagsCargoDAO) ctx.getBean("TagsCargoDAO");
	}
	
	public String[][] getTagsByCustomerId(String customerId){
		
		String[][] s = null;
		String sql = "SELECT DISTINCT " +
					 	"t.ID," +
					 	"t.NAME " +
					 "from " +
					 	"tags t," +
					 	"tags_cargo tc," +
					 	"cargo c " +
					 "where " +
					 	"t.id = tc.tags_id " +
					 	"and " +
					 	"tc.cargo_id = c.id " +
					 	"and " +
					 	"c.customer_id = :customerId";
		
		Session session = null ;
		
		try{
			session = this.getSession();
			Query query = session.createSQLQuery(sql);
							
			if(customerId != null){
				query.setParameter("customerId",customerId);
				
				List result =query.list();
				
				
				s = new String [result.size()][2];
				for(int i = 0;i < result.size();i++){
					Object[] row = (Object[])result.get(i);
					s[i][0] = ((Integer)row[0]).toString();
					s[i][1] = (String) row[1];
				}
			}
		
		}finally{
			session.close(); 
		}
		return s;
		
		
	}
}