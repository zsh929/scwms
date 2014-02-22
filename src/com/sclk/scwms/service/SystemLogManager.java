package com.sclk.scwms.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.sclk.scwms.common.DateUtil;
import com.sclk.scwms.dao.SystemLogDAO;
import com.sclk.scwms.dao.UsersDAO;
import com.sclk.scwms.model.Customer;
import com.sclk.scwms.model.SystemLog;
import com.sclk.scwms.model.Users;

public class SystemLogManager {
	
	private SystemLogDAO systemLogDAO;

	public void setSystemLogDAO(SystemLogDAO systemLogDAO) {
		this.systemLogDAO = systemLogDAO;
	}
	
	public boolean sava(SystemLog systemLog){
		//System.out.println(d.getId());
		if(systemLog.getId() == null){
			systemLogDAO.save(systemLog);
			
		}else{
			
			systemLogDAO.attachDirty(systemLog);
		}
		return false;
	}
	public List getSystemLogs(){
		
		return systemLogDAO.findAll();
		
	}

	public SystemLog getSystemLog(Integer id){
		
		return systemLogDAO.findById(id);
		
	}
	public List<SystemLog> getSystemLogs(String startDate,String endDate,String type){
		Date sDate = DateUtil.stringToDate(startDate);
		Date eDate = DateUtil.stringToDate(endDate);
		
		List<SystemLog> list = new ArrayList(); 
		list = systemLogDAO.findBystartDate_endDate_type(sDate,eDate,type);
		
		return list;
		
	}

	public SystemLog getSystemLog(String sessionId){
		
		return systemLogDAO.findBySessionId(sessionId);
		
	}
}
