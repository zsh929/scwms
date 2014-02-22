package com.sclk.scwms.model;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sclk.scwms.model.MonthTotal;

/**
 * A data access object (DAO) providing persistence and search support for
 * MonthTotal entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.sclk.scwms.model.MonthTotal
 * @author MyEclipse Persistence Tools
 */

public class MonthTotalDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(MonthTotalDAO.class);
	// property constants
	public static final String IN_QUANTITY = "inQuantity";
	public static final String IN_WEIGHT = "inWeight";
	public static final String OUT_QUANTITY = "outQuantity";
	public static final String OUT_WEIGHT = "outWeight";
	public static final String BALANCE_QUANTITY = "balanceQuantity";
	public static final String BALANCE_WEIGHT = "balanceWeight";

	protected void initDao() {
		// do nothing
	}

	public void save(MonthTotal transientInstance) {
		log.debug("saving MonthTotal instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(MonthTotal persistentInstance) {
		log.debug("deleting MonthTotal instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public MonthTotal findById(java.lang.Integer id) {
		log.debug("getting MonthTotal instance with id: " + id);
		try {
			MonthTotal instance = (MonthTotal) getHibernateTemplate().get(
					"com.sclk.scwms.model.MonthTotal", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(MonthTotal instance) {
		log.debug("finding MonthTotal instance by example");
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
		log.debug("finding MonthTotal instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from MonthTotal as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByInQuantity(Object inQuantity) {
		return findByProperty(IN_QUANTITY, inQuantity);
	}

	public List findByInWeight(Object inWeight) {
		return findByProperty(IN_WEIGHT, inWeight);
	}

	public List findByOutQuantity(Object outQuantity) {
		return findByProperty(OUT_QUANTITY, outQuantity);
	}

	public List findByOutWeight(Object outWeight) {
		return findByProperty(OUT_WEIGHT, outWeight);
	}

	public List findByBalanceQuantity(Object balanceQuantity) {
		return findByProperty(BALANCE_QUANTITY, balanceQuantity);
	}

	public List findByBalanceWeight(Object balanceWeight) {
		return findByProperty(BALANCE_WEIGHT, balanceWeight);
	}

	public List findAll() {
		log.debug("finding all MonthTotal instances");
		try {
			String queryString = "from MonthTotal";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public MonthTotal merge(MonthTotal detachedInstance) {
		log.debug("merging MonthTotal instance");
		try {
			MonthTotal result = (MonthTotal) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(MonthTotal instance) {
		log.debug("attaching dirty MonthTotal instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(MonthTotal instance) {
		log.debug("attaching clean MonthTotal instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static MonthTotalDAO getFromApplicationContext(ApplicationContext ctx) {
		return (MonthTotalDAO) ctx.getBean("MonthTotalDAO");
	}
}