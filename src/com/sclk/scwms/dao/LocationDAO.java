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

import com.sclk.scwms.model.Location;
import com.sclk.scwms.vo.CargoVO;

/**
 * A data access object (DAO) providing persistence and search support for
 * Location entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.sclk.scwms.model.Location
 * @author MyEclipse Persistence Tools
 */

public class LocationDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(LocationDAO.class);
	// property constants
	public static final String ZONE_ID = "zoneId";
	public static final String RACK_ID = "rackId";
	public static final String STOREY_ID = "storeyId";
	public static final String POSITION_ID = "positionId";
	public static final String TYPE = "type";
	public static final String WAREHOUSE_ID = "warehouseId";

	protected void initDao() {
		// do nothing
	}

	public void save(Location transientInstance) {
		log.debug("saving Location instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Location persistentInstance) {
		log.debug("deleting Location instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Location findById(java.lang.Integer id) {
		log.debug("getting Location instance with id: " + id);
		try {
			Location instance = (Location) getHibernateTemplate().get(
					"com.sclk.scwms.model.Location", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	
	
	
	
	
	public List findByExample(Location instance) {
		log.debug("finding Location instance by example");
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
		log.debug("finding Location instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Location as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByZoneId(Object zoneId) {
		return findByProperty(ZONE_ID, zoneId);
	}

	public List findByRackId(Object rackId) {
		return findByProperty(RACK_ID, rackId);
	}

	public List findByStoreyId(Object storeyId) {
		return findByProperty(STOREY_ID, storeyId);
	}

	public List findByPositionId(Object positionId) {
		return findByProperty(POSITION_ID, positionId);
	}

	public List findByType(Object type) {
		return findByProperty(TYPE, type);
	}

	public List findByWarehouseId(Object warehouseId) {
		return findByProperty(WAREHOUSE_ID, warehouseId);
	}

	public List findAll() {
		log.debug("finding all Location instances");
		try {
			String queryString = "from Location";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Location merge(Location detachedInstance) {
		log.debug("merging Location instance");
		try {
			Location result = (Location) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Location instance) {
		log.debug("attaching dirty Location instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Location instance) {
		log.debug("attaching clean Location instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static LocationDAO getFromApplicationContext(ApplicationContext ctx) {
		return (LocationDAO) ctx.getBean("LocationDAO");
	}
}