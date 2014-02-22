package com.sclk.scwms.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sclk.scwms.model.Location;
import com.sclk.scwms.model.Warehouse;

/**
 * A data access object (DAO) providing persistence and search support for
 * Warehouse entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.sclk.scwms.model.Warehouse
 * @author MyEclipse Persistence Tools
 */

public class WarehouseDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(WarehouseDAO.class);
	// property constants
	public static final String NAME = "name";
	public static final String SERIAL_NUMBER = "serialNumber";
	public static final String SERIAL_KEY = "serialKey";
	public static final String PARENT_KEY = "parentKey";
	public static final String TYPE = "type";
	public static final String TEMPERATURE = "temperature";
	public static final String SIZE = "size";
	public static final String ORDER_ID = "orderId";
	public static final String AREA = "area";
	public static final String VOLUME = "volume";
	public static final String LENGTH = "length";
	public static final String WIDTH = "width";
	public static final String HEIGHT = "height";
	public static final String MEMO = "memo";

	protected void initDao() {
		// do nothing
	}

	public void save(Warehouse transientInstance) {
		log.debug("saving Warehouse instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Warehouse persistentInstance) {
		log.debug("deleting Warehouse instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Warehouse findById(java.lang.Integer id) {
		log.debug("getting Warehouse instance with id: " + id);
		try {
			Warehouse instance = (Warehouse) getHibernateTemplate().get(
					"com.sclk.scwms.model.Warehouse", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Warehouse instance) {
		log.debug("finding Warehouse instance by example");
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
		log.debug("finding Warehouse instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Warehouse as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public Map getWarehouseList(String[] warehouseId){
		Map<Integer,Warehouse> map = new LinkedHashMap<Integer, Warehouse>();
		
		String sql = "SELECT" +
					 "	w.NAME," +
					 "  l.ID," +
					 "	l.ZONE_ID," +
					 "  l.RACK_ID," +
					 "  l.STOREY_ID," +
					 "	l.POSITION_ID," +
					 "	l.TYPE," +
					 "	l.WAREHOUSE_ID, " +          
					 "	w.PARENT_KEY " +
					 "	from " +
					 "	warehouse as w, location as l " +
					 "	WHERE " +
					 "  l.WAREHOUSE_ID =  w.ID  " ;
		
		if(warehouseId != null && warehouseId.length > 0){
			sql = sql + "	and w.ID in  (:warehouseId)" ;
		}
		sql = sql + "order by  w.ORDER_ID";
					
		Session session = null ;
		List list = new ArrayList();
		try{
			session = this.getSession();
			Query query = session.createSQLQuery(sql);
			if(warehouseId != null && warehouseId.length > 0){
				query.setParameterList("warehouseId",warehouseId);
			}				
			List result =query.list();
			
			Iterator it = result.iterator();
			
			//
			List<Warehouse> wlist = this.findByParentKey("0");
			Collections.sort(wlist);
			Map<String,String> wMap = new LinkedHashMap<String, String>();
			for(Warehouse warehouse:wlist){
				wMap.put(warehouse.getSerialKey(), warehouse.getName());
				
			}
			
			while(it.hasNext()){
				Object[] row = (Object[])it.next();
				Warehouse w = null;
				if(map.containsKey((Integer) row[7])){
					w = map.get((Integer) row[7]);
				}else{
					w = new Warehouse();
					w.setId((Integer) row[7]);
					w.setName(wMap.get((String)row[8])+"-"+(String) row[0]);
					map.put((Integer) row[7], w);
				}
				Location l = new Location();
				l.setId((Integer) row[1]);
				l.setZoneId((String) row[2]);
				l.setRackId((String) row[3]);          
				l.setStoreyId((String) row[4]);
				l.setPositionId((String) row[5]);
				l.setType((String) row[6]);
				l.setWarehouseId((Integer) row[7]);
				l.setWarehouseName(wMap.get((String)row[8])+"-"+(String) row[0]);
			                      	              
				w.getLocationList().add(l);
				
			}              
		}finally{
			session.close(); 
		}
		
		return map;
		
	}
	public Map<Integer,String[]> getTotalWeightPerWarehouse(){
		Map<Integer,String[]> map = new HashMap();
		
		String sql = "SELECT " +
				"	w.ID," +
				"	sum(cr.QUANTITY)," +
				"	sum(cr.TOTAL_WEIGHT)" +
				"		FROM " +
				"		cargo_record AS cr ," +
				"		location AS l ," +
				"		warehouse AS w " +
				"		WHERE " +
				"		cr.WAREHOUSE_ID =  l.ID " +
				"AND " +
				"		l.WAREHOUSE_ID =  w.ID " +
				"		GROUP BY " +
				"		w.ID" ;
					
		Session session = null ;
		List list = new ArrayList();
		try{
			session = this.getSession();
			Query query = session.createSQLQuery(sql);
						
			List result =query.list();
			
			Iterator it = result.iterator();
			
			while(it.hasNext()){
				Object[] row = (Object[])it.next();
				
				String quantity = ((Double)row[1]).toString();
				String totalWeight = ((Double)row[2]).toString();
				String[] str = {quantity,totalWeight};
				
				map.put((Integer) row[0], str);
				
			}
		}finally{
			session.close(); 
		}
		return map;
		
	}
	
	public List getCustomersPerWarehouse(){
		
		/*String sql = "SELECT cu.name,w.id " +
					 "FROM " +
						 "customer cu," +
						 "cargo c," +
						 "cargo_record cr ," +
						 "location l ," +
						 "warehouse w " +
					 "WHERE " +
					 	"cu.id =  c.customer_id " +
					 	"and " +
					 	"c.id = cr.cargo_id " +
					 	"and " +
					 	"cr.WAREHOUSE_ID =  l.ID " +
					 	"and " +
					 	"l.WAREHOUSE_ID =  w.ID " +
					 	"group by w.id,cu.id" ;*/
		
		String sql = "select customer_name,warehouse_id  from " +
					 "	(SELECT " +
					 "		cu.name customer_name,w.id warehouse_id ,c.name cargo_name  ,sum(cr.total_weight)  total_weight ,cu.id customer_id " +
					 "	FROM " +
					 "		customer cu," +
					 " 	    cargo c," +
					 "	 	cargo_record cr ," +
					 " 		location l ," +
					 "		warehouse w " +
					 "  WHERE " +
					 "	 	cu.id =  c.customer_id  " +
					 "	 	and  " +
					 "	 	c.id = cr.cargo_id  " +
					 "	 	and  " +
					 "	 	cr.WAREHOUSE_ID =  l.ID  " +
					 "	 	and  " +
					 "	 	l.WAREHOUSE_ID =  w.ID  " +
					 "	 	group by w.id,cu.id,c.id)  b1  " +
					 "	where b1.total_weight >0  " +
					 "	group by warehouse_id,customer_id " ;
		
		
		Session session = null ;
		List list = new ArrayList();
		try{
			session = this.getSession();
			Query query = session.createSQLQuery(sql);
						
			list = query.list();
			
		}finally{
			session.close(); 
		}
		return list;
		
	}
	public List getCustomersPerWarehouseFromMemo(){
		
		String sql = "select w.id,w.memo " +
					 "from warehouse w " +
					 "WHERE " +
					 "w.MEMO LIKE '%<%>%'" ;
					
		Session session = null ;
		List list = new ArrayList();
		try{
			session = this.getSession();
			Query query = session.createSQLQuery(sql);
						
			list = query.list();
			
		}finally{
			session.close(); 
		}
		return list;
		
	}
	
	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findBySerialNumber(Object serialNumber) {
		return findByProperty(SERIAL_NUMBER, serialNumber);
	}

	public List findBySerialKey(Object serialKey) {
		return findByProperty(SERIAL_KEY, serialKey);
	}

	public List findByParentKey(Object parentKey) {
		return findByProperty(PARENT_KEY, parentKey);
	}

	public List findByType(Object type) {
		return findByProperty(TYPE, type);
	}

	public List findByTemperature(Object temperature) {
		return findByProperty(TEMPERATURE, temperature);
	}

	public List findBySize(Object size) {
		return findByProperty(SIZE, size);
	}

	public List findByOrderId(Object orderId) {
		return findByProperty(ORDER_ID, orderId);
	}

	public List findByArea(Object area) {
		return findByProperty(AREA, area);
	}

	public List findByVolume(Object volume) {
		return findByProperty(VOLUME, volume);
	}

	public List findByLength(Object length) {
		return findByProperty(LENGTH, length);
	}

	public List findByWidth(Object width) {
		return findByProperty(WIDTH, width);
	}

	public List findByHeight(Object height) {
		return findByProperty(HEIGHT, height);
	}

	public List findByMemo(Object memo) {
		return findByProperty(MEMO, memo);
	}

	public List findAll() {
		log.debug("finding all Warehouse instances");
		try {
			String queryString = "from Warehouse";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Warehouse merge(Warehouse detachedInstance) {
		log.debug("merging Warehouse instance");
		try {
			Warehouse result = (Warehouse) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Warehouse instance) {
		log.debug("attaching dirty Warehouse instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Warehouse instance) {
		log.debug("attaching clean Warehouse instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static WarehouseDAO getFromApplicationContext(ApplicationContext ctx) {
		return (WarehouseDAO) ctx.getBean("WarehouseDAO");
	}
}