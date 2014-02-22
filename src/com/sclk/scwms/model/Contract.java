package com.sclk.scwms.model;

import java.util.Date;

/**
 * Contract entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Contract implements java.io.Serializable {

	// Fields

	private Integer id;
	private Customer customer;
	private String serialNumber;
	private String customerName;
	private Date signingDate;
	private Date effectiveDate;
	private Date endDate;
	private String status;
	private String validity;
	private String comment;
	private String type;
	private Date createTime;
	private String createUser;
	private String name;

	// Constructors

	/** default constructor */
	public Contract() {
	}

	/** full constructor */
	public Contract(Customer customer, String serialNumber,
			String customerName, Date signingDate, Date effectiveDate,
			Date endDate, String status, String validity, String comment,
			String type, Date createTime, String createUser, String name) {
		this.customer = customer;
		this.serialNumber = serialNumber;
		this.customerName = customerName;
		this.signingDate = signingDate;
		this.effectiveDate = effectiveDate;
		this.endDate = endDate;
		this.status = status;
		this.validity = validity;
		this.comment = comment;
		this.type = type;
		this.createTime = createTime;
		this.createUser = createUser;
		this.name = name;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getSerialNumber() {
		return this.serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	public String getCustomerName() {
		return this.customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public Date getSigningDate() {
		return this.signingDate;
	}

	public void setSigningDate(Date signingDate) {
		this.signingDate = signingDate;
	}

	public Date getEffectiveDate() {
		return this.effectiveDate;
	}

	public void setEffectiveDate(Date effectiveDate) {
		this.effectiveDate = effectiveDate;
	}

	public Date getEndDate() {
		return this.endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getValidity() {
		return this.validity;
	}

	public void setValidity(String validity) {
		this.validity = validity;
	}

	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCreateUser() {
		return this.createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

}