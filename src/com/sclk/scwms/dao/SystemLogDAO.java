package com.sclk.scwms.dao;

import java.sql.Time;
import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.LockMode;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sclk.scwms.model.StockRecord;
import com.sclk.scwms.model.SystemLog;

/**
 * A data access object (DAO) providing persistence and search support for
 * SystemLog entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.sclk.scwms.model.SystemLog
 * @author MyEclipse Persistence Tools
 */
public class SystemLogDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(SystemLogDAO.class);
	// property constants
	public static final String USER_NAME = "userName";
	public static final String TYPE = "type";
	public static final String LOGIN_ADDRESS = "loginAddress";
	public static final String OPERATION_CONTENT = "operationContent";
	public static final String SESSION_ID = "sessionId";

	protected void initDao() {
		// do nothing
	}

	public void save(SystemLog transientInstance) {
		log.debug("saving SystemLog instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(SystemLog persistentInstance) {
		log.debug("deleting SystemLog instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public SystemLog findById(java.lang.Integer id) {
		log.debug("getting SystemLog instance with id: " + id);
		try {
			SystemLog instance = (SystemLog) getHibernateTemplate().get(
					"com.sclk.scwms.model.SystemLog", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(SystemLog instance) {
		log.debug("finding SystemLog instance by example");
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

	public List findBystartDate_endDate_type(Date startDate,Date endDate,String type) {
		log.debug("finding SystemLog instance by example");
		try {
			
			 DetachedCriteria  criteria = DetachedCriteria.forClass(SystemLog.class);
	    	 if(startDate != null){
	    		 criteria.add(Restrictions.ge("operationTime", startDate));
	    	 }
	    	 if(endDate != null){
	    		 criteria.add(Restrictions.le("operationTime", endDate));
	    	 }
	    	 if(type != null){
	    		 criteria.add(Restrictions.eq("type", type));
	    	 }  
	    	 
	    	 criteria.addOrder(Order.asc("operationTime") );
			
			List results = getHibernateTemplate().findByCriteria(criteria);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
	
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding SystemLog instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from SystemLog as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUserName(Object userName) {
		return findByProperty(USER_NAME, userName);
	}

	public List findByType(Object type) {
		return findByProperty(TYPE, type);
	}

	public List findByLoginAddress(Object loginAddress) {
		return findByProperty(LOGIN_ADDRESS, loginAddress);
	}

	public List findByOperationContent(Object operationContent) {
		return findByProperty(OPERATION_CONTENT, operationContent);
	}
	
	public SystemLog findBySessionId(Object sessionId) {
		
		SystemLog systemLog = new SystemLog();
		List list = findByProperty(SESSION_ID, sessionId);
		if(list.size() > 0){
			
			systemLog = (SystemLog) list.get(0);
			
		}
		
		return systemLog;
	}
	
	public List findAll() {
		log.debug("finding all SystemLog instances");
		try {
			String queryString = "from SystemLog";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public SystemLog merge(SystemLog detachedInstance) {
		log.debug("merging SystemLog instance");
		try {
			SystemLog result = (SystemLog) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(SystemLog instance) {
		log.debug("attaching dirty SystemLog instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(SystemLog instance) {
		log.debug("attaching clean SystemLog instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static SystemLogDAO getFromApplicationContext(ApplicationContext ctx) {
		return (SystemLogDAO) ctx.getBean("SystemLogDAO");
	}
}