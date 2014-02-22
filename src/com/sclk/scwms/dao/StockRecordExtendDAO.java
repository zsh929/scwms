package com.sclk.scwms.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sclk.scwms.model.StockRecordExtend;

/**
 * A data access object (DAO) providing persistence and search support for
 * StockRecordExtend entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.sclk.scwms.model.StockRecordExtend
 * @author MyEclipse Persistence Tools
 */

public class StockRecordExtendDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory
			.getLog(StockRecordExtendDAO.class);
	// property constants
	public static final String COMPANY = "company";
	public static final String OPERATOR = "operator";
	public static final String FREIGHT = "freight";

	protected void initDao() {
		// do nothing
	}

	public void save(StockRecordExtend transientInstance) {
		log.debug("saving StockRecordExtend instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(StockRecordExtend persistentInstance) {
		log.debug("deleting StockRecordExtend instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public StockRecordExtend findById(java.lang.Integer id) {
		log.debug("getting StockRecordExtend instance with id: " + id);
		try {
			StockRecordExtend instance = (StockRecordExtend) getHibernateTemplate()
					.get("com.sclk.scwms.model.StockRecordExtend", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(StockRecordExtend instance) {
		log.debug("finding StockRecordExtend instance by example");
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
		log.debug("finding StockRecordExtend instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from StockRecordExtend as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByCompany(Object company) {
		return findByProperty(COMPANY, company);
	}

	public List findByOperator(Object operator) {
		return findByProperty(OPERATOR, operator);
	}

	public List findByFreight(Object freight) {
		return findByProperty(FREIGHT, freight);
	}

	public List findAll() {
		log.debug("finding all StockRecordExtend instances");
		try {
			String queryString = "from StockRecordExtend";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public StockRecordExtend merge(StockRecordExtend detachedInstance) {
		log.debug("merging StockRecordExtend instance");
		try {
			StockRecordExtend result = (StockRecordExtend) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(StockRecordExtend instance) {
		log.debug("attaching dirty StockRecordExtend instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(StockRecordExtend instance) {
		log.debug("attaching clean StockRecordExtend instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static StockRecordExtendDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (StockRecordExtendDAO) ctx.getBean("StockRecordExtendDAO");
	}
}