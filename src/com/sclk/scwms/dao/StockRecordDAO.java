package com.sclk.scwms.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sclk.scwms.model.StockRecord;
import com.sclk.scwms.vo.CargoRecordItemsVO;
import com.sclk.scwms.vo.CargoVO;
import com.sclk.scwms.vo.MonthTotalVO;
import com.sclk.scwms.common.*;
/**
 * A data access object (DAO) providing persistence and search support for
 * StockRecord entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.sclk.scwms.model.StockRecord
 * @author MyEclipse Persistence Tools
 */

public class StockRecordDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(StockRecordDAO.class);
	// property constants
	public static final String IN_OUT = "inOut";
	public static final String TYPE = "type";
	public static final String PERSON_HANDLING = "personHandling";
	public static final String CONTRACT_ID = "contractId";
	public static final String CUSTOMER_NAME = "customerName";
	public static final String CREATE_USER = "createUser";
	public static final String SERIAL_NUMBER = "serialNumber";

	protected void initDao() {
		// do nothing
	}

	public void save(StockRecord transientInstance) {
		log.debug("saving StockRecord instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(StockRecord persistentInstance) {
		log.debug("deleting StockRecord instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public StockRecord findById(java.lang.Integer id) {
		log.debug("getting StockRecord instance with id: " + id);
		try {
			StockRecord instance = (StockRecord) getHibernateTemplate().get(
					"com.sclk.scwms.model.StockRecord", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(StockRecord instance) {
		log.debug("finding StockRecord instance by example");
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

	public List findById_bDate_eDate(final Integer customerId,final Date bDate,final Date eDate,final Short inOut) {
		
		try {
			
			List list = (List) this.getHibernateTemplate().execute(
				    new HibernateCallback() {

				     public Object doInHibernate(Session session)
				       throws HibernateException, SQLException {

				    	 Criteria criteria = session.createCriteria(StockRecord.class);
				    	 if(customerId != null){
				    		 criteria.add(Restrictions.eq("customerId", customerId));
				    	 }
				    	 if(eDate != null){
				    		 criteria.add(Restrictions.le("time", eDate));
				    	 }
				    	 if(bDate != null){
				    		 criteria.add(Restrictions.ge("time", bDate));
				    	 }  
				    	 if(inOut != null){
				    		 criteria.add(Restrictions.eq("inOut", inOut));
				    	 }  
				    	 
				    	 
				      return criteria.list();
				     }
				    });
		
			return list;
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	
	public List findByProperty(final Integer customerId,final Date bDate,final Date eDate) {
		
		try {
			
			List list = (List) this.getHibernateTemplate().execute(
				    new HibernateCallback() {

				     public Object doInHibernate(Session session)
				       throws HibernateException, SQLException {

				      Query query = session.createQuery("from StockRecord where time>=? and time<=? and customerId=?");

				      query.setDate(0, bDate);
				      query.setDate(1, eDate);
				      
				      query.setInteger(2, customerId);
				      return query.list();
				     }
				    });
		
			return list;
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	public List findByProperty(final Integer customerId,final Integer cargoId,final Date bDate,final Date eDate) {
		
		try {
			
			List list = (List) this.getHibernateTemplate().execute(
				    new HibernateCallback() {

				     public Object doInHibernate(Session session)
				       throws HibernateException, SQLException {

				      Query query = session.createQuery("from StockRecord s left join fetch s.cargoRecords c  where s.time>=? and s.time<=? and s.customerId=? and c.cargoId=?");

				      query.setDate(0, bDate);
				      query.setDate(1, eDate);
				      query.setInteger(2, customerId);
				      query.setInteger(3, cargoId);
				      return query.list();
				     }
				    });
		
			return list;
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public List getCustomerInventoryList(String customerId,String bDate,String eDate){
		
		return getCustomerInventoryList(customerId, bDate, eDate, true);
		
	}

	
	
	public List getCustomerInventoryList(String customerId,String bDate,String eDate,boolean isDiscriminateLocation){
		String customerIdSql = "";
		if(customerId != null && !customerId.equals("")){
			customerIdSql = " sr.CUSTOMER_NAME =  :customerId AND ";
		}
		String sql = "select c.number," +
							"c.name," +
							"cr.batch_number," +
							"cr.date_produce," +
							"c.category," +
							"c.weight," +
							"c.unit," +
							"sum(cr.quantity)," +
							"TRUNCATE(sum(cr.total_weight),1)," +
							"cr.warehouse_id," +
							"c.id," +
							"c.customer_id, " +
							"c.gross_weight " +
							
				" from " +
				"cargo_record cr,cargo c, customer cu " +
				"where  cr.stock_record_id in " +
				"	(SELECT " +
				"		sr.ID " +
				"	FROM " +
				"		stock_record  sr " +
				"	WHERE " +
				customerIdSql + 
				"		sr.TIME >=  :bDate " +
				"	AND " +
				"		sr.TIME <=  :eDate )" +
				"	AND " +
				"		c.id = cr.cargo_id " +
				"	AND " +
				"		cu.id = c.customer_id " +
				"group by cr.cargo_id ," +
				"cr.batch_number," +
				"cr.date_produce";
		if(isDiscriminateLocation){
			sql = sql + " ,cr.warehouse_id ";
		}
		sql = sql + " order by c.customer_id,c.name  ";
		
		
		Session session = null ;
		List list = new ArrayList();
		try{
			session = this.getSession();
			Query query = session.createSQLQuery(sql)
							//.setParameter("customerId",customerId)
							.setParameter("bDate", bDate)
							.setParameter("eDate", eDate);
			
			if(customerId != null && !customerId.equals("")){
				query.setParameter("customerId",customerId);
			}
			
			List result =query.list();
			
			Iterator it = result.iterator();
			
			while(it.hasNext()){
				Object[] row = (Object[])it.next();
				CargoVO vo = new CargoVO();
				vo.setNumber((String) row[0]);
				vo.setName((String) row[1]);
				vo.setBatchNumber((String) row[2]);
				vo.setDateProduce(row[3] == null?"" :row[3].toString());
				vo.setCategory((String) row[4]);
				vo.setWeight((String) row[5]);
				vo.setUnit((String) row[6]);
				vo.setQuantity(row[7].toString());
				vo.setTotalWeight(((Double)row[8]).toString());
				vo.setLocationId(row[9] == null?"" :row[9].toString());
				vo.setId((Integer) row[10]);
				vo.setCustomerId(row[11].toString());
				vo.setGrossWeight(row[12] != null ? row[12].toString():"");
				list.add(vo);
			}
		}finally{
			session.close(); 
		}
		return list;
		
	}
	public List getWarehouseInventoryList(String warehouseId){
		
						String sql = "SELECT " +
							"c.number, " +
							"c.name, " +
							"cr.batch_number," +
							"cr.date_produce," +
							"c.category," +
							"c.weight," +
							"c.unit," +
							"sum(cr.quantity)," +
							"sum(cr.total_weight)," +
							"cr.warehouse_id," +
							"c.id ," +
							"c.CUSTOMER_id   " +
							         
						"FROM " +
							
							"cargo_record cr , " +
							"location  l, " +
							"cargo c " +                         
							
						" WHERE " +
							
							"cr.WAREHOUSE_ID =  l.ID AND " +
							"l.WAREHOUSE_ID =  :warehouseId AND " +
							"c.ID =  cr.CARGO_ID   " +
							
						"GROUP BY " +
							"cr.CARGO_ID, " +
							"cr.WAREHOUSE_ID, " +
							"cr.BATCH_NUMBER, " +
							"cr.DATE_PRODUCE   ";
		Session session = null ;
		List list = new ArrayList();
		try{
			session = this.getSession();
			Query query = session.createSQLQuery(sql).setParameter("warehouseId",warehouseId);
			List result =query.list();
			
			Iterator it = result.iterator();
			
			while(it.hasNext()){
				Object[] row = (Object[])it.next();
				CargoVO vo = new CargoVO();
				vo.setNumber((String) row[0]);
				vo.setName((String) row[1]);
				vo.setBatchNumber((String) row[2]);
				vo.setDateProduce(row[3] == null?"" :row[3].toString());
				vo.setCategory((String) row[4]);
				vo.setWeight((String) row[5]);
				vo.setUnit((String) row[6]);
				vo.setQuantity(row[7].toString());
				vo.setTotalWeight(((Double)row[8]).toString());
				vo.setLocationId(row[9] == null?"" :row[9].toString());
				vo.setId((Integer) row[10]);
				vo.setCustomerId(((Integer) row[11]).toString());
				list.add(vo);
			}
		}finally{
			session.close(); 
		}
		return list;
		
	}
	public String[]  getCargoRecordTotal(String cargoId,Date bDate,Date eDate){
		String[] s = null;
		String sql = "SELECT " +
					"cr.CARGO_ID," +
					"sum(cr.QUANTITY)," +
					"sum(cr.TOTAL_WEIGHT)" +
					" FROM" +
					"	stock_record AS sr," +
					"	cargo_record AS cr" +
					" WHERE " +
					"	sr.ID =  cr.STOCK_RECORD_ID " +
					" AND " +
					"	cr.CARGO_ID =  :cargoId" +
					" AND " +
					"   sr.TIME >  :bDate  " +
					" AND " +
					"   sr.TIME <  :eDate " +
					"	GROUP BY " +
					"	cr.CARGO_ID";
		
		Session session = null ;
		//List list = new ArrayList();
		try{
			session = this.getSession();
			Query query = session.createSQLQuery(sql)
							.setParameter("cargoId",cargoId)
							.setDate("bDate", bDate)
							.setDate("eDate", eDate);
			Object o = query.uniqueResult();
			
			if(o != null){
				Object[] row = (Object[])o;
				s = new String[]{((Double)row[1]).toString(),((Double)row[2]).toString()};
			}
			
		}finally{
			session.close(); 
		}
		return s;
		
		
	}
	public List<MonthTotalVO>  getCargoRecordTotalList(String customerId,Date bDate,Date eDate,String[] tagsId,Boolean isAll){
		String[] s = null;
		
		String sql = "select " +
					 " * "+
					 " from " +
					 
						 "(select " +
						 	"c.id id, " +
							"c.name ," +
							"c.unit," +
							"c.weight," +
							"c.number," +
							"sum(cr.quantity) q, " +
							"TRUNCATE(sum(cr.total_weight),1) w " +
							
						"from " +
							"stock_record sr," +
							"cargo_record cr," +
							"cargo c " +
				   		"where " +
							"sr.id = cr.stock_record_id " +
							"and " +
							"cr.cargo_id = c.id " +
							"and " +
							"c.customer_id = :customerId " +
							"and " +
							"sr.time <= :eDate " +
							//"and " +
							//" sr.in_out < 2 " +
						"group by " +
							"c.id) b1 " +
					 
					    " left join " +
					 
						"(select " +
							 "c.id id," +							 
							 "sum((cr.quantity>0)*cr.quantity)  iq," +
							 "sum((cr.total_weight>0)*cr.total_weight) iw  ," +
							 "sum((cr.quantity<0)*cr.quantity) oq," +
							 "sum((cr.total_weight<0)*cr.total_weight)  ow " +
						"from " +
							"stock_record sr," +
							"cargo_record cr," +
							"cargo c " +
						"where " +
							"sr.id = cr.stock_record_id " +
							"and " +
							"cr.cargo_id = c.id " +
							"and " +
							"c.customer_id = :customerId " +
							"and " +
							"sr.time >= :bDate " +
							"and " +
							"sr.time <= :eDate " +
							"and sr.in_out < 2 " +
						"group by " +
							"c.id) b2 " +
						
					 "on " +
					 	"b1.id = b2.id ";
		
		sql = sql + " where 1=1 ";
		
		if(tagsId != null && !tagsId.equals("")){
			sql = sql + "and " +
					 	"b1.id in " +
					 	"(" +
					 		"select tc.cargo_id " +
					 		"from " +
					 		"tags t," +
					 		"tags_cargo tc " +
					 		"where " +
					 		"t.id = tc.tags_id " +
					 		"and " +
					 		"t.id in (:tagsId)" +
					 	")";
		}
		
		if(!isAll){
			sql = sql + " and  (" +
					"	 w <> 0  or " +
					"    iw <> 0 or " +
					"    ow <> 0  )	" 	;
		}
		
		
		Session session = null ;
		//List list = new ArrayList();
		List<MonthTotalVO> list = new ArrayList<MonthTotalVO>();
		try{
			session = this.getSession();
			Query query = session.createSQLQuery(sql)
							.setParameter("customerId",customerId)
							.setDate("bDate", bDate)
							.setDate("eDate", eDate);
							
			
			if(tagsId != null && !tagsId.equals("")){
				query.setParameterList("tagsId",tagsId);
			}
			
			
			List result = query.list();
			Iterator it = result.iterator();
		
			while(it.hasNext()){
				Object[] row = (Object[])it.next();
				MonthTotalVO vo = new MonthTotalVO();
				vo.setCargoId((Integer)row[0]);
				vo.setCargoName((String) row[1]);
				
				vo.setUnit((String)row[2]);
				vo.setWeight((String)row[3]);
				vo.setNumber((String) row[4]);
				vo.setInQuantity(row[8] == null? "":((Double)row[8]).toString());
				vo.setInWeight(row[9] == null? "":((Double)row[9]).toString());
				vo.setOutQuantity(row[10] == null? "":((Double)row[10]).toString());
				vo.setOutWeight(row[11] == null? "":((Double)row[11]).toString());
				vo.setBalanceQuantity(((Double)row[5]).toString());
				vo.setBalanceWeight(((Double)row[6]).toString());
				
				list.add(vo);
			}
			
			
		}finally{
			session.close(); 
		}
		return list;
		
		
	}
	public List<CargoRecordItemsVO>  getCargoRecordList(String cargoId,String locationId){
		
	/*	String sql = "SELECT " +
					 "sr.TIME, " +
					 "sr.SERIAL_NUMBER, " +
					 "sr.IN_OUT, " +
					 "cr.QUANTITY, " +
					 "cr.TOTAL_WEIGHT, " +
					 "cr.WAREHOUSE_ID " +
					 "from " +
					 "stock_record sr, " +
					 "cargo_record cr " +
					 " where " +
					 " sr.ID = cr.STOCK_RECORD_ID " +
					//2010-12-07 zsh
						"	and sr.in_out < 2 " ;
					 
					
					 
		if(cargoId != null && !cargoId.equals("")){
			sql = sql + " and cr.CARGO_ID = :cargoId " ;
		}	
					 
		if(locationId != null && !locationId.equals("")){
			sql = sql + " and cr.WAREHOUSE_ID = :locationId ";
		}
					 
		sql = sql + " order by sr.TIME ";	*/		
		
		String cargoSql = "";
		String warehouseSql = "";
		
		if(cargoId != null && !cargoId.equals("")){
			cargoSql = " and cr.CARGO_ID = :cargoId " ;
		}	
					 
		if(locationId != null && !locationId.equals("")){
			warehouseSql =  " and cr.WAREHOUSE_ID = :locationId ";
		}

		
		String sql = "select * from  " +
					 "	(            " +
					 "		SELECT   " +
					"						sr.TIME, " +
					"						sr.SERIAL_NUMBER, " +
					"						 sr.IN_OUT, " +
					"						 cr.QUANTITY, " +
					"						 cr.TOTAL_WEIGHT, " +
					"						 cr.WAREHOUSE_ID " +
					"						 from " +
					"						 stock_record sr, " +
					"						 cargo_record cr " +
					"						  where " +
					"						  sr.ID = cr.STOCK_RECORD_ID " +
					"								and sr.in_out < 2 " +
					 			
					cargoSql  + 
					warehouseSql +
								 
				"				 UNION ALL " +
				
				
				"				SELECT " +
				"							sr.TIME , " +
				"							sr.SERIAL_NUMBER, " +
				"							 sr.IN_OUT, " +
				"							 cr.QUANTITY, " +
				"							 cr.TOTAL_WEIGHT, " +
				"							 cr.WAREHOUSE_ID " +
				"							 from " +
				"							 stock_record sr, " +
				"							 cargo_record cr " +
				"							  where " +
				"							  sr.ID = cr.STOCK_RECORD_ID " +
				"									and sr.in_out = 3 " +
				cargoSql  + 
				warehouseSql +
				
				"		) as t1		order by t1.time " ;
		
		
		
		Session session = null ;
		List<CargoRecordItemsVO> list = new ArrayList<CargoRecordItemsVO>();
		try{
			session = this.getSession();
			Query query = session.createSQLQuery(sql);
							
			
			if(cargoId != null && !cargoId.equals("")){
				query.setParameter("cargoId",cargoId);
			}	
						 
			if(locationId != null && !locationId.equals("")){
				query.setParameter("locationId",locationId);
			}
			
			List result = query.list();
			Iterator it = result.iterator();
			
			while(it.hasNext()){
				Object[] row = (Object[])it.next();
				CargoRecordItemsVO vo = new CargoRecordItemsVO();
				vo.setTime((Date) row[0]);
				vo.setSerialNumber((String) row[1]);
				vo.setInOut(((Byte)row[2]).intValue());
				
				vo.setQuantity((String) row[3]);
				vo.setTotalWeight((String) row[4]);
				vo.setLocationId( (Integer) row[5]);
				
				list.add(vo);
			}
			
		}finally{
			session.close(); 
		}
		return list;
		
		
	}
	
	public List getStockList(String locationId,String customerId,Integer[] cargoIdArray,Date bDate,Date eDate){		
		
		String locationIdSql = "";
		String customerIdSql = "";
		String cargoIdSql = "";
		    
		if(locationId != null && !locationId.equals("")){
			locationIdSql = "	and cr.WAREHOUSE_ID =  :locationId " ;
		}    
		if(customerId != null && !customerId.equals("")){
			customerIdSql = "	and sr.CUSTOMER_NAME in  ("+ customerId +") " ;
		}
		if(cargoIdArray != null && cargoIdArray.length > 0){
			cargoIdSql = "	and cr.CARGO_ID in  (:cargoId) " ;
		}
		
		String sql = "select * ," +
						"(" +
						"	select sum(T1.total_weight_out+T1.total_weight_in) from  " +
							"(" +
							"	select " +
							"		sr.time time, " +
							"		sum((cr.quantity<0)*cr.quantity)  quantity_out, " +
							"		sum((cr.quantity>0)*cr.quantity) quantity_in, " +
							"		sum((cr.total_weight<0)*cr.total_weight) total_weight_out ,  " +
							"		sum((cr.total_weight>0)*cr.total_weight) total_weight_in  " +
							"	from cargo_record cr ," +
							"		 stock_record sr " +
							"	where cr.stock_record_id = sr.id " +
							//2010-12-07 zsh
							"	and sr.in_out < 2 " +
							locationIdSql +
							customerIdSql +
							cargoIdSql +
							"	group by sr.time " +
							"	order by sr.time " +
							") T1" +
							"	where T1.time <= T2.time   ) as accumulate " +
					 "from " +
					 		"(" +
					 		"select " +
					 		"	sr.time time," +
					 		"		sum((cr.quantity<0)*cr.quantity)  quantity_out, " +
							"		sum((cr.quantity>0)*cr.quantity) quantity_in, " +
							"		sum((cr.total_weight<0)*cr.total_weight) total_weight_out ,  " +
							"		sum((cr.total_weight>0)*cr.total_weight) total_weight_in  " +
					 		"from cargo_record cr , " +
					 		"	  stock_record sr " +
					 		"where " +
					 		"	cr.stock_record_id = sr.id " +
					 		//2010-12-07 zsh
							"	and sr.in_out < 2 " +
					 		
					 		locationIdSql +
							customerIdSql +
							cargoIdSql +
					 		"group by sr.time " +
					 		"order by sr.time ) T2 " +
					 "where T2.time >=:bDate " +
					 "		and " +
					 " 		T2.time <:eDate " ;
		
		
		
		
		Session session = null ;
		List list = new ArrayList();
		List result = null;
		try{
			session = this.getSession();
			Query query = session.createSQLQuery(sql)
							.setDate("bDate", bDate)
							.setDate("eDate", eDate);
			
			if(locationId != null && !locationId.equals("")){
				query.setParameter("locationId",locationId);
			}
			/*if(customerId != null && !customerId.equals("")){
				query.setParameter("customerId",customerId);
			}*/
			if(cargoIdArray != null && cargoIdArray.length > 0){
				query.setParameterList("cargoId",cargoIdArray);
			}
			
			result =query.list();
			
			Iterator it = result.iterator();
			
			while(it.hasNext()){
				Object[] row = (Object[])it.next();
				String[] s = {row[0].toString(),
							  row[1].toString(),
							  row[2].toString(),
							  row[3].toString(),
							  row[4].toString(),
							  row[5].toString()};
				
				list.add(s);
			}
			
		}finally{
			session.close(); 
		}
			
		return result;
	}	
	
	public List getStockCountList(String locationId,String customerId,Integer[] cargoIdArray,Date bDate,Date eDate){		
		
		String locationIdSql = "";
		String customerIdSql = "";
		String cargoIdSql = "";
		    
		if(locationId != null && !locationId.equals("")){
			locationIdSql = "	and cr.WAREHOUSE_ID =  :locationId " ;
		}    
		if(customerId != null && !customerId.equals("")){
			customerIdSql = "	and sr.CUSTOMER_NAME in  ("+ customerId +") " ;
		}
		if(cargoIdArray != null && cargoIdArray.length > 0){
			cargoIdSql = "	and cr.CARGO_ID in  (:cargoId) " ;
		}
		
		String sql = "select " +
					"	sr.time time, " +
					"	sum(sr.in_out =1) a," +
					"	sum(sr.in_out =0) b," +
					"	count(*) count " +
						
					"from " +
					"	stock_record sr " +
					" where sr.in_out < 2 " +
					"		and " +
					"		sr.time >:bDate " +
					 "		and " +
					 " 		sr.time <:eDate " +
				
						  locationIdSql +
						  customerIdSql +
						  cargoIdSql +
					" group by sr.time " ;

		Session session = null ;
		List list = new ArrayList();
		List result = null;
		try{
			session = this.getSession();
			Query query = session.createSQLQuery(sql).addScalar("time", Hibernate.DATE)
													 .addScalar("a", Hibernate.INTEGER)
													 .addScalar("b",Hibernate.INTEGER)
													 .addScalar("count", Hibernate.INTEGER)
													 .setDate("bDate", bDate)
													 .setDate("eDate", eDate);
			
			if(locationId != null && !locationId.equals("")){
				query.setParameter("locationId",locationId);
			}
			/*if(customerId != null && !customerId.equals("")){
				query.setParameter("customerId",customerId);
			}*/
			if(cargoIdArray != null && cargoIdArray.length > 0){
				query.setParameterList("cargoId",cargoIdArray);
			}
			System.out.println(sql);
			result =query.list();
			
			Iterator it = result.iterator();
			
			while(it.hasNext()){
				Object[] row = (Object[])it.next();
				String[] s = {row[0].toString(),
							  row[1].toString(),
							  row[2].toString(),
							  row[3].toString()};
				
				list.add(s);
			}
			
		}finally{
			session.close(); 
		}
			
		return result;
	}	
	
	public Double getStockTotal(String locationId,String customerId,Integer[] cargoIdArray,Date bDate,Date eDate){
		
		String locationIdSql = "";
		String customerIdSql = "";
		String cargoIdSql = "";
		    
		if(locationId != null && !locationId.equals("")){
			locationIdSql = "	and cr.WAREHOUSE_ID =  :locationId " ;
		}    
		if(customerId != null && !customerId.equals("")){
			customerIdSql = "	and sr.CUSTOMER_NAME in (:customerId) " ;
		}
		if(cargoIdArray != null && cargoIdArray.length > 0){
			cargoIdSql = "	and cr.CARGO_ID in  (:cargoId) " ;
		}
		
		String sql = 		"	select " +
							"		TRUNCATE(sum(cr.total_weight),1) total_weight  " +
							"	from cargo_record cr ," +
							"		stock_record sr " +
							"	where cr.stock_record_id = sr.id " +
							"	and sr.in_out = 3 " +
							locationIdSql +
							customerIdSql +
							cargoIdSql +
							
					 		" and sr.time >:bDate " +
					 		" and sr.time <:eDate " ;
		
		Session session = null ;
		
		Double result = null;
		try{
			session = this.getSession();
			Query query = session.createSQLQuery(sql)
							.setDate("bDate", bDate)
							.setDate("eDate", eDate);
			
			if(locationId != null && !locationId.equals("")){
				query.setParameter("locationId",locationId);
			}
			if(customerId != null && !customerId.equals("")){
				String[] customerArr = customerId.split(",");
				query.setParameterList("customerId",customerArr);
			}
			if(cargoIdArray != null && cargoIdArray.length > 0){
				query.setParameterList("cargoId",cargoIdArray);
			}
			
			result =(Double) query.uniqueResult();
			
			
		}finally{
			session.close(); 
		}
			
		return result;
		
	}
	
	
	public List<String[]> getStockCategoryList(Integer[] cargoId,Date bDate,Date eDate){		
	
		if(cargoId == null || cargoId.length <= 0 || bDate == null || eDate == null){
			return null;
		}
		
		
		String sql = 	"SELECT "+
						"	customer.name,ifnull(t3.total_weight,0),ifnull(t2.total_weight_in,0),ifnull(t2.total_weight_out,0),ifnull(t3.total_weight,0)+ifnull(t2.total_weight_in,0)+ifnull(t2.total_weight_out,0) "+
						" FROM "+

						"	(SELECT "+
						"		sr.CUSTOMER_NAME cid "+
						"	FROM "+
						"		stock_record sr ,"+
						"		cargo_record cr "+
						"	where "+
						"		sr.id = cr.STOCK_RECORD_ID  "+
						"		AND "+
						"		cr.CARGO_ID IN  (:cargoId)"+ 
								
						"	GROUP BY "+
						"		sr.CUSTOMER_NAME ) t1 "+
						"		left join "+

						"	(SELECT "+
						"		sr.CUSTOMER_NAME cid,"+
						"		sum((cr.total_weight<0)*cr.total_weight) total_weight_out ,"+
						"		sum((cr.total_weight>0)*cr.total_weight) total_weight_in "+
						"	FROM "+
						"		stock_record sr ,"+
						"		cargo_record cr "+
						"	where "+
						"		sr.id = cr.STOCK_RECORD_ID  "+
						"		AND "+
						"		cr.CARGO_ID IN  (:cargoId) "+
						"		AND "+
						"		sr.TIME > :bDate"+
						"		AND "+
						"		sr.TIME< :eDate"+
						"	GROUP BY "+
						"		sr.CUSTOMER_NAME ) t2 using(cid) left  join"+
						"	(SELECT "+
						"		sr.CUSTOMER_NAME cid,"+
						"		sum(cr.total_weight) total_weight "+
						"	FROM "+
						"		stock_record sr ,"+
						"		cargo_record cr "+
						"	where "+
						"		sr.id = cr.STOCK_RECORD_ID "+
						"		AND "+
						"		cr.CARGO_ID IN  (:cargoId)"+ 
						"		AND "+
						"		sr.TIME < :bDate"+
						"	GROUP BY "+
						"		sr.CUSTOMER_NAME ) t3 using(cid) " +
						"  inner join customer on cid = customer.id";
		
		Session session = null ;
		List list = new ArrayList();
		List result = null;
		try{
			session = this.getSession();
			Query query = session.createSQLQuery(sql)
							.setDate("bDate", bDate)
							.setDate("eDate", eDate)
							.setParameterList("cargoId",cargoId);
			
			
			result =query.list();
			
			Iterator it = result.iterator();
			
			while(it.hasNext()){
				Object[] row = (Object[])it.next();
				String[] s = {row[0] == null? "":(row[0]).toString(),
							  row[1] == null? "":((Double)row[1]).toString(),
							  row[2] == null? "":((Double)row[2]).toString(),
							  row[3] == null? "":((Double)row[3]).toString(),
							  row[4] == null? "":((Double)row[4]).toString()
							  };
				
				list.add(s);
			}
			
		}finally{
			session.close(); 
		}
		return list;
	
	
	}
	public List<Object[]> getAccumulatePerCustomer() {
		String sql = "select " +
						"c.id,c.name,sum(cr.total_weight) sum " +
					 "from " +
					 	"customer c," +
					 	"stock_record sr," +
					 	"cargo_record cr " +
					 "where " +
					 	"c.id = sr.customer_name " +
					 	"and " +
					 	"sr.id = cr.stock_record_id " +
					 "group by c.id " +
					 "order by sum desc " ;
					 //"limit 0,10";
		Session session = null ;
		List list = new ArrayList();
		List result = null;
		try{
			session = this.getSession();
			Query query = session.createSQLQuery(sql);
			
			result =query.list();
			
			/*Iterator it = result.iterator();
			
			while(it.hasNext()){
				
				Object[] row = (Object[])it.next();
				
				Double d = 0.0;
				
				if(row[1] != null){
					
					d = (Double)row[1]/1000;
				}
				
				String[] s = {row[0] == null? "":(row[0]).toString(),
							  String.format("%.3f", d)
							  };
				
				list.add(s);
			}*/
			
		}finally{
			session.close(); 
		}
		return result;
	
	
	
	}
	
	public List<String[]> getStockOutInPerCustomer(Date bDate,Date eDate) {
		String sql = "select " +
						"c.id," +
						"c.name," +
						"sum((cr.total_weight<0)*cr.total_weight) total_weight_out ,  " +
						"sum((cr.total_weight>0)*cr.total_weight) total_weight_in,  " +
						"sum(cr.total_weight) total_weight  " +
					 "from " +
					 	"customer c," +
					 	"stock_record sr," +
					 	"cargo_record cr " +
					 "where " +
					 	"c.id = sr.customer_name " +
					 	"and " +
					 	"sr.id = cr.stock_record_id " +
					 	"and " +
					 	"sr.time >= :bDate " +
					 	"and " +
					 	"sr.time <= :eDate " +
					 	//2010-12-07 zsh
						"	and sr.in_out < 2 " +
					 	
					 "group by c.id " +
					 "order by total_weight desc";
		Session session = null ;
		List list = new ArrayList();
		List result = null;
		try{
			session = this.getSession();
			Query query = session.createSQLQuery(sql).setDate("bDate", bDate)
													 .setDate("eDate", eDate);
			        
			result =query.list();
			
			Iterator it = result.iterator();
			
			while(it.hasNext()){
				Object[] row = (Object[])it.next();
				
				Double d1 = 0.0;
				if(row[2] != null && (Double)row[2] != 0.0){
					
					d1 = (Double)row[2]/1000*-1;
				}
				
				Double d2 = 0.0;
				if(row[3] != null && (Double)row[3] != 0.0){
					
					d2 = (Double)row[3]/1000;
				}
				
				Double d3 = 0.0;
				if(row[4] != null && (Double)row[4] != 0.0){
					
					d3 = (Double)row[4]/1000;
				}
				
				String[] s = {row[0] == null? "":(row[0]).toString(),
							  row[1] == null? "":(row[1]).toString(),
									  String.format("%.3f", d1),
									  String.format("%.3f", d2),
									  String.format("%.3f", d3)
							  };
				
				list.add(s);
			}
			
		}finally{
			session.close(); 
		}
		return list;
	
	}
	
	public List<String[]> getStockOutInTotalWeightPerCustomer(Date bDate,Date eDate) {
		String sql = "select customer.ID id,customer.NAME name,t1.total_weight_out totalWeightOut,t1.total_weight_in totalWeightIn,t2.total_weight totalWeight1,t3.total_weight totalWeight2  from ((( customer  left join  " +
					"(select  " +
						"sr.CUSTOMER_NAME id, " +
						"sum((cr.total_weight<0)*cr.total_weight) total_weight_out ,   " +
						"sum((cr.total_weight>0)*cr.total_weight) total_weight_in " +
					"from  " +
					 	"stock_record sr, " +
					 	"cargo_record cr  " +
					 "where  " +
					 	"sr.id = cr.stock_record_id  " +
					 	"and  " +
					 	"sr.time >= :bDate " +
					 	"and  " +
					 	"sr.time <= :eDate " +
					 	"and  " +
						"(sr.in_out < 2 or sr.in_out = 3) " +
					 	"group by sr.customer_name) t1 on customer.ID = t1.id)   left join  " +
			
					"(select  " +
						"sr.CUSTOMER_NAME id, " +
						"sum(cr.total_weight) total_weight  " +
					 "from  " +
					 	"stock_record sr, " +
					 	"cargo_record cr  " +
					 "where  " +
					 	"sr.id = cr.stock_record_id  " +
					 	"and  " +
					 	"sr.time <= :bDate " +
					 	"and  " +
						"(sr.in_out < 2 or sr.in_out = 3)  " +
					 	"group by sr.customer_name) t2  on customer.ID = t2.id) left join  " +

					"(select  " +
						"sr.CUSTOMER_NAME id, " +
						"sum(cr.total_weight) total_weight  " +
					 "from  " +
					 	"stock_record sr, " +
					 	"cargo_record cr  " +
					 "where  " +
					 	"sr.id = cr.stock_record_id  " +
					 	"and  " +
					 	"sr.time <= :eDate " +
					 	"and  " +
						"(sr.in_out < 2 or sr.in_out = 3)  " +
					 	"group by sr.customer_name) t3 on customer.ID = t3.id) where t1.total_weight_out<>0 or t1.total_weight_in<>0 or t2.total_weight<>0 or t3.total_weight<>0 " ;
		Session session = null ;
		List list = new ArrayList();
		List result = null;
		try{
			session = this.getSession();
			Query query = session.createSQLQuery(sql).addScalar("id")
													 .addScalar("name")
													 .addScalar("totalWeightOut")
													 .addScalar("totalWeightIn")
													 .addScalar("totalWeight1")
													 .addScalar("totalWeight2")
													 .setDate("bDate", bDate)
													 .setDate("eDate", eDate);
			        
			result =query.list();
			
			Iterator it = result.iterator();
			
			while(it.hasNext()){
				Object[] row = (Object[])it.next();
				
				Double d1 = 0.0;
				if(row[2] != null && (Double)row[2] != 0.0){
					
					d1 = (Double)row[2]*-1;
				}
				
				Double d2 = 0.0;
				if(row[3] != null && (Double)row[3] != 0.0){
					
					d2 = (Double)row[3];
				}
				
				Double d3 = 0.0;
				if(row[4] != null && (Double)row[4] != 0.0){
					
					d3 = (Double)row[4];
				}
				
				Double d4 = 0.0;
				if(row[5] != null && (Double)row[5] != 0.0){
					
					d4 = (Double)row[5];
				}
				
				String[] s = {row[0] == null? "":(row[0]).toString(),
							  row[1] == null? "":(row[1]).toString(),
									  String.format("%.3f", d1),
									  String.format("%.3f", d2),
									  String.format("%.3f", d3),
									  String.format("%.3f", d4)
							  };
				
				list.add(s);
			}
			
		}finally{
			session.close(); 
		}
		return list;
	
	}
	
	
	public List<Object[]> getStockRecordCount(Date bDate,Date eDate,Short inOut){
		
		String sql = "SELECT " +
				     " 	Count(sr.CUSTOMER_NAME) c," +
				     "	c.NAME " +
				     " FROM " +
				     "	stock_record sr , " +
				     "  customer c " +
				     " WHERE " +
				   
					 " sr.time >= :bDate " +
					 " and " +
					 " sr.time <= :eDate " +
					 " and " +
				     " sr.CUSTOMER_NAME =  c.ID " +
				     " GROUP BY " +
				     " sr.CUSTOMER_NAME " +
				     " order by c desc ";
		
		Session session = null ;
		List list = new ArrayList();
		List result = null;
		try{
			session = this.getSession();
			Query query = session.createSQLQuery(sql)
								 .setDate("bDate", bDate)
								 .setDate("eDate", eDate);
			result =query.list();
			
		}finally{
			session.close(); 
		}
		
		return result;
		
	}
	
	public Double getStockRecordWeight(Integer customerId,Date bDate,Date eDate,Short[] inOut){
		
		String sql = "select sum(cargo_record.total_weight) " + 
					"from stock_record,cargo_record " +
					"WHERE " +
					"stock_record.ID =  cargo_record.STOCK_RECORD_ID " +
					"and " +
					"stock_record.customer_name = :customerId " +
					"and " +
					"stock_record.time > :bDate " +
					"and " +
					"stock_record.time <= :eDate " + 
					"and " +
					"stock_record.in_out in (:inOut) ";
	
		Session session = null ;
		List list = new ArrayList();
		Double result = new Double("0");
		try{
			session = this.getSession();
			Query query = session.createSQLQuery(sql)
								 .setInteger("customerId", customerId)
								 .setDate("bDate", bDate)
								 .setDate("eDate", eDate)
								 .setParameterList("inOut", inOut);
			if(query.uniqueResult() != null ){
				result = (Double)query.uniqueResult();
					
			}else{
				
				result = (double) 0;
			}
			
		}finally{
			session.close(); 
		}
		
		return result; 
		
	}
	
	public String getStockRecordWeight(Integer customerId,
										Date bDate,
										Date eDate,
										Short[] inOut,
										List<Integer> exceptWarehouseIdArray,
										String category,
										List<String> exceptCategoryList){
		
		String exceptWarehouseIdArraySql = "";
		String categorySql = "";
		String exceptCategorySql = "";
		if(exceptWarehouseIdArray != null && exceptWarehouseIdArray.size() > 0){
			exceptWarehouseIdArraySql = "and cargo_record.warehouse_id not in (:exceptWarehouseIdArray)";
		}
		
		if(category != null && !category.equals("")){
			String[] categoryArray = category.split(",");
			categorySql = " and (";
			for(int i = 0;i < categoryArray.length;i++){
				categorySql = categorySql + " cargo.CATEGORY like '" + categoryArray[i] +"' or";
			}
			
			categorySql = categorySql.substring(0,categorySql.length()-2) + ")";
		}
		
		if(exceptCategoryList != null && exceptCategoryList.size() > 0){
			
			exceptCategorySql = " and (";
			for(int i = 0;i < exceptCategoryList.size();i++){
				exceptCategorySql = exceptCategorySql + " cargo.CATEGORY not like '" + (String)exceptCategoryList.get(i) +"' and";
			}
			
			exceptCategorySql = exceptCategorySql.substring(0,exceptCategorySql.length()-3) + ")";
		}
		
		
		String sql = "select sum(cargo_record.total_weight) " + 
					"from stock_record,cargo_record,cargo " +
					"WHERE " +
					"stock_record.ID =  cargo_record.STOCK_RECORD_ID " +
					"and " +
					"cargo_record.cargo_id = cargo.id  "+
					"and " +
					"stock_record.customer_name = :customerId " +
					"and " +
					"stock_record.time > :bDate " +
					"and " +
					"stock_record.time <= :eDate " + 
					"and " +
					"stock_record.in_out in (:inOut) " +
					exceptWarehouseIdArraySql + 
					categorySql +
					exceptCategorySql;
	
		Session session = null ;
		List list = new ArrayList();
		String result = "0";
		try{
			session = this.getSession();
			Query query = session.createSQLQuery(sql)
								 .setInteger("customerId", customerId)
								 .setDate("bDate", bDate)
								 .setDate("eDate", eDate)
								 .setParameterList("inOut", inOut);
			
			if(exceptWarehouseIdArray != null && exceptWarehouseIdArray.size() > 0){
				query.setParameterList("exceptWarehouseIdArray",exceptWarehouseIdArray);
			}
			
			if(query.uniqueResult() != null ){
				result = query.uniqueResult().toString();
					
			}else{
				
				result = "0";
			}
			
		}finally{
			session.close(); 
		}
		
		return result; 
		
	}
	
	public List<StockRecord> getStockRecordList(Integer customerId){
		
		String sql = "select stock_record.id," +
							"stock_record.in_Out," +
							"stock_record.time," +
							"cargo_record.total_weight," +
							"cargo_record.warehouse_id," +
							"cargo.id," +
							"cargo.category " + 
						"from " +
							"stock_record,cargo_record,cargo " +
						"WHERE " +
							"stock_record.ID =  cargo_record.STOCK_RECORD_ID " +
							"and " +
							"cargo_record.cargo_id = cargo.id  "+
							"and " +
							"stock_record.customer_name = :customerId ";
		
		Session session = null ;
		List stockRecordList = new ArrayList<StockRecord>();
		
		try{
		session = this.getSession();
		Query query = session.createSQLQuery(sql)
			 .setInteger("customerId", customerId);
		
		List result =query.list();
		
		Iterator it = result.iterator();
		
		while(it.hasNext()){
			Object[] row = (Object[])it.next();
			StockRecord stockRecord = new StockRecord();
			stockRecord.setId((Integer)row[0]);
			stockRecord.setInOut(Short.valueOf(row[1].toString()));
			stockRecord.setTime((Date)row[2]);
			stockRecord.setTotalWeight((String)row[3]);
			stockRecord.setWarehouseId((Integer)row[4]);
			stockRecord.setCargoId((Integer)row[5]);
			stockRecord.setCategory((String)row[6]);
			
			stockRecordList.add(stockRecord);
		}
		
		}finally{
			session.close(); 
		}
		
		return stockRecordList; 
	
	}
	
	public List<Object> getCustomerStockItems(Integer customerId){
		
		String sql = "select stock_record.id," +
							"stock_record.serial_number," +
							"stock_record.in_Out," +
							"stock_record.time," +
							"SUM(cargo_record.quantity), " + 
							"SUM(cargo_record.total_weight) " + 
						"from " +
							"stock_record left join cargo_record " +
							"on " +
							"stock_record.ID =  cargo_record.STOCK_RECORD_ID " +
						"WHERE " +
							"stock_record.customer_name = :customerId " +
							"group by stock_record.ID";
		
		Session session = null ;
		List stockRecordList = new ArrayList<StockRecord>();
		List result = null;
		try{
		session = this.getSession();
		Query query = session.createSQLQuery(sql)
			 .setInteger("customerId", customerId);
		
		result =query.list();
		
		Iterator it = result.iterator();
		
		while(it.hasNext()){
			Object[] row = (Object[])it.next();
			
		}
		
		}finally{
			session.close(); 
		}
		
		return result; 
	
	}
	
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding StockRecord instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from StockRecord as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public List findByInOut(Object inOut) {
		return findByProperty(IN_OUT, inOut);
	}

	public List findByType(Object type) {
		return findByProperty(TYPE, type);
	}

	public List findByPersonHandling(Object personHandling) {
		return findByProperty(PERSON_HANDLING, personHandling);
	}

	public List findByContractId(Object contractId) {
		return findByProperty(CONTRACT_ID, contractId);
	}

	public List findByCustomerName(Object customerName) {
		return findByProperty(CUSTOMER_NAME, customerName);
	}

	public List findByCreateUser(Object createUser) {
		return findByProperty(CREATE_USER, createUser);
	}

	public List findBySerialNumber(Object serialNumber) {
		return findByProperty(SERIAL_NUMBER, serialNumber);
	}

	public List findAll() {
		log.debug("finding all StockRecord instances");
		try {
			String queryString = "from StockRecord";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public StockRecord merge(StockRecord detachedInstance) {
		log.debug("merging StockRecord instance");
		try {
			StockRecord result = (StockRecord) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(StockRecord instance) {
		log.debug("attaching dirty StockRecord instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(StockRecord instance) {
		log.debug("attaching clean StockRecord instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static StockRecordDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (StockRecordDAO) ctx.getBean("StockRecordDAO");
	}
			
	
}