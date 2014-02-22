package com.sclk.scwms.dao;

import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sclk.scwms.model.Contract;

/**
 * A data access object (DAO) providing persistence and search support for
 * Contract entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.sclk.scwms.model.Contract
 * @author MyEclipse Persistence Tools
 */

public class ContractDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(ContractDAO.class);
	// property constants
	public static final String SERIAL_NUMBER = "serialNumber";
	public static final String CUSTOMER_NAME = "customerName";
	public static final String STATUS = "status";
	public static final String VALIDITY = "validity";
	public static final String COMMENT = "comment";
	public static final String TYPE = "type";
	public static final String CREATE_USER = "createUser";
	public static final String NAME = "name";

	protected void initDao() {
		// do nothing
	}

	public void save(Contract transientInstance) {
		log.debug("saving Contract instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Contract persistentInstance) {
		log.debug("deleting Contract instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Contract findById(java.lang.Integer id) {
		log.debug("getting Contract instance with id: " + id);
		try {
			Contract instance = (Contract) getHibernateTemplate().get(
					"com.sclk.scwms.model.Contract", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Contract instance) {
		log.debug("finding Contract instance by example");
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
		log.debug("finding Contract instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Contract as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findBySerialNumber(Object serialNumber) {
		return findByProperty(SERIAL_NUMBER, serialNumber);
	}

	public List findByCustomerName(Object customerName) {
		return findByProperty(CUSTOMER_NAME, customerName);
	}

	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List findByValidity(Object validity) {
		return findByProperty(VALIDITY, validity);
	}

	public List findByComment(Object comment) {
		return findByProperty(COMMENT, comment);
	}

	public List findByType(Object type) {
		return findByProperty(TYPE, type);
	}

	public List findByCreateUser(Object createUser) {
		return findByProperty(CREATE_USER, createUser);
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findAll() {
		log.debug("finding all Contract instances");
		try {
			String queryString = "from Contract";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Contract merge(Contract detachedInstance) {
		log.debug("merging Contract instance");
		try {
			Contract result = (Contract) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Contract instance) {
		log.debug("attaching dirty Contract instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Contract instance) {
		log.debug("attaching clean Contract instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ContractDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ContractDAO) ctx.getBean("ContractDAO");
	}
}