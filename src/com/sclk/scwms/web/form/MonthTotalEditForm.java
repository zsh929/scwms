package com.sclk.scwms.web.form;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 * MonthTotal entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class MonthTotalEditForm extends ActionForm {

	// Fields

	private String id;
	private String customerId;
	private String customerName;
	private String cargoId;
	private String cargoName;
	private String month;
	private String inQuantity;
	private String inWeight;
	private String outQuantity;
	private String outWeight;
	private String balanceQuantity;
	private String balanceWeight;
	
	/** 
	 * Method validate
	 * @param mapping
	 * @param request
	 * @return ActionErrors
	 */
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	/** 
	 * Method reset
	 * @param mapping
	 * @param request
	 */
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCargoId() {
		return cargoId;
	}
	public void setCargoId(String cargoId) {
		this.cargoId = cargoId;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getInQuantity() {
		return inQuantity;
	}
	public void setInQuantity(String inQuantity) {
		this.inQuantity = inQuantity;
	}
	public String getInWeight() {
		return inWeight;
	}
	public void setInWeight(String inWeight) {
		this.inWeight = inWeight;
	}
	public String getOutQuantity() {
		return outQuantity;
	}
	public void setOutQuantity(String outQuantity) {
		this.outQuantity = outQuantity;
	}
	public String getOutWeight() {
		return outWeight;
	}
	public void setOutWeight(String outWeight) {
		this.outWeight = outWeight;
	}
	public String getBalanceQuantity() {
		return balanceQuantity;
	}
	public void setBalanceQuantity(String balanceQuantity) {
		this.balanceQuantity = balanceQuantity;
	}
	public String getBalanceWeight() {
		return balanceWeight;
	}
	public void setBalanceWeight(String balanceWeight) {
		this.balanceWeight = balanceWeight;
	}

	public String getCargoName() {
		return cargoName;
	}

	public void setCargoName(String cargoName) {
		this.cargoName = cargoName;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	
}