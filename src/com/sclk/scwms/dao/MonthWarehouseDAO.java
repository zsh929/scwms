package com.sclk.scwms.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sclk.scwms.model.MonthWarehouse;

/**
 * A data access object (DAO) providing persistence and search support for
 * MonthWarehouse entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.sclk.scwms.model.MonthWarehouse
 * @author MyEclipse Persistence Tools
 */

public class MonthWarehouseDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(MonthWarehouseDAO.class);
	// property constants
	public static final String MONTH_TOTAL_ID = "monthTotalId";
	public static final String WAREHOUSE_ID = "warehouseId";
	public static final String QUANTITY = "quantity";
	public static final String WEIGHT = "weight";

	protected void initDao() {
		// do nothing
	}

	public void save(MonthWarehouse transientInstance) {
		log.debug("saving MonthWarehouse instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(MonthWarehouse persistentInstance) {
		log.debug("deleting MonthWarehouse instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public MonthWarehouse findById(java.lang.Integer id) {
		log.debug("getting MonthWarehouse instance with id: " + id);
		try {
			MonthWarehouse instance = (MonthWarehouse) getHibernateTemplate()
					.get("com.sclk.scwms.model.MonthWarehouse", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(MonthWarehouse instance) {
		log.debug("finding MonthWarehouse instance by example");
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
		log.debug("finding MonthWarehouse instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from MonthWarehouse as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByMonthTotalId(Object monthTotalId) {
		return findByProperty(MONTH_TOTAL_ID, monthTotalId);
	}

	public List findByWarehouseId(Object warehouseId) {
		return findByProperty(WAREHOUSE_ID, warehouseId);
	}

	public List findByQuantity(Object quantity) {
		return findByProperty(QUANTITY, quantity);
	}

	public List findByWeight(Object weight) {
		return findByProperty(WEIGHT, weight);
	}

	public List findAll() {
		log.debug("finding all MonthWarehouse instances");
		try {
			String queryString = "from MonthWarehouse";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public MonthWarehouse merge(MonthWarehouse detachedInstance) {
		log.debug("merging MonthWarehouse instance");
		try {
			MonthWarehouse result = (MonthWarehouse) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(MonthWarehouse instance) {
		log.debug("attaching dirty MonthWarehouse instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(MonthWarehouse instance) {
		log.debug("attaching clean MonthWarehouse instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static MonthWarehouseDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (MonthWarehouseDAO) ctx.getBean("MonthWarehouseDAO");
	}
}