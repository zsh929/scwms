package com.sclk.scwms.service;

import java.util.List;

import com.sclk.scwms.dao.PostionRecordDAO;
import com.sclk.scwms.dao.UsersDAO;
import com.sclk.scwms.model.Customer;
import com.sclk.scwms.model.Users;

public class StockPostionManager {
	
	private PostionRecordDAO postionRecordDAO;

	public void setPostionRecordDAO(PostionRecordDAO dao) {
		this.postionRecordDAO = dao;
	}
	
	
	
	
	public List get(){
		return postionRecordDAO.findBy();
		
	}
}
