package com.sclk.scwms.service;

import java.util.List;

import com.sclk.scwms.dao.ContractDAO;

public class ContractManager {
	private ContractDAO dao;

	public void setDao(ContractDAO dao) {
		this.dao = dao;
	}
	public List getALLContract(){
		
		return dao.findAll();
		
	}
	
	
}
