package com.sclk.scwms.model;

import java.util.Date;

/**
 * ChargeDetail entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class ChargeDetail implements java.io.Serializable,Cloneable{

	// Fields

	private Integer id;
	private Integer customerId;
	private Integer stockRecordId;
	
	private Date date;
	private Integer type;
	private String chargeType;
	private String chargeRate;
	private Integer chargeId;
	private String description;
	private Date startDate;
	private Date endDate;
	private String weight;
	private String area;
	private String unitPrice;
	private String unitName;
	private String totalPrice;
	private String payable;
	private String Days;
	private boolean confirm;
	
	public static final Integer payment = 1;
	// Constructors

	/** default constructor */
	public ChargeDetail() {
	}

	/** full constructor */
	public ChargeDetail(Integer customerId, Date date, Integer chargeId,
			String description, Date startDate, Date endDate, String weight,
			String area, String unitPrice, String unitName, String totalPrice,
			String payable) {
		this.customerId = customerId;
		this.date = date;
		this.chargeId = chargeId;
		this.description = description;
		this.startDate = startDate;
		this.endDate = endDate;
		this.weight = weight;
		this.area = area;
		this.unitPrice = unitPrice;
		this.unitName = unitName;
		this.totalPrice = totalPrice;
		this.payable = payable;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCustomerId() {
		return this.customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}
	public Integer getStockRecordId() {
		return stockRecordId;
	}

	public void setStockRecordId(Integer stockRecordId) {
		this.stockRecordId = stockRecordId;
	}
	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	

	public Integer getChargeId() {
		return chargeId;
	}

	public void setChargeId(Integer chargeId) {
		this.chargeId = chargeId;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getStartDate() {
		return this.startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return this.endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getWeight() {
		return this.weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getArea() {
		return this.area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getUnitPrice() {
		return this.unitPrice;
	}

	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getUnitName() {
		return this.unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}

	public String getTotalPrice() {
		return this.totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getPayable() {
		return this.payable;
	}

	public void setPayable(String payable) {
		this.payable = payable;
	}

	public String getDays() {
		return Days;
	}

	public void setDays(String days) {
		Days = days;
	}

	public boolean isConfirm() {
		return confirm;
	}

	public void setConfirm(boolean confirm) {
		this.confirm = confirm;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
	
	public String getChargeType() {
		return chargeType;
	}

	public void setChargeType(String chargeType) {
		this.chargeType = chargeType;
	}
	public String getChargeRate() {
		return chargeRate;
	}

	public void setChargeRate(String chargeRate) {
		this.chargeRate = chargeRate;
	}
	public ChargeDetail clone() {
		ChargeDetail chargeDetail = null;
		  try {
			  chargeDetail = (ChargeDetail) super.clone();
		  } catch (CloneNotSupportedException e) {
		   e.printStackTrace();
		  }
		  return chargeDetail;
		 }
}