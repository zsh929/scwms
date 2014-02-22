package com.sclk.scwms.model;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sclk.scwms.model.ChargeDetail;

/**
 * A data access object (DAO) providing persistence and search support for
 * ChargeDetail entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.sclk.scwms.model.ChargeDetail
 * @author MyEclipse Persistence Tools
 */

public class ChargeDetailDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(ChargeDetailDAO.class);
	// property constants
	public static final String CUSTOMER_ID = "customerId";
	public static final String CHARGE_ID = "chargeId";
	public static final String DESCRIPTION = "description";
	public static final String WEIGHT = "weight";
	public static final String AREA = "area";
	public static final String UNIT_PRICE = "unitPrice";
	public static final String UNIT_NAME = "unitName";
	public static final String TOTAL_PRICE = "totalPrice";
	public static final String PAYABLE = "payable";

	protected void initDao() {
		// do nothing
	}

	public void save(ChargeDetail transientInstance) {
		log.debug("saving ChargeDetail instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(ChargeDetail persistentInstance) {
		log.debug("deleting ChargeDetail instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public ChargeDetail findById(java.lang.Integer id) {
		log.debug("getting ChargeDetail instance with id: " + id);
		try {
			ChargeDetail instance = (ChargeDetail) getHibernateTemplate().get(
					"com.sclk.scwms.model.ChargeDetail", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(ChargeDetail instance) {
		log.debug("finding ChargeDetail instance by example");
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
		log.debug("finding ChargeDetail instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from ChargeDetail as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByCustomerId(Object customerId) {
		return findByProperty(CUSTOMER_ID, customerId);
	}

	public List findByChargeId(Object chargeId) {
		return findByProperty(CHARGE_ID, chargeId);
	}

	public List findByDescription(Object description) {
		return findByProperty(DESCRIPTION, description);
	}

	public List findByWeight(Object weight) {
		return findByProperty(WEIGHT, weight);
	}

	public List findByArea(Object area) {
		return findByProperty(AREA, area);
	}

	public List findByUnitPrice(Object unitPrice) {
		return findByProperty(UNIT_PRICE, unitPrice);
	}

	public List findByUnitName(Object unitName) {
		return findByProperty(UNIT_NAME, unitName);
	}

	public List findByTotalPrice(Object totalPrice) {
		return findByProperty(TOTAL_PRICE, totalPrice);
	}

	public List findByPayable(Object payable) {
		return findByProperty(PAYABLE, payable);
	}

	public List findAll() {
		log.debug("finding all ChargeDetail instances");
		try {
			String queryString = "from ChargeDetail";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public ChargeDetail merge(ChargeDetail detachedInstance) {
		log.debug("merging ChargeDetail instance");
		try {
			ChargeDetail result = (ChargeDetail) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(ChargeDetail instance) {
		log.debug("attaching dirty ChargeDetail instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(ChargeDetail instance) {
		log.debug("attaching clean ChargeDetail instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ChargeDetailDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (ChargeDetailDAO) ctx.getBean("ChargeDetailDAO");
	}
}