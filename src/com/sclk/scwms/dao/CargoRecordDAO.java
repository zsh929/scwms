package com.sclk.scwms.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sclk.scwms.model.CargoRecord;

/**
 * A data access object (DAO) providing persistence and search support for
 * CargoRecord entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.sclk.scwms.model.CargoRecord
 * @author MyEclipse Persistence Tools
 */

public class CargoRecordDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(CargoRecordDAO.class);
	// property constants
	public static final String CARGO_ID = "cargoId";
	public static final String QUANTITY = "quantity";
	public static final String TOTAL_WEIGHT = "totalWeight";

	protected void initDao() {
		// do nothing
	}

	public void save(CargoRecord transientInstance) {
		log.debug("saving CargoRecord instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(CargoRecord persistentInstance) {
		log.debug("deleting CargoRecord instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public CargoRecord findById(java.lang.Integer id) {
		log.debug("getting CargoRecord instance with id: " + id);
		try {
			CargoRecord instance = (CargoRecord) getHibernateTemplate().get(
					"com.sclk.scwms.model.CargoRecord", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(CargoRecord instance) {
		log.debug("finding CargoRecord instance by example");
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
		log.debug("finding CargoRecord instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from CargoRecord as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByCargoId(Object cargoId) {
		return findByProperty(CARGO_ID, cargoId);
	}

	public List findByQuantity(Object quantity) {
		return findByProperty(QUANTITY, quantity);
	}

	public List findByTotalWeight(Object totalWeight) {
		return findByProperty(TOTAL_WEIGHT, totalWeight);
	}

	public List findAll() {
		log.debug("finding all CargoRecord instances");
		try {
			String queryString = "from CargoRecord";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public CargoRecord merge(CargoRecord detachedInstance) {
		log.debug("merging CargoRecord instance");
		try {
			CargoRecord result = (CargoRecord) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(CargoRecord instance) {
		log.debug("attaching dirty CargoRecord instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(CargoRecord instance) {
		log.debug("attaching clean CargoRecord instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static CargoRecordDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (CargoRecordDAO) ctx.getBean("CargoRecordDAO");
	}
}