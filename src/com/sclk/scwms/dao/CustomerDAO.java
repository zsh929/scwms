package com.sclk.scwms.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sclk.scwms.model.Customer;

/**
 * A data access object (DAO) providing persistence and search support for
 * Customer entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.sclk.scwms.model.Customer
 * @author MyEclipse Persistence Tools
 */

public class CustomerDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(CustomerDAO.class);
	// property constants
	public static final String NAME = "name";
	public static final String CONTACT = "contact";
	public static final String PHONE_NUMBER1 = "phoneNumber1";
	public static final String PHONE_NUMBER2 = "phoneNumber2";
	public static final String FAX = "fax";
	public static final String ADDRESS = "address";
	public static final String POSTCODE = "postcode";
	public static final String DUTY_ID = "dutyId";
	public static final String OPENING_BANK = "openingBank";
	public static final String ACCOUNT = "account";
	public static final String TYPE = "type";
	public static final String CREATE_USER = "createUser";
	public static final String MODIFY_USER = "modifyUser";
	public static final String MEMO = "memo";
	public static final String SHORT_NAME = "shortName";
	public static final String SYMBOL = "symbol";

	protected void initDao() {
		// do nothing
	}

	public void save(Customer transientInstance) {
		log.debug("saving Customer instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Customer persistentInstance) {
		log.debug("deleting Customer instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Customer findById(java.lang.Integer id) {
		log.debug("getting Customer instance with id: " + id);
		try {
			Customer instance = (Customer) getHibernateTemplate().get(
					"com.sclk.scwms.model.Customer", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Customer instance) {
		log.debug("finding Customer instance by example");
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
		log.debug("finding Customer instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Customer as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findByContact(Object contact) {
		return findByProperty(CONTACT, contact);
	}

	public List findByPhoneNumber1(Object phoneNumber1) {
		return findByProperty(PHONE_NUMBER1, phoneNumber1);
	}

	public List findByPhoneNumber2(Object phoneNumber2) {
		return findByProperty(PHONE_NUMBER2, phoneNumber2);
	}

	public List findByFax(Object fax) {
		return findByProperty(FAX, fax);
	}

	public List findByAddress(Object address) {
		return findByProperty(ADDRESS, address);
	}

	public List findByPostcode(Object postcode) {
		return findByProperty(POSTCODE, postcode);
	}

	public List findByDutyId(Object dutyId) {
		return findByProperty(DUTY_ID, dutyId);
	}

	public List findByOpeningBank(Object openingBank) {
		return findByProperty(OPENING_BANK, openingBank);
	}

	public List findByAccount(Object account) {
		return findByProperty(ACCOUNT, account);
	}

	public List findByType(Object type) {
		return findByProperty(TYPE, type);
	}

	public List findByCreateUser(Object createUser) {
		return findByProperty(CREATE_USER, createUser);
	}

	public List findByModifyUser(Object modifyUser) {
		return findByProperty(MODIFY_USER, modifyUser);
	}

	public List findByMemo(Object memo) {
		return findByProperty(MEMO, memo);
	}

	public List findByShortName(Object shortName) {
		return findByProperty(SHORT_NAME, shortName);
	}

	public List findBySymbol(Object symbol) {
		return findByProperty(SYMBOL, symbol);
	}

	public List findAll() {
		log.debug("finding all Customer instances");
		try {
			String queryString = "from Customer";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Customer merge(Customer detachedInstance) {
		log.debug("merging Customer instance");
		try {
			Customer result = (Customer) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Customer instance) {
		log.debug("attaching dirty Customer instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Customer instance) {
		log.debug("attaching clean Customer instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
	
	public List find(String keyword){
		String[] s = null;
		String sql = "select * from customer where customer.id in ( " +
					 "select id from customer where "+ 
					 "Concat(customer.name,',',customer.contact,',',customer.phone_number_1,',',phone_number_2,',',customer.address) like :keyword)";
		
		Session session = null ;
		List list = new ArrayList();
		try{
			session = this.getSession();
			Query query = session.createSQLQuery(sql).addEntity(Customer.class)	.setParameter("keyword","%" + keyword + "%");
			
			list = query.list();
			
			
			
		}finally{
			session.close(); 
		}
		return list;
		
		
	}
	public static CustomerDAO getFromApplicationContext(ApplicationContext ctx) {
		return (CustomerDAO) ctx.getBean("CustomerDAO");
	}
}