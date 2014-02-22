package com.sclk.scwms.service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.sclk.scwms.common.ConfigUtil;
import com.sclk.scwms.common.DateUtil;
import com.sclk.scwms.common.StringUtil;
import com.sclk.scwms.dao.ChargeRecordDAO;
import com.sclk.scwms.dao.SerialNumberDAO;
import com.sclk.scwms.dao.StockRecordDAO;
import com.sclk.scwms.model.CargoRecord;
import com.sclk.scwms.model.Charge;
import com.sclk.scwms.model.ChargeDetail;
import com.sclk.scwms.model.Customer;
import com.sclk.scwms.model.Location;
import com.sclk.scwms.model.SerialNumber;
import com.sclk.scwms.model.StockRecord;
import com.sclk.scwms.model.Syscode;
import com.sclk.scwms.model.Warehouse;
import com.sclk.scwms.vo.CargoVO;
import com.sclk.scwms.vo.MonthTotalVO;
import com.sclk.scwms.vo.StockRecordVO;


public class StockRecordManager {
	private StockRecordDAO dao;
	private SerialNumberDAO serialNumberDAO;
	
	public void setSerialNumberDAO(SerialNumberDAO serialNumberDAO) {
		this.serialNumberDAO = serialNumberDAO;
	}

	public void setDao(StockRecordDAO dao) {
		this.dao = dao;
	}

	private ChargeRecordDAO chargeRecordDAO;
	
	public void setChargeRecordDAO(ChargeRecordDAO chargeRecordDAO) {
		this.chargeRecordDAO = chargeRecordDAO;
	}
	private CargoManager cargoManager;
	
	private SerialNumber serialNumber;
	
	public void setSerialNumber(SerialNumber serialNumber) {
		this.serialNumber = serialNumber;
	}
	
	
	public void setCargoManager(CargoManager cargoManager) {
		this.cargoManager = cargoManager;
	}
	private SyscodeManager syscodeManager;

	public void setSyscodeManager(SyscodeManager manager) {
		this.syscodeManager = manager;
	}
	private WarehouseManager warehouseManager;

    public void setWarehouseManager(WarehouseManager manager) {
    	this.warehouseManager = manager;
    }
    private CustomerManager customerManager;

    public void setCustomerManager(CustomerManager manager) {
    	this.customerManager = manager;
    }
    
    private TagsCargoManager tagsCargoManager;
	public void setTagsCargoManager(TagsCargoManager tagsCargoManager) {
		this.tagsCargoManager = tagsCargoManager;
	}
	
	public boolean sava(StockRecord d){
		
		if(d.getId() == null){
			dao.save(d);
			
		}else{
			
			dao.attachDirty(d);
		}
		return false;
	}
	
