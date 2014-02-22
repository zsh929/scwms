package com.sclk.scwms.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.sclk.scwms.common.StringUtil;
import com.sclk.scwms.dao.CargoDAO;
import com.sclk.scwms.dao.MonthTotalDAO;
import com.sclk.scwms.model.MonthTotal;

public class MonthTotalManager {
	private MonthTotalDAO dao;

	public void setDao(MonthTotalDAO dao) {
		this.dao = dao;
	}
	private CargoDAO cargoDAO;

	public void setCargoDAO(CargoDAO dao) {
		this.cargoDAO = dao;
	}
	public boolean sava(MonthTotal d){
		
		if(d.getId() == null){
			dao.save(d);
			
		}else{
			
			dao.attachDirty(d);
		}
		return false;
	}
	
	public MonthTotal getMonthTotal(Integer monthTotalId) {
		
		return dao.findById(monthTotalId);
		
	}
}
