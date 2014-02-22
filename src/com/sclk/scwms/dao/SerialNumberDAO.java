package com.sclk.scwms.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sclk.scwms.model.SerialNumber;

/**
 * A data access object (DAO) providing persistence and search support for
 * SerialNumber entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.sclk.scwms.model.SerialNumber
 * @author MyEclipse Persistence Tools
 */

public class SerialNumberDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(SerialNumberDAO.class);
	// property constants
	public static final String SERIAL_NUMBER = "serialNumber";

	protected void initDao() {
		// do nothing
	}

	public void save(SerialNumber transientInstance) {
		log.debug("saving SerialNumber instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(SerialNumber persistentInstance) {
		log.debug("deleting SerialNumber instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public SerialNumber findById(java.lang.Integer id) {
		log.debug("getting SerialNumber instance with id: " + id);
		try {
			SerialNumber instance = (SerialNumber) getHibernateTemplate().get(
					"com.sclk.scwms.model.SerialNumber", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(SerialNumber instance) {
		log.debug("finding SerialNumber instance by example");
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
		log.debug("finding SerialNumber instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from SerialNumber as model where model."
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

	public List findAll() {
		log.debug("finding all SerialNumber instances");
		try {
			String queryString = "from SerialNumber";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public SerialNumber merge(SerialNumber detachedInstance) {
		log.debug("merging SerialNumber instance");
		try {
			SerialNumber result = (SerialNumber) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(SerialNumber instance) {
		log.debug("attaching dirty SerialNumber instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(SerialNumber instance) {
		log.debug("attaching clean SerialNumber instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static SerialNumberDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (SerialNumberDAO) ctx.getBean("SerialNumberDAO");
	}
}