	/*public List get(Integer customerId,Date bDate,Date eDate){
		 
		Map<Integer,String> customerMap = new HashMap();
		List<Customer> customerList = customerManager.getCustomers();
		for(Customer customer:customerList){
			customerMap.put(customer.getId(), customer.getName());
			
		}
		
		String[] str = {};
		Map<Integer,Warehouse> map = warehouseManager.getLocation(str);
		
	
		Map<Integer,String> locationMap = new HashMap();
		
		for(Warehouse w:map.values()){
			
			for(Location l:w.getLocationList()){
				locationMap.put(l.getId(),l.getLocationName());
			}
		} 
		
		List list = dao.findById_bDate_eDate(customerId,
											 bDate,
											 eDate);
		
		Iterator it = list.iterator();
		
		while(it.hasNext()){
			StockRecord stockRecord = (StockRecord)it.next();
			stockRecord.setCustomerName((String)customerMap.get(stockRecord.getCustomerId())); 
			double wholeWeight = 0;
			
			Set<CargoRecord> s = stockRecord.getCargoRecords();
			Iterator i = s.iterator();
			while(i.hasNext()){
				CargoRecord c = (CargoRecord)i.next();
				if(c.getTotalWeight() != null && !c.getTotalWeight().equals("")){
					wholeWeight = wholeWeight + Double.valueOf(c.getTotalWeight()).doubleValue();
				}
				
				c.setLocationName(locationMap.get(c.getWarehouseId()));
				
				CargoVO cv = cargoManager.getCargoVO(cargoManager.getCargo(c.getCargoId()));
				c.setCargoVO(cv);
			}
			if(stockRecord.getWholeWeight() == null || stockRecord.getWholeWeight().equals("")){
				stockRecord.setWholeWeight(String.valueOf(wholeWeight));
				
			}
			
			
		}
		Collections.sort(list, Collections.reverseOrder());
		return list;
		
	}*/
	public List get(Integer customerId,Date bDate,Date eDate,Short inOut){
		 
		Map<Integer,String> customerMap = new HashMap();
		List<Customer> customerList = customerManager.getCustomers();
		for(Customer customer:customerList){
			customerMap.put(customer.getId(), customer.getName());
			
		}
		
		String[] str = {};
		/*Map<Integer,Warehouse> map = warehouseManager.getLocation(str);
		
	
		Map<Integer,String> locationMap = new HashMap();
		
		for(Warehouse w:map.values()){
			
			for(Location l:w.getLocationList()){
				locationMap.put(l.getId(),l.getLocationName());
			}
		} */
		
		List list = dao.findById_bDate_eDate(customerId,
											 bDate,
											 eDate,
											 inOut);
		
		Iterator it = list.iterator();
		
		while(it.hasNext()){
			StockRecord stockRecord = (StockRecord)it.next();
			stockRecord.setCustomerName((String)customerMap.get(stockRecord.getCustomerId())); 
			double wholeWeight = 0;
			
			Set<CargoRecord> s = stockRecord.getCargoRecords();
			Iterator i = s.iterator();
			while(i.hasNext()){
				CargoRecord c = (CargoRecord)i.next();
				if(c.getTotalWeight() != null && !c.getTotalWeight().equals("")){
					
					Double d = 0.0; 
					
					 try{   
						 d = Double.valueOf(c.getTotalWeight());
					 }   
					 catch(NumberFormatException e){   
					 
						 d = 0.0;
					 }
					
					
					 wholeWeight = wholeWeight + d.doubleValue();
				}
				
				//c.setLocationName(locationMap.get(c.getWarehouseId()));
				
				//CargoVO cv = cargoManager.getCargoVO(cargoManager.getCargo(c.getCargoId()));
				//c.setCargoVO(cv);
			}
			if(stockRecord.getWholeWeight() == null || stockRecord.getWholeWeight().equals("")){
				stockRecord.setWholeWeight(String.valueOf(wholeWeight));
				stockRecord.setWholeWeight(String.format("%.1f", wholeWeight));
				
			}
			
			
		}
		Collections.sort(list, Collections.reverseOrder());
		return list;
		
	}
	public StringBuffer getBusinessQuantity(Integer customerId,Date bDate,Date eDate,Short inOut){
		
		List<Object[]> l = dao.getStockRecordCount(bDate,eDate,inOut);
		StringBuffer sb = new StringBuffer();
		if(l == null || l.size() <= 0){
			return sb;
		}
		
		Iterator it = l.iterator();
		int i = 0;
		
		int otherSum = 0;
		
		sb.append("[");
		while(it.hasNext()){
			i++;
			Object[] o = (Object[])it.next();
			
			
			if(i < 10){
				sb.append("['");
				sb.append(o[1]);
				sb.append("',");
				sb.append(o[0]);
				sb.append("],");
			}else{
				otherSum += ((BigInteger)o[0]).intValue();
				
			}
			
		}
		if(otherSum > 0){
			
			sb.append("['");
			sb.append("ÆäËû");
			sb.append("',");
			sb.append(otherSum);
			sb.append("]");
		}
		
		sb.append("]");
		return sb;
		
	}
	public List get(String customerId,String bDate,String eDate){
		
		List list = dao.findByProperty(StringUtil.stringToInteger(customerId),
						   DateUtil.stringToDate(bDate),
						   DateUtil.stringToDate(eDate));
		
		Iterator it = list.iterator();
		
		while(it.hasNext()){
			StockRecord stockRecord = (StockRecord)it.next();
			
			double wholeWeight = 0;
			
			Set<CargoRecord> s = stockRecord.getCargoRecords();
			Iterator i = s.iterator();
			while(i.hasNext()){
				CargoRecord c = (CargoRecord)i.next();
				if(c.getTotalWeight() != null && !c.getTotalWeight().equals("")){
					wholeWeight = wholeWeight + Double.valueOf(c.getTotalWeight()).doubleValue();
				}
				CargoVO cv = cargoManager.getCargoVO(cargoManager.getCargo(c.getCargoId()));
				c.setCargoVO(cv);
			}
			if(stockRecord.getWholeWeight() == null || stockRecord.getWholeWeight().equals("")){
				stockRecord.setWholeWeight(String.valueOf(wholeWeight));
				
			}
		}
		Collections.sort(list);
		return list;
		
	}
	
	public List<StockRecord> getStockRecordList(String customerId,String bDate,String eDate){
		
		List list = dao.findByProperty(StringUtil.stringToInteger(customerId),
						   DateUtil.stringToDate(bDate),
						   DateUtil.stringToDate(eDate));
		return list;
	}
	public List<StockRecordVO> getStockRecordList(String customerId,Date bDate,Date eDate){
		
		List list = dao.findByProperty(StringUtil.stringToInteger(customerId),
						   bDate,eDate);
		
		List<StockRecordVO> stockRecordList = new ArrayList<StockRecordVO>();
		Iterator it = list.iterator();
		
		while(it.hasNext()){
			StockRecord stockRecord = (StockRecord)it.next();
			Set<CargoRecord> s = stockRecord.getCargoRecords();
			Iterator i = s.iterator();
			while(i.hasNext()){
				CargoRecord c = (CargoRecord)i.next();
				StockRecordVO v = new StockRecordVO();
				
				v.setId(stockRecord.getId());
				v.setTime(stockRecord.getTime());
				v.setInOut(stockRecord.getInOut());
				v.setCargoId(c.getCargoId());
				v.setQuantity(c.getQuantity());
				v.setTotalWeight(c.getTotalWeight());
				stockRecordList.add(v);
			}
			
			
		}
		Collections.sort(stockRecordList);
		return stockRecordList;
		
	}
	
	public List get(String customerId,String cargoId,String bDate,String eDate){
		
		List list = dao.findByProperty(StringUtil.stringToInteger(customerId),
								StringUtil.stringToInteger(cargoId),
								DateUtil.stringToDate(bDate),
								DateUtil.stringToDate(eDate));
		
		Iterator it = list.iterator();
		
		while(it.hasNext()){
			StockRecord stockRecord = (StockRecord)it.next();
			Set<CargoRecord> s = stockRecord.getCargoRecords();
			Iterator i = s.iterator();
			while(i.hasNext()){
				CargoRecord c = (CargoRecord)i.next();
				CargoVO cv = cargoManager.getCargoVO(cargoManager.getCargo(c.getCargoId()));
				c.setCargoVO(cv);
			}
		}
		Collections.sort(list);
		return list;
		
	}
	
	
	public List<CargoVO> getStockOutList(String customerId,String bDate,String eDate){
		
		List<Syscode> categoryList = syscodeManager.getItemForSelect("category");
		List<Syscode> unityList = syscodeManager.getItemForSelect("unit");
		String[] s = {};
		Map<Integer,Warehouse> map = warehouseManager.getLocation(s);
		
		Map syscodeMap = new HashMap();
		Map customerMap = new HashMap();
		Map<Integer,String> locationMap = new HashMap();
		
		for(Syscode syscode:categoryList){
			syscodeMap.put(syscode.getCodeKey(), syscode.getCodeValue());
			
		}
		for(Syscode syscode:unityList){
			syscodeMap.put(syscode.getCodeKey(), syscode.getCodeValue());
			
		}
		for(Warehouse w:map.values()){
			
			for(Location l:w.getLocationList()){
				locationMap.put(l.getId(),l.getLocationName());
			}
		} 
		
		
		List<CargoVO> l = dao.getCustomerInventoryList(customerId,bDate,eDate);
		
		for(CargoVO vo:l){
			vo.setCategory((String) syscodeMap.get(vo.getCategory()));
			vo.setUnit((String) syscodeMap.get(vo.getUnit()));
			
			String locationName = (String) locationMap.get(StringUtil.stringToInteger(vo.getLocationId()));
			
			vo.setLocationName(locationName == null ? "":locationName);
			
		}
		
		return l;
		
		
	}
	
	public List<CargoVO> getCustomerInventoryList(String customerId,String bDate,String eDate,boolean isDiscriminateLocation){
		
		List<Syscode> categoryList = syscodeManager.getItemForSelect("category");
		List<Syscode> unityList = syscodeManager.getItemForSelect("unit");
		String[] s = {};
		Map<Integer,Warehouse> map = warehouseManager.getLocation(s);
		
		Map syscodeMap = new HashMap();
		Map<String,String> customerMap = new HashMap();
		Map<Integer,String> locationMap = new HashMap();
		
		for(Syscode syscode:categoryList){
			syscodeMap.put(syscode.getCodeKey(), syscode.getCodeValue());
			
		}
		for(Syscode syscode:unityList){
			syscodeMap.put(syscode.getCodeKey(), syscode.getCodeValue());
			
		}
		for(Warehouse w:map.values()){
			
			for(Location l:w.getLocationList()){
				locationMap.put(l.getId(),l.getLocationName());
			}
		} 
		
		
		List<Customer> customerList = customerManager.getCustomers();
		for(Customer customer:customerList){
			customerMap.put(customer.getId().toString(), customer.getName());
			
		}
		
		List<CargoVO> l = dao.getCustomerInventoryList(customerId,bDate,eDate,isDiscriminateLocation);
		
		for(CargoVO vo:l){
			vo.setCategory((String) syscodeMap.get(vo.getCategory()));
			vo.setUnit((String) syscodeMap.get(vo.getUnit()));
			vo.setCustomerName(customerMap.get(vo.getCustomerId()));
			if(isDiscriminateLocation){
				vo.setLocationName((String) locationMap.get(StringUtil.stringToInteger(vo.getLocationId())));
			}else{
				
				vo.setLocationName("");
			}
		}
		
		return l;
		
		
	}
	
	public List<CargoVO> getWarehouseInventoryList(String warehouseId){
		
		List<Syscode> categoryList = syscodeManager.getItemForSelect("category");
		List<Syscode> unityList = syscodeManager.getItemForSelect("unit");
		String[] s = {};
		Map<Integer,Warehouse> map = warehouseManager.getLocation(s);
		List<Customer> customerList = customerManager.getCustomers();
		
		Map syscodeMap = new HashMap();
		Map customerMap = new HashMap();
		Map<Integer,String> locationMap = new HashMap();
		
		for(Syscode syscode:categoryList){
			syscodeMap.put(syscode.getCodeKey(), syscode.getCodeValue());
			
		}
		for(Syscode syscode:unityList){
			syscodeMap.put(syscode.getCodeKey(), syscode.getCodeValue());
			
		}
		for(Warehouse w:map.values()){
			
			for(Location l:w.getLocationList()){
				locationMap.put(l.getId(),l.getLocationName());
			}
		} 
		for(Customer customer:customerList){
			customerMap.put(customer.getId().toString(), customer.getName());
			
		}
		
		List<CargoVO> l = dao.getWarehouseInventoryList(warehouseId);
		
		for(CargoVO vo:l){
			vo.setCategory((String) syscodeMap.get(vo.getCategory()));
			vo.setUnit((String) syscodeMap.get(vo.getUnit()));
			vo.setLocationName((String) locationMap.get(StringUtil.stringToInteger(vo.getLocationId())));
			vo.setCustomerName((String)customerMap.get(vo.getCustomerId()));
		}
		
		return l;
		
		
	}
	public List<MonthTotalVO> getCargoRecordTotalList(String customerId,Date bDate,Date eDate,String tagsId_str,String isAll){
		String[] tags_arr = null;
		if(tagsId_str != null && !tagsId_str.equals("")){
			tags_arr = tagsId_str.split("-");
		}
		return dao.getCargoRecordTotalList(customerId, bDate, eDate,tags_arr,StringUtil.stringToBoolean(isAll));
	}
	public StockRecord getStockRecord(Integer stockRecordId){
		 
		Map<Integer,String> customerMap = new HashMap();
		List<Customer> customerList = customerManager.getCustomers();
		for(Customer customer:customerList){
			customerMap.put(customer.getId(), customer.getName());
			
		}
		
		String[] str = {};
		Map<Integer,Warehouse> map = warehouseManager.getLocation(str);
		
	
		Map<Integer,String> locationMap = new HashMap();
		
		for(Warehouse w:map.values()){
			
			for(Location l:w.getLocationList()){
				locationMap.put(l.getId(),l.getLocationName());
			}
		} 
		
		StockRecord stockRecord = dao.findById(stockRecordId);
		
		stockRecord.setCustomerName((String)customerMap.get(stockRecord.getCustomerId())); 
		
		double wholeWeight = 0;
			
		Set<CargoRecord> s = stockRecord.getCargoRecords();
		Iterator i = s.iterator();
		while(i.hasNext()){
			CargoRecord c = (CargoRecord)i.next();
			if(c.getTotalWeight() != null && !c.getTotalWeight().equals("")){
				
				Double d = 0.0; 
				
				 try{   
					 d = Double.valueOf(c.getTotalWeight());
				 }   
				 catch(NumberFormatException e){   
				 
					 d = 0.0;
				 }
				
				
				wholeWeight = wholeWeight + d.doubleValue();
			}
				
			c.setLocationName(locationMap.get(c.getWarehouseId()));
				
			CargoVO cv = cargoManager.getCargoVO(cargoManager.getCargo(c.getCargoId()));
			c.setCargoVO(cv);
		}
		if(stockRecord.getWholeWeight() == null || stockRecord.getWholeWeight().equals("")){
			stockRecord.setWholeWeight(String.valueOf(wholeWeight));
			
		}
		
		return stockRecord;
		
	}
	
