package com.sclk.scwms.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sclk.scwms.model.Syscode;

/**
 * A data access object (DAO) providing persistence and search support for
 * Syscode entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.sclk.scwms.model.Syscode
 * @author MyEclipse Persistence Tools
 */

public class SyscodeDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(SyscodeDAO.class);
	// property constants
	public static final String CODE_KEY = "codeKey";
	public static final String CODE_VALUE = "codeValue";
	public static final String PARENT_KEY = "parentKey";
	public static final String ORDER_ID = "orderId";
	public static final String IS_LEAF = "isLeaf";
	public static final String MEMO = "memo";

	protected void initDao() {
		// do nothing
	}

	public void save(Syscode transientInstance) {
		log.debug("saving Syscode instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Syscode persistentInstance) {
		log.debug("deleting Syscode instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Syscode findById(java.lang.Integer id) {
		log.debug("getting Syscode instance with id: " + id);
		try {
			Syscode instance = (Syscode) getHibernateTemplate().get(
					"com.sclk.scwms.model.Syscode", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Syscode instance) {
		log.debug("finding Syscode instance by example");
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
		log.debug("finding Syscode instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Syscode as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByCodeKey(Object codeKey) {
		return findByProperty(CODE_KEY, codeKey);
	}

	public List findByCodeValue(Object codeValue) {
		return findByProperty(CODE_VALUE, codeValue);
	}

	public List findByParentKey(Object parentKey) {
		return findByProperty(PARENT_KEY, parentKey);
	}

	public List findByOrderId(Object orderId) {
		return findByProperty(ORDER_ID, orderId);
	}

	public List findByIsLeaf(Object isLeaf) {
		return findByProperty(IS_LEAF, isLeaf);
	}

	public List findByMemo(Object memo) {
		return findByProperty(MEMO, memo);
	}

	public List findAll() {
		log.debug("finding all Syscode instances");
		try {
			String queryString = "from Syscode";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Syscode merge(Syscode detachedInstance) {
		log.debug("merging Syscode instance");
		try {
			Syscode result = (Syscode) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Syscode instance) {
		log.debug("attaching dirty Syscode instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Syscode instance) {
		log.debug("attaching clean Syscode instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static SyscodeDAO getFromApplicationContext(ApplicationContext ctx) {
		return (SyscodeDAO) ctx.getBean("SyscodeDAO");
	}
}