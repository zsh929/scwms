package com.sclk.scwms.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.sclk.scwms.dao.LocationDAO;
import com.sclk.scwms.dao.WarehouseDAO;
import com.sclk.scwms.model.Customer;
import com.sclk.scwms.model.Location;
import com.sclk.scwms.model.Syscode;
import com.sclk.scwms.model.Warehouse;
import com.sclk.scwms.vo.WarehouseVO;

public class WarehouseManager {
	private WarehouseDAO dao;

	public void setDao(WarehouseDAO dao) {
		this.dao = dao;
	}
	private SyscodeManager syscodeManager;

	public void setSyscodeManager(SyscodeManager manager) {
		this.syscodeManager = manager;
	}
	private LocationDAO locationDAO;

	public void setLocationDAO(LocationDAO locationDAO) {
		this.locationDAO = locationDAO;
	}
	
	public boolean sava(Warehouse d){
		System.out.println(d.getId());
		if(d.getId() == null){
			dao.save(d);
			
		}else{
			
			dao.attachDirty(d);
		}
		return false;
	}
	public boolean savaLocation(Location d){
		
		if(d.getId() == null){
			locationDAO.save(d);
			
		}else{
			
			locationDAO.attachDirty(d);
		}
		return false;
	}
	public Warehouse getMainWarehouse(Integer id){
		List l = null;
		Warehouse  w = dao.findById(id);
		
		if(w != null){
			String parentKey = w.getSerialKey();
			l = dao.findByParentKey(parentKey);
		}
		
		Collections.sort(l);

		
		List vl = getWarehouseVOList(l);
		w.setSubWarehouseList(vl);
		return w;
	}
	
	public List getMainWarehouseList(){
		List l = null;
		l = dao.findByParentKey("0");
		Collections.sort(l);
		return l;
	}
	public Warehouse findByParentKey(String serialKey){
		List l = null;
		l = dao.findBySerialKey(serialKey);
		if(l != null && l.size() > 0){
			return (Warehouse) l.get(0);
		}
		return null;
	}
	public Warehouse getWarehouse(Integer id){
	
		return dao.findById(id);
	}    
	
	public List<WarehouseVO> getWarehouseVOList(List<Warehouse> l){
		
		List<Syscode> warehouseTypeList = syscodeManager.getItemForSelect("warehouseType");
		
		List<WarehouseVO> warehouseVOList = new ArrayList<WarehouseVO>();
		
		Map syscodeMap = new HashMap();
		
		for(Syscode syscode:warehouseTypeList){
			syscodeMap.put(syscode.getCodeKey(), syscode.getCodeValue());
			
		}
		
		for(Warehouse warehouse:l){
			WarehouseVO c = new WarehouseVO();
			c.setId(warehouse.getId());
			c.setName(warehouse.getName());
			c.setSerialNumber(warehouse.getSerialNumber());
			c.setSerialKey(warehouse.getSerialKey());
			c.setParentKey(warehouse.getParentKey());
			c.setType((String) syscodeMap.get(warehouse.getType()));
			c.setTemperature(warehouse.getTemperature());
			c.setSize(warehouse.getSize());
			warehouse.getOrderId();
			c.setArea(warehouse.getArea());
			c.setVolume(warehouse.getVolume());
			c.setLength(warehouse.getLength());
			c.setWidth(warehouse.getWidth());
			c.setHeight(warehouse.getHeight());
			c.setMemo(warehouse.getMemo());
			c.setSubWarehouseList(warehouse.getSubWarehouseList());
			warehouseVOList.add(c);
		}
		
		return warehouseVOList;
		
	}
	public List<WarehouseVO> getWarehouseList(){
		
		List<Syscode> warehouseTypeList = syscodeManager.getItemForSelect("warehouseType");
		List<WarehouseVO> lvo = null;
		Map syscodeMap = new HashMap();
		
		for(Syscode syscode:warehouseTypeList){
			syscodeMap.put(syscode.getCodeKey(), syscode.getCodeValue());
			
		}
		
		List<Warehouse> l = null;
		l = dao.findByParentKey("0");
		
		Collections.sort(l);
		
		lvo = getWarehouseVOList(l);
		for(WarehouseVO warehouseVO:lvo){
			List<Warehouse> sl = null;
			if(warehouseVO != null){
				String parentKey = warehouseVO.getSerialKey();
				sl = dao.findByParentKey(parentKey);
				Collections.sort(sl);
				warehouseVO.setSubWarehouseList(getWarehouseVOList(sl));
			}		
		}
		return lvo;
	}
	
