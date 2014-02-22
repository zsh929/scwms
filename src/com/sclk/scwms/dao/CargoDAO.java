package com.sclk.scwms.dao;

import java.util.ArrayList;
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

import com.sclk.scwms.model.Cargo;
import com.sclk.scwms.model.Charge;
import com.sclk.scwms.model.Customer;
import com.sclk.scwms.model.Syscode;
import com.sclk.scwms.vo.ChargeVO;

/**
 * A data access object (DAO) providing persistence and search support for Cargo
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.sclk.scwms.model.Cargo
 * @author MyEclipse Persistence Tools
 */

public class CargoDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(CargoDAO.class);
	// property constants
	public static final String NAME = "name";
	public static final String CATEGORY = "category";
	public static final String SIZE = "size";
	public static final String UNIT = "unit";
	public static final String WEIGHT = "weight";
	public static final String NUMBER = "number";
	public static final String CUSTOMER_ID = "customerId";

	protected void initDao() {
		// do nothing
	}

	public void save(Cargo transientInstance) {
		log.debug("saving Cargo instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Cargo persistentInstance) {
		log.debug("deleting Cargo instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Cargo findById(java.lang.Integer id) {
		log.debug("getting Cargo instance with id: " + id);
		try {
			Cargo instance = (Cargo) getHibernateTemplate().get(
					"com.sclk.scwms.model.Cargo", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Cargo instance) {
		log.debug("finding Cargo instance by example");
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
		log.debug("finding Cargo instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Cargo as model where model."
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

	public List findByCategory(Object category) {
		return findByProperty(CATEGORY, category);
	}

	public List findBySize(Object size) {
		return findByProperty(SIZE, size);
	}

	public List findByUnit(Object unit) {
		return findByProperty(UNIT, unit);
	}

	public List findByWeight(Object weight) {
		return findByProperty(WEIGHT, weight);
	}

	public List findByCustomerId(Object customerId) {
		return findByProperty(CUSTOMER_ID, customerId);
	}
	public List findByNumber(Object number) {
		return findByProperty(NUMBER, number);
	}
	public List findAll() {
		log.debug("finding all Cargo instances");
		try {
			String queryString = "from Cargo";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Cargo merge(Cargo detachedInstance) {
		log.debug("merging Cargo instance");
		try {
			Cargo result = (Cargo) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Cargo instance) {
		log.debug("attaching dirty Cargo instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Cargo instance) {
		log.debug("attaching clean Cargo instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static CargoDAO getFromApplicationContext(ApplicationContext ctx) {
		return (CargoDAO) ctx.getBean("CargoDAO");
	}
	
	public Integer[] findByCategory(List<String> categoryCodeKey){
		
		
		Integer[] s = null;
		String sql = "SELECT " +
						"c.ID " +
						"FROM " +
						"cargo c " +
						"WHERE " +
						"c.CATEGORY in  (:categoryCodeKey)";
		
		Session session = null ;
		List<Integer> list = new ArrayList<Integer>();
		try{
			session = this.getSession();
			Query query = session.createSQLQuery(sql);
							
			if(categoryCodeKey != null && categoryCodeKey.size() > 0){
				query.setParameterList("categoryCodeKey",categoryCodeKey);
				list = query.list();
				
				s = new Integer[list.size()];   
				for(int i=0;i < s.length;i++){   
					s[i] = list.get(i);   
				}
			}
			
			
		
		}finally{
			session.close(); 
		}
		return s;
		
		
	}
	
	public List<Syscode> getCategoryListByCustomerId(String customerId){
		
		
		Integer[] s = null;
		String sql = "SELECT " +
						 "distinct(CODE_KEY),CODE_VALUE " +
					 "FROM " +
					     "cargo,syscode " +
					 "where " +
					     "cargo.CATEGORY = syscode.CODE_KEY " +
					     "and " +
					     "cargo.CUSTOMER_ID = :customerId";
		
		Session session = null ;
		List<Syscode> list = new ArrayList<Syscode>();
		try{
			session = this.getSession();
			Query query = session.createSQLQuery(sql);
							
			query.setParameter("customerId",customerId);
			List result = query.list();
			Iterator it = result.iterator();
			
			Syscode syscode = null;
			while(it.hasNext()){
				Object[] row = (Object[])it.next();
				
				syscode = new Syscode();
				
				syscode.setCodeKey((String) row[0]);
				syscode.setCodeValue((String) row[1]);
				
				list.add(syscode);
			}
		
		}finally{
			session.close(); 
		}
		return list;	
		
	}
	public List<Cargo> find(String[] keywordArr){
		
		String keyword_sql = "";
		for(int i = 0;i < keywordArr.length;i++){
			
			keyword_sql = keyword_sql + " t1.query_content like " + "'%" + keywordArr[i] + "%' and ";
		}
		
		keyword_sql = keyword_sql + "1 = 1";
		
		Integer[] s = null;
		String sql = "select * from cargo where cargo.id in ( "+
						"select t1.id from ( "+
						"select cargo.id as id , Concat(cargo.name,syscode.code_value,customer.name,s1.code_value) as query_content from cargo,syscode,customer,syscode s1 where "+
						"cargo.category = syscode.code_key and "+
						"cargo.customer_id = customer.id and "+
						"cargo.unit = s1.code_key ) as t1 where " +
						//"t1.query_content like :keyword" +
						keyword_sql +
						")";
		
		Session session = null ;
		List list = new ArrayList();
		try{
			session = this.getSession();
			Query query = session.createSQLQuery(sql).addEntity(Cargo.class);
			
			list = query.list();
			
		}finally{
			session.close(); 
		}
		return list;
		
	}
	
}