	public List<StockRecord> validateUnique(StockRecord instance){
		List<StockRecord> list = null;
		list = dao.findByExample(instance);
		return list ;
	
	}
	
	public void cancelStockRecord(StockRecord instance){
		
		dao.attachDirty(instance);
	
	
	}

	public void deleteStockRecord(StockRecord instance){
		
		dao.delete(instance);
	
	
	}
	
	public String getSerialNumber(String customerId,short stockType){
		String serialNumber = "";
		Integer i = new Integer(1);
		serialNumber = serialNumberDAO.findById(i).getSerialNumber();
		
		return serialNumber;
	}

	public List getCustomerStockItems(String customerId,Date bDate,Date eDate){
		
		List list = new ArrayList();
		
		List customerStockItems = dao.getCustomerStockItems(StringUtil.stringToInteger(customerId));
		List chargeRecordItems = chargeRecordDAO.getChargeRecordItems(StringUtil.stringToInteger(customerId));
		
		Iterator it = customerStockItems.iterator();
		
		
		
		
		while(it.hasNext()){
			Object[] row = (Object[])it.next();
			Date date = (Date)row[3];
			if(!date.before(bDate) && date.before(eDate)){
				
				String str[] = new String[10];
				
				str[0] = row[0].toString();
				str[1] = row[1].toString();
				str[2] = row[2].toString();
				str[3] = DateUtil.dayToString((Date)row[3]);
				str[4] = row[4].toString();
				str[5] = row[5].toString();
				Iterator it1 = chargeRecordItems.iterator();
				while(it1.hasNext()){
					Object[] row1 = (Object[])it1.next();
					if(row[0].toString().equals(row1[0].toString())){
						str[6] = row1[1].toString();
						if(row1[1].toString().equals("chargeType.5")){
							str[7] = row1[2].toString();
						}else if(row1[1].toString().equals("chargeType.6")){
							str[8] = row1[2].toString();
						}else if(row1[1].toString().equals("chargeType.7")){
							str[9] = row1[2].toString();
						}
						
						
						
					}
				}
				
				list.add(str);
			}
		}
		
		
		return list;
	}
	
	public Double getInventoryWeight (String customerId,Date bDate,Date eDate){
		
		ChargeDetail chargeDetail = new ChargeDetail();
		
		//Date startDate = DateUtil.getDayOfMonth(date,chargeDate1,-1);
		//Date endDate = DateUtil.getDayOfMonth(date,chargeDate1,0);
		Short[] inOut = {StockRecord.stockIn,StockRecord.stockOut,StockRecord.stockEqual}; 
		Double  stockRecordWeight = dao.getStockRecordWeight(StringUtil.stringToInteger(customerId),bDate,eDate,inOut);
				
		return stockRecordWeight;
		
	}
	
}
