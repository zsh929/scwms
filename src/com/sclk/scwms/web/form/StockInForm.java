/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.sclk.scwms.web.form;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/** 
 * MyEclipse Struts
 * Creation date: 03-25-2010
 * 
 * XDoclet definition:
 * @struts.form name="stockInForm"
 */
public class StockInForm extends ActionForm {
	/*
	 * Generated fields
	 */

	/** type property */
	private String type;

	/** time property */
	private String time;

	/** customerName property */
	private String customerName;

	/** personHandling property */
	private String personHandling;
	private List userList;
	/** inOut property */
	private Short inOut;

	/** serialNumber property */
	private String serialNumber;

	/** id property */
	private String id;

	private List cargoList;
	private String customerJsonList;
	private String customerId;
	private String wholeWeight;
	
	private String batchNumber;
	private String dateProduce;
	private String postionQuantity;
	public String getPostionQuantity() {
		return postionQuantity;
	}

	public void setPostionQuantity(String postionQuantity) {
		this.postionQuantity = postionQuantity;
	}

	private String index;
	
	private String verify;
	
	

	private String chargeWeight;
	
	
	/*
	 * Generated Methods
	 */

	
	

	public String getChargeWeight() {
		return chargeWeight;
	}

	public void setChargeWeight(String chargeWeight) {
		this.chargeWeight = chargeWeight;
	}

	public String getIndex() {
		return index;
	}

	public void setIndex(String index) {
		this.index = index;
	}

	public String getWholeWeight() {
		return wholeWeight;
	}

	public void setWholeWeight(String wholeWeight) {
		this.wholeWeight = wholeWeight;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public List getCargoList() {
		return cargoList;
	}

	public void setCargoList(List cargoList) {
		this.cargoList = cargoList;
	}

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

	/** 
	 * Returns the type.
	 * @return String
	 */
	public String getType() {
		return type;
	}

	/** 
	 * Set the type.
	 * @param type The type to set
	 */
	public void setType(String type) {
		this.type = type;
	}

	

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	/** 
	 * Returns the customerName.
	 * @return String
	 */
	public String getCustomerName() {
		return customerName;
	}

	/** 
	 * Set the customerName.
	 * @param customerName The customerName to set
	 */
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	/** 
	 * Returns the personHandling.
	 * @return String
	 */
	public String getPersonHandling() {
		return personHandling;
	}

	/** 
	 * Set the personHandling.
	 * @param personHandling The personHandling to set
	 */
	public void setPersonHandling(String personHandling) {
		this.personHandling = personHandling;
	}

	/** 
	 * Returns the inOut.
	 * @return Short
	 */
	public Short getInOut() {
		return inOut;
	}

	/** 
	 * Set the inOut.
	 * @param inOut The inOut to set
	 */
	public void setInOut(Short inOut) {
		this.inOut = inOut;
	}

	/** 
	 * Returns the serialNumber.
	 * @return String
	 */
	public String getSerialNumber() {
		return serialNumber;
	}

	/** 
	 * Set the serialNumber.
	 * @param serialNumber The serialNumber to set
	 */
	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	/** 
	 * Returns the id.
	 * @return String
	 */
	public String getId() {
		return id;
	}

	/** 
	 * Set the id.
	 * @param id The id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	

	public String getCustomerJsonList() {
		return customerJsonList;
	}

	public void setCustomerJsonList(String customerJsonList) {
		this.customerJsonList = customerJsonList;
	}

	public List getUserList() {
		return userList;
	}

	public void setUserList(List userList) {
		this.userList = userList;
	}

	public String getBatchNumber() {
		return batchNumber;
	}

	public void setBatchNumber(String batchNumber) {
		this.batchNumber = batchNumber;
	}

	public String getDateProduce() {
		return dateProduce;
	}

	public void setDateProduce(String dateProduce) {
		this.dateProduce = dateProduce;
	}

	public String getVerify() {
		return verify;
	}

	public void setVerify(String verify) {
		this.verify = verify;
	}

}
