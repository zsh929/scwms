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

import com.sclk.scwms.model.Charge;
import com.sclk.scwms.model.Customer;
import com.sclk.scwms.vo.CargoVO;
import com.sclk.scwms.vo.ChargeVO;

/**
 * A data access object (DAO) providing persistence and search support for
 * Charge entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.sclk.scwms.model.Charge
 * @author MyEclipse Persistence Tools
 */

public class ChargeDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(ChargeDAO.class);
	// property constants
	public static final String CUSTOMER_ID = "customerId";
	public static final String TYPE = "type";
	public static final String UNIT = "unit";
	public static final String WAREHOUSE_ID = "warehouseId";
	public static final String AREA = "area";
	public static final String CHARGE_DATE1 = "chargeDate1";
	public static final String CHARGE_DATE2 = "chargeDate2";
	public static final String UNIT_PRICE = "unitPrice";
	public static final String TOTAL_PRICE = "totalPrice";
	public static final String STATUS = "status";

	protected void initDao() {
		// do nothing
	}

	public void save(Charge transientInstance) {
		log.debug("saving Charge instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Charge persistentInstance) {
		log.debug("deleting Charge instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Charge findById(java.lang.Integer id) {
		log.debug("getting Charge instance with id: " + id);
		try {
			Charge instance = (Charge) getHibernateTemplate().get(
					"com.sclk.scwms.model.Charge", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Charge instance) {
		log.debug("finding Charge instance by example");
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
		log.debug("finding Charge instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Charge as model where model."
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

	public List findByType(Object type) {
		return findByProperty(TYPE, type);
	}
	public List findByUnit(Object unit) {
		return findByProperty(UNIT, unit);
	}
	public List findByWarehouseId(Object warehouseId) {
		return findByProperty(WAREHOUSE_ID, warehouseId);
	}

	public List findByArea(Object area) {
		return findByProperty(AREA, area);
	}

	public List findByChargeDate1(Object chargeDate1) {
		return findByProperty(CHARGE_DATE1, chargeDate1);
	}

	public List findByChargeDate2(Object chargeDate2) {
		return findByProperty(CHARGE_DATE2, chargeDate2);
	}

	public List findByUnitPrice(Object unitPrice) {
		return findByProperty(UNIT_PRICE, unitPrice);
	}

	public List findByTotalPrice(Object totalPrice) {
		return findByProperty(TOTAL_PRICE, totalPrice);
	}

	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List findAll() {
		log.debug("finding all Charge instances");
		try {
			String queryString = "from Charge";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Charge merge(Charge detachedInstance) {
		log.debug("merging Charge instance");
		try {
			Charge result = (Charge) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Charge instance) {
		log.debug("attaching dirty Charge instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Charge instance) {
		log.debug("attaching clean Charge instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
	
	public List findCharges(String customerId,String customerName) {
		
		String customerIdSql = "";
		String customerNameSql = "";
		if(customerId != null && !customerId.equals("")){
			customerIdSql = "AND charge1.CUSTOMER_ID = :customerId ";
		}
		if(customerName != null && !customerName.equals("")){
			customerNameSql = "AND customer1.name like :customerName ";
		}
		String sql = "select "+
						
						"customer1.id as customerId,  "+
						"customer1.name as name,  "+
						"charge1.*  " +
						"from "+
						"customer customer1 "+
						"left join charge charge1 "+
						"on "+  
						"customer1.ID =  charge1.CUSTOMER_ID " +
						"where 1 = 1 " + 
						customerIdSql + 
						customerNameSql
						//"(select charge2.CUSTOMER_ID " +  
						//"from charge charge2 " +
						//"where charge2.TYPE = 'chargeType.1' )"
						;
		//if(isDiscriminateLocation){  
		//	sql = sql + " ,cr.warehouse_id ";
		//}
		//sql = sql + " order by c.customer_id,c.name  ";
		
		
		Session session = null ;
		List list = new ArrayList();
		try{
			session = this.getSession();
			Query query = session.createSQLQuery(sql).addScalar("customerId").addScalar("name").addEntity("charge1",Charge.class);
							//.setParameter("customerId",customerId)
							//.setParameter("bDate", bDate)
							//.setParameter("eDate", eDate)
			
			
			if(customerId != null && !customerId.equals("")){
				query.setParameter("customerId",customerId);
			}
			if(customerName != null && !customerName.equals("")){
				query.setParameter("customerName","%" + customerName + "%");
			}
			List result =query.list();
			
			Iterator it = result.iterator();
			
			Charge charge = null;
			while(it.hasNext()){
				Object[] row = (Object[])it.next();
				ChargeVO vo = new ChargeVO();
				
				charge = new Charge();
				if(row[2] != null){
					charge = (Charge) row[2];
				}
				vo.setCustomerId((Integer) row[0]);
				vo.setCustomerName((String) row[1]);
				vo.setId(charge.getId());
				vo.setType(charge.getType());
				vo.setDescription(charge.getDescription());
				vo.setCategory(charge.getCategory());
				//vo.setTypeName();
				vo.setUnit(charge.getUnit());
				//vo.setUnitName();
				vo.setWarehouseId(charge.getWarehouseId());
				//vo.setWarehouseName();
				vo.setArea(charge.getArea());
				vo.setChargeDate1(charge.getChargeDate1());
				vo.setChargeDate2(charge.getChargeDate2());
				vo.setUnitPrice(charge.getUnitPrice());
				vo.setTotalPrice(charge.getTotalPrice());
				vo.setEffectiveDate(charge.getEffectiveDate());
				vo.setExpiryDate(charge.getExpiryDate());
				vo.setExpiryDate(charge.getExpiryDate());
				vo.setChargeMethod(charge.getChargeMethod());
				list.add(vo);
			}
		}finally{
			session.close(); 
		}
		return list;
	}

	public static ChargeDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ChargeDAO) ctx.getBean("ChargeDAO");
	}
}