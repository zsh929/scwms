package com.sclk.scwms.service;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.sclk.scwms.common.comparator.NormalComparator;
import com.sclk.scwms.dao.CustomerDAO;
import com.sclk.scwms.model.Customer;

public class CustomerManager {
	
	private CustomerDAO dao;

	public void setDao(CustomerDAO dao) {
		this.dao = dao;
	}
	
	public boolean sava(Customer d){
		System.out.println(d.getId());
		if(d.getId() == null){
			dao.save(d);
			
		}else{
			
			dao.attachDirty(d);
		}
		return false;
	}
	public List getCustomers(){
		
		List<Customer> l = dao.findAll();
		Comparator<Customer> cmp = new NormalComparator();

		Collections.sort(l,cmp);
		
		return l;
		
	}

	public Customer getCustomer(Integer id){
		
		return dao.findById(id);
		
	}
	
	public List findBykeyword(String keyword){
		
		List<Customer> l = dao.find(keyword);
		Comparator<Customer> cmp = new NormalComparator();

		Collections.sort(l,cmp);
		return l;
		
	}
	
}
