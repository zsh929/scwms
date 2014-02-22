package com.sclk.scwms.model;

import java.util.Date;

/**
 * Charge entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Charge implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer customerId;
	private String type;
	private String description;
	private String category;
	private String unit;
	private Integer warehouseId;
	private String area;
	private Integer chargeDate1;
	private Integer chargeDate2;
	private String unitPrice;
	private String totalPrice;
	private Date createTime;
	private Date effectiveDate;
	private Date expiryDate;
	private Integer status;
	private Integer chargeMethod;

	// Constructors

	

	/** default constructor */
	public Charge() {
	}

	/** full constructor */
	public Charge(Integer customerId, String type, Integer warehouseId,
			String area, Integer chargeDate1, Integer chargeDate2,
			String unitPrice, String totalPrice, Date createTime,
			Date effectiveDate, Date expiryDate, Integer status) {
		this.customerId = customerId;
		this.type = type;
		this.unit = unit;
		this.warehouseId = warehouseId;
		this.area = area;
		this.chargeDate1 = chargeDate1;
		this.chargeDate2 = chargeDate2;
		this.unitPrice = unitPrice;
		this.totalPrice = totalPrice;
		this.createTime = createTime;
		this.effectiveDate = effectiveDate;
		this.expiryDate = expiryDate;
		this.status = status;
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

	

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getWarehouseId() {
		return this.warehouseId;
	}

	public void setWarehouseId(Integer warehouseId) {
		this.warehouseId = warehouseId;
	}

	public String getArea() {
		return this.area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public Integer getChargeDate1() {
		return this.chargeDate1;
	}

	public void setChargeDate1(Integer chargeDate1) {
		this.chargeDate1 = chargeDate1;
	}

	public Integer getChargeDate2() {
		return this.chargeDate2;
	}

	public void setChargeDate2(Integer chargeDate2) {
		this.chargeDate2 = chargeDate2;
	}

	public String getUnitPrice() {
		return this.unitPrice;
	}

	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getTotalPrice() {
		return this.totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getEffectiveDate() {
		return this.effectiveDate;
	}

	public void setEffectiveDate(Date effectiveDate) {
		this.effectiveDate = effectiveDate;
	}

	public Date getExpiryDate() {
		return this.expiryDate;
	}

	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Integer getChargeMethod() {
		return chargeMethod;
	}

	public void setChargeMethod(Integer chargeMethod) {
		this.chargeMethod = chargeMethod;
	}
	
	

}