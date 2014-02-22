package com.sclk.scwms.service;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.sclk.scwms.common.comparator.NormalComparator;
import com.sclk.scwms.dao.UsersDAO;
import com.sclk.scwms.model.Customer;
import com.sclk.scwms.model.Users;

public class UserManager {
	
	private UsersDAO dao;

	public void setDao(UsersDAO dao) {
		this.dao = dao;
	}
	
	public boolean sava(Users d){
		System.out.println(d.getId());
		if(d.getId() == null){
			dao.save(d);
			
		}else{
			
			dao.attachDirty(d);
		}
		return false;
	}
	public List getUsers(){
		
		return dao.findAll();
		
	}

	public Users getUser(Integer id){
		
		return dao.findById(id);
		
	}
	
	public Users loginValidate(String userName,String password){
		Users u = new Users();
		u.setUserName(userName);
		u.setPassword(password);
		List l = dao.findByExample(u);
		if(l != null && l.size() > 0){
			
			return (Users)l.get(0);
		}
		
		return null;
		
	}
	
	public List findBykeyword(String keyword){
		
		List<Customer> l = dao.find(keyword);
		Comparator<Customer> cmp = new NormalComparator();

		Collections.sort(l,cmp);
		return l;
		
	}
}
