package com.sclk.scwms.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sclk.scwms.dao.CargoDAO;
import com.sclk.scwms.dao.MonthWarehouseDAO;
import com.sclk.scwms.dao.WarehouseDAO;
import com.sclk.scwms.model.MonthWarehouse;
import com.sclk.scwms.model.Warehouse;
import com.sclk.scwms.vo.MonthWarehouseVO;

public class MonthWarehouseManager {
	private MonthWarehouseDAO dao;

	public void setDao(MonthWarehouseDAO dao) {
		this.dao = dao;
	}
	private CargoDAO cargoDAO;

	public void setCargoDAO(CargoDAO dao) {
		this.cargoDAO = dao;
	}
	
	private WarehouseDAO warehouseDAO;

	public void setWarehouseDAO(WarehouseDAO warehouseDAO) {
		this.warehouseDAO = warehouseDAO;
	}
	
	public boolean sava(MonthWarehouse d){
		
		if(d.getId() == null){
			dao.save(d);
			
		}else{
			
			dao.attachDirty(d);
		}
		return false;
	}
	
	public MonthWarehouse getMonthWarehouse(Integer monthWarehouseId) {
		
		return dao.findById(monthWarehouseId);
		
	}
	public List<MonthWarehouseVO> getMonthWarehouseVOList(Integer monthTotalId) {
		
		List<Warehouse> warehouseList = warehouseDAO.findAll();
		List<MonthWarehouseVO> monthWarehouseVOList = new ArrayList();
		Map warehouseMap = new HashMap();
		
		for(Warehouse warehouse:warehouseList){
			warehouseMap.put(warehouse.getId(), warehouse.getName());
			
		}
		
		List<MonthWarehouse> mList = dao.findByMonthTotalId(monthTotalId);
		for(MonthWarehouse m:mList){
			MonthWarehouseVO vo = new MonthWarehouseVO();
			vo.setId(m.getId());
			vo.setMonthTotalId(m.getMonthTotalId());
			vo.setQuantity(m.getQuantity());
			vo.setWarehouseName((String) warehouseMap.get(m.getWarehouseId()));
			vo.setWeight(m.getWeight());
			
			monthWarehouseVOList.add(vo);
		}
		return monthWarehouseVOList;
		
	}
}