	public List<WarehouseVO> getWarehouseListWithTotalWeight (){
		
		Map<Integer,String[]> map = dao.getTotalWeightPerWarehouse();
		List<WarehouseVO> l = getWarehouseList();
		for(WarehouseVO w:l){
			double wholeWeight = 0;
			for(WarehouseVO vo : w.getSubWarehouseList()){
				if(map.containsKey(vo.getId())){
					String[] s = map.get(vo.getId());
					vo.setTotalWeight(s[1]);
					wholeWeight = wholeWeight + Double.valueOf(s[1]);
				}
			}
			w.setTotalWeight(String.valueOf(wholeWeight));
			
		}
		
		return l;
		
	}
	
	public List<WarehouseVO> getWarehouseListWithTotalWeightAndCustomer (){
	
		List<WarehouseVO> warehouseVOList = getWarehouseListWithTotalWeight();
		
		List l = dao.getCustomersPerWarehouse();
		
		Iterator it = l.iterator();
		
		while(it.hasNext()){
			Object[] row = (Object[])it.next();
			
			String customerName = (String)row[0];
			//int customerId = ((Integer)row[1]);
			int locationId = ((Integer)row[1]);
			
			for(WarehouseVO w:warehouseVOList){
				
				for(WarehouseVO vo : w.getSubWarehouseList()){
					if(vo.getId() == locationId){
						Customer c = new Customer();
						c.setName(customerName);
						//c.setId(customerId);
						vo.getCustomerList().add(c);
						break;
					}
				
				}
			}
			
		}
		
		
		
		List l1 = null;
		l1 = dao.getCustomersPerWarehouseFromMemo();
		Iterator it1 = l1.iterator();
		
		while(it1.hasNext()){
			Object[] row1 = (Object[])it1.next();
			
			int locationId = ((Integer)row1[0]);
			String memo = (String)row1[1];
			
			int p1 = memo.indexOf("<");
			
			int p2 = memo.indexOf(">");
			
			String customerName = memo.substring(p1+1,p2);
			for(WarehouseVO w:warehouseVOList){
				
				for(WarehouseVO vo : w.getSubWarehouseList()){
					if(vo.getId() == locationId){
						Customer c = new Customer();
						c.setName(customerName);
						//c.setId(customerId);
						vo.getCustomerList().add(c);
						break;
					}
				
				}
			}
			
			
		}
		
		
		
		
		return warehouseVOList;
		
	}
	
	public List getLocationList(Integer warehouseId){
		List l = null;
		l = locationDAO.findByWarehouseId(warehouseId);
		
		return l;
	}
	
	public Location getLocation(Integer locationId){
		
		
		return locationDAO.findById(locationId);
		
	}
	
	public Map getLocation(String[] warehouseId){
		
		
		return dao.getWarehouseList(warehouseId);
		
	}
	public Map<Integer,String> getLocationMap(String[] warehouseId){
	
		Map<Integer,Warehouse> map = getLocation(warehouseId);
		
		
		Map<Integer,String> locationMap = new HashMap();
		
		for(Warehouse w:map.values()){
			
			for(Location l:w.getLocationList()){
				locationMap.put(l.getId(),l.getLocationName());
			}
		}
		return locationMap; 
	}
	
}
