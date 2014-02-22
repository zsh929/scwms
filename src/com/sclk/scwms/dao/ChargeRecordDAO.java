package com.sclk.scwms.dao;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sclk.scwms.model.ChargeDetail;
import com.sclk.scwms.model.ChargeRecord;

/**
 * A data access object (DAO) providing persistence and search support for
 * ChargeRecord entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.sclk.scwms.model.ChargeRecord
 * @author MyEclipse Persistence Tools
 */
public class ChargeRecordDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(ChargeRecordDAO.class);
	// property constants
	public static final String CUSTOMER_ID = "customerId";
	public static final String STOCK_RECORD_ID = "stockRecordId";
	public static final String CHARGE_ID = "chargeId";
	public static final String CHARGE_TYPE = "chargeType";
	public static final String WEIGHT = "weight";
	public static final String UNIT_PRICE = "unitPrice";
	public static final String TOTAL_PRICE = "totalPrice";

	protected void initDao() {
		// do nothing
	}

	public void save(ChargeRecord transientInstance) {
		log.debug("saving ChargeRecord instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(ChargeRecord persistentInstance) {
		log.debug("deleting ChargeRecord instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public ChargeRecord findById(java.lang.Integer id) {
		log.debug("getting ChargeRecord instance with id: " + id);
		try {
			ChargeRecord instance = (ChargeRecord) getHibernateTemplate().get(
					"com.sclk.scwms.model.ChargeRecord", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(ChargeRecord instance) {
		log.debug("finding ChargeRecord instance by example");
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
		log.debug("finding ChargeRecord instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from ChargeRecord as model where model."
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

	public List findByStockRecordId(Object stockRecordId) {
		return findByProperty(STOCK_RECORD_ID, stockRecordId);
	}

	public List findByChargeId(Object chargeId) {
		return findByProperty(CHARGE_ID, chargeId);
	}

	public List findByChargeType(Object chargeType) {
		return findByProperty(CHARGE_TYPE, chargeType);
	}

	public List findByWeight(Object weight) {
		return findByProperty(WEIGHT, weight);
	}

	public List findByUnitPrice(Object unitPrice) {
		return findByProperty(UNIT_PRICE, unitPrice);
	}

	public List findByTotalPrice(Object totalPrice) {
		return findByProperty(TOTAL_PRICE, totalPrice);
	}

	public List findAll() {
		log.debug("finding all ChargeRecord instances");
		try {
			String queryString = "from ChargeRecord";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public ChargeRecord merge(ChargeRecord detachedInstance) {
		log.debug("merging ChargeRecord instance");
		try {
			ChargeRecord result = (ChargeRecord) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(ChargeRecord instance) {
		log.debug("attaching dirty ChargeRecord instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(ChargeRecord instance) {
		log.debug("attaching clean ChargeRecord instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ChargeRecordDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (ChargeRecordDAO) ctx.getBean("ChargeRecordDAO");
	}
	
	public ChargeDetail getChargeRecord(ChargeDetail chargeDetail){
		Integer customerId = chargeDetail.getCustomerId();
		String chargeType = chargeDetail.getChargeType();
		Date bDate = chargeDetail.getStartDate();
		Date eDate = chargeDetail.getEndDate();
		String sql = "SELECT "+
						"SUM(charge_record.WEIGHT),"+
						"SUM(charge_record.TOTAL_PRICE) "+ 
						"from charge_record "+
						"WHERE "+
						"charge_record.CUSTOMER_ID = :customerId " +
						"AND "+
						"charge_record.CHARGE_TYPE = :chargeType " +
						"AND "+
						"charge_record.DATE > :bDate  " +
						"AND "+
						"charge_record.DATE <= :eDate";

		Session session = null ;
		
		try{
			session = this.getSession();
			Query query = session.createSQLQuery(sql)
								 .setInteger("customerId", customerId)
								 .setString("chargeType", chargeType)
								 .setDate("bDate", bDate)
								 .setDate("eDate", eDate);
			List result = query.list();
			Iterator it = result.iterator();
			
			while(it.hasNext()){
				Object[] row = (Object[])it.next();
				chargeDetail.setWeight(row[0] == null? "0":(((Double)row[0]).toString()));
				chargeDetail.setTotalPrice(row[0] == null? "0":(((Double)row[1]).toString()));
				
			}
		}finally{
			session.close(); 
		}
		
		return chargeDetail; 
		
	}
	
	public List getChargeRecordItems(Integer customerId){
		//Integer customerId = chargeDetail.getCustomerId();
		//String chargeType = chargeDetail.getChargeType();
		//Date bDate = chargeDetail.getStartDate();
		//Date eDate = chargeDetail.getEndDate();
		String sql = "SELECT " +
						"stock_record.id," +
						"charge_record.charge_type,"+
						"SUM(charge_record.WEIGHT),"+
						"SUM(charge_record.TOTAL_PRICE) "+ 
						"from " +
						"stock_record," +
						"charge_record " +
						"WHERE " +
						"stock_record.ID =  charge_record.STOCK_RECORD_ID and "+
						"stock_record.CUSTOMER_NAME = :customerId " +
						"group by stock_record.ID,charge_record.charge_type";

		Session session = null ;
		List result = null;
		try{
			session = this.getSession();
			Query query = session.createSQLQuery(sql)
								 .setInteger("customerId", customerId);
								//.setString("chargeType", chargeType)
								//.setDate("bDate", bDate)
								//.setDate("eDate", eDate);
			result = query.list();
			Iterator it = result.iterator();
			
			//while(it.hasNext()){
			//	Object[] row = (Object[])it.next();
			//	chargeDetail.setWeight(row[0] == null? "0":(((Double)row[0]).toString()));
			//	chargeDetail.setTotalPrice(row[0] == null? "0":(((Double)row[1]).toString()));
				
			//}
		}finally{
			session.close(); 
		}
		
		return result; 
		
	}
}