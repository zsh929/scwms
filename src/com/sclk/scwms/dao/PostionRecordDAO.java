package com.sclk.scwms.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sclk.scwms.model.PostionRecord;

/**
 * A data access object (DAO) providing persistence and search support for
 * PostionRecord entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.sclk.scwms.model.PostionRecord
 * @author MyEclipse Persistence Tools
 */

public class PostionRecordDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(PostionRecordDAO.class);
	// property constants
	public static final String QUANTITY = "quantity";
	public static final String WEIGHT = "weight";

	protected void initDao() {
		// do nothing
	}

	public void save(PostionRecord transientInstance) {
		log.debug("saving PostionRecord instance"); 
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(PostionRecord persistentInstance) {
		log.debug("deleting PostionRecord instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public PostionRecord findById(java.lang.Integer id) {
		log.debug("getting PostionRecord instance with id: " + id);
		try {
			PostionRecord instance = (PostionRecord) getHibernateTemplate()
					.get("com.sclk.scwms.model.PostionRecord", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(PostionRecord instance) {
		log.debug("finding PostionRecord instance by example");
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
		log.debug("finding PostionRecord instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from PostionRecord as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByQuantity(Object quantity) {
		return findByProperty(QUANTITY, quantity);
	}

	public List findByWeight(Object weight) {
		return findByProperty(WEIGHT, weight);
	}

	public List findAll() {
		log.debug("finding all PostionRecord instances");
		try {
			String queryString = "from PostionRecord";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public PostionRecord merge(PostionRecord detachedInstance) {
		log.debug("merging PostionRecord instance");
		try {
			PostionRecord result = (PostionRecord) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(PostionRecord instance) {
		log.debug("attaching dirty PostionRecord instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(PostionRecord instance) {
		log.debug("attaching clean PostionRecord instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static PostionRecordDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (PostionRecordDAO) ctx.getBean("PostionRecordDAO");
	}
	
	public List findBy(){
		
		
		Integer[] s = null;
		String sql = "SELECT " +
					 "a.NAME, " +
					 "a.NUMBER, " +
					 "sum(a.QUANTITY) aa, " +
					 "a.POSTION_ID," +
					 "a.WEIGHT 	" +
			
				" FROM " +
				"( " +
			
			" SELECT  " +
					 "	cargo.NAME, " +
					 "	cargo.NUMBER, " +
					 "	postion_record.QUANTITY, " +
					 "	postion_record.POSTION_ID," +
					 "  cargo.WEIGHT " +
					 "FROM " +
					 "	cargo , " +
					 "	cargo_record , " +
					 "	postion_record " +
					 "WHERE " +
					 "	cargo.ID =  cargo_record.CARGO_ID AND " +
					 "	cargo_record.ID =  postion_record.CARGO_RECORD_ID AND " +
					 "  postion_record.CARGO_ID is null " +
					 " UNION all " +
					 "	SELECT " +
					 "	 cargo.NAME," +
					 "	 cargo.NUMBER," +
					 "	 postion_record.QUANTITY," +
					 "	 postion_record.POSTION_ID," +
					 "   cargo.WEIGHT " +
					 "	 FROM " +
					 "	 cargo , " +
					 "	 postion_record " +
					 "	 WHERE " +
					 "	 cargo.ID =  postion_record.CARGO_ID " +
					 ")  a  " +
					 " group by a.NUMBER, a.POSTION_ID having aa > 0  order by a.postion_id ";
		
		Session session = null ;
		List<Integer> list = new ArrayList<Integer>();
		List result = null;
		try{
			session = this.getSession();
			Query query = session.createSQLQuery(sql);
							
			result =query.list();
			
			Iterator it = result.iterator();
			
			
		}finally{
			session.close(); 
		}
		return result;
		
		
	}
	
}