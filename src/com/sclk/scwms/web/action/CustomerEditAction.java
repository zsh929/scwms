/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.sclk.scwms.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.sclk.scwms.common.StringUtil;
import com.sclk.scwms.model.Customer;
import com.sclk.scwms.service.CustomerManager;
import com.sclk.scwms.service.SyscodeManager;
import com.sclk.scwms.web.form.CustomerEditForm;

/** 
 * MyEclipse Struts
 * Creation date: 03-23-2010
 * 
 * XDoclet definition:
 * @struts.action path="/customer" name="customerForm" input="/jsp/customer.jsp" parameter="method" scope="request" validate="true"
 * @struts.action-forward name="init" path="/jsp/customer.jsp"
 */
public class CustomerEditAction extends BaseAction {
	
	private CustomerManager manager;

    public void setManager(CustomerManager manager) {
    	this.manager = manager;
    }
    private SyscodeManager scmanager;

    public void setScmanager(SyscodeManager manager) {
    	this.scmanager = manager;
    }
	/*
	 * Generated Methods
	 */

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward init(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		CustomerEditForm customerEditForm = (CustomerEditForm) form;// TODO Auto-generated method stub
		
		String id  = request.getParameter("id");
		
		Integer customerId = StringUtil.stringToInteger(id);;
		if(customerId != null){
		
			Customer customer = manager.getCustomer(customerId);		
			
			customerEditForm.setId(customer.getId().toString());
			customerEditForm.setName(customer.getName());
			customerEditForm.setContact(customer.getContact());
			customerEditForm.setPhoneNumber1(customer.getPhoneNumber1());
			customerEditForm.setPhoneNumber2(customer.getPhoneNumber2());
			customerEditForm.setFax(customer.getFax());
			customerEditForm.setAccount(customer.getAccount());
			customerEditForm.setPostcode(customer.getPostcode());
			customerEditForm.setDutyId(customer.getDutyId());
			customerEditForm.setOpeningBank(customer.getOpeningBank());
			customerEditForm.setAccount(customer.getAccount());
			customerEditForm.setType(customer.getType());
			customerEditForm.setMemo(customer.getMemo());
			customerEditForm.setShortName(customer.getShortName());
			customerEditForm.setSymbol(customer.getSymbol());
		}
		List typeList = scmanager.getChildren("customerType");
		customerEditForm.setTypeList(typeList);
		return mapping.findForward("init");
	}
	
	public ActionForward save(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		CustomerEditForm customerEditForm = (CustomerEditForm) form;// TODO Auto-generated method stub
		
		Customer c = new Customer();
		
		c.setId(StringUtil.stringToInteger(customerEditForm.getId()));
		c.setName(customerEditForm.getName());
		c.setContact(customerEditForm.getContact());
		c.setPhoneNumber1(customerEditForm.getPhoneNumber1());
		c.setPhoneNumber2(customerEditForm.getPhoneNumber2());
		c.setFax(customerEditForm.getFax());
		c.setAddress(customerEditForm.getAccount());
		c.setPostcode(customerEditForm.getPostcode());
		c.setDutyId(customerEditForm.getDutyId());
		c.setOpeningBank(customerEditForm.getOpeningBank());
		c.setAccount(customerEditForm.getAccount());
		c.setType(customerEditForm.getType());
		c.setMemo(customerEditForm.getMemo());
		c.setShortName(customerEditForm.getShortName());
		c.setSymbol(customerEditForm.getSymbol());
		manager.sava(c);
		return mapping.findForward(success);
	}
	
	public ActionForward view(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		CustomerEditForm customerEditForm = (CustomerEditForm) form;// TODO Auto-generated method stub
		
		String id  = request.getParameter("id");
		
		Integer customerId = StringUtil.stringToInteger(id);;
		if(customerId != null){
		
			Customer customer = manager.getCustomer(customerId);		
			
			customerEditForm.setId(customer.getId().toString());
			customerEditForm.setName(customer.getName());
			customerEditForm.setContact(customer.getContact());
			customerEditForm.setPhoneNumber1(customer.getPhoneNumber1());
			customerEditForm.setPhoneNumber2(customer.getPhoneNumber2());
			customerEditForm.setFax(customer.getFax());
			customerEditForm.setAccount(customer.getAccount());
			customerEditForm.setPostcode(customer.getPostcode());
			customerEditForm.setDutyId(customer.getDutyId());
			customerEditForm.setOpeningBank(customer.getOpeningBank());
			customerEditForm.setAccount(customer.getAccount());
			customerEditForm.setType(customer.getType());
			customerEditForm.setMemo(customer.getMemo());
			customerEditForm.setShortName(customer.getShortName());
			customerEditForm.setSymbol(customer.getSymbol());
		}
		List typeList = scmanager.getChildren("customerType");
		customerEditForm.setTypeList(typeList);
		return mapping.findForward("view");
	}
	
}







