package com.sclk.scwms.model;

import java.sql.Timestamp;
import java.util.Date;

/**
 * AbstractChargeRecord entity provides the base persistence definition of the
 * ChargeRecord entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractChargeRecord implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer customerId;
	private Integer stockRecordId;
	private Integer chargeId;
	private String chargeType;
	private Date date;
	private String weight;
	private String unitPrice;
	private String totalPrice;

	// Constructors

	/** default constructor */
	public AbstractChargeRecord() {
	}

	/** full constructor */
	public AbstractChargeRecord(Integer customerId, Integer stockRecordId,
			Integer chargeId, String chargeType, Timestamp date, String weight,
			String unitPrice, String totalPrice) {
		this.customerId = customerId;
		this.stockRecordId = stockRecordId;
		this.chargeId = chargeId;
		this.chargeType = chargeType;
		this.date = date;
		this.weight = weight;
		this.unitPrice = unitPrice;
		this.totalPrice = totalPrice;
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
		return this.stockRecordId;
	}

	public void setStockRecordId(Integer stockRecordId) {
		this.stockRecordId = stockRecordId;
	}

	public Integer getChargeId() {
		return this.chargeId;
	}

	public void setChargeId(Integer chargeId) {
		this.chargeId = chargeId;
	}

	public String getChargeType() {
		return this.chargeType;
	}

	public void setChargeType(String chargeType) {
		this.chargeType = chargeType;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getWeight() {
		return this.weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
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

}