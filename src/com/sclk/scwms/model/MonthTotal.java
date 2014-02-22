package com.sclk.scwms.model;

import java.util.Date;

/**
 * MonthTotal entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class MonthTotal implements java.io.Serializable {

	// Fields

	private Integer id;
	private Cargo cargo;
	private Date month;
	private String inQuantity;
	private String inWeight;
	private String outQuantity;
	private String outWeight;
	private String balanceQuantity;
	private String balanceWeight;
	private String chargeType;
	// Constructors

	public String getChargeType() {
		return chargeType;
	}

	public void setChargeType(String chargeType) {
		this.chargeType = chargeType;
	}

	/** default constructor */
	public MonthTotal() {
	}

	/** full constructor */
	public MonthTotal(Cargo cargo, Date month, String inQuantity,
			String inWeight, String outQuantity, String outWeight,
			String balanceQuantity, String balanceWeight) {
		this.cargo = cargo;
		this.month = month;
		this.inQuantity = inQuantity;
		this.inWeight = inWeight;
		this.outQuantity = outQuantity;
		this.outWeight = outWeight;
		this.balanceQuantity = balanceQuantity;
		this.balanceWeight = balanceWeight;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Cargo getCargo() {
		return this.cargo;
	}

	public void setCargo(Cargo cargo) {
		this.cargo = cargo;
	}

	public Date getMonth() {
		return this.month;
	}

	public void setMonth(Date month) {
		this.month = month;
	}

	public String getInQuantity() {
		return this.inQuantity;
	}

	public void setInQuantity(String inQuantity) {
		this.inQuantity = inQuantity;
	}

	public String getInWeight() {
		return this.inWeight;
	}

	public void setInWeight(String inWeight) {
		this.inWeight = inWeight;
	}

	public String getOutQuantity() {
		return this.outQuantity;
	}

	public void setOutQuantity(String outQuantity) {
		this.outQuantity = outQuantity;
	}

	public String getOutWeight() {
		return this.outWeight;
	}

	public void setOutWeight(String outWeight) {
		this.outWeight = outWeight;
	}

	public String getBalanceQuantity() {
		return this.balanceQuantity;
	}

	public void setBalanceQuantity(String balanceQuantity) {
		this.balanceQuantity = balanceQuantity;
	}

	public String getBalanceWeight() {
		return this.balanceWeight;
	}

	public void setBalanceWeight(String balanceWeight) {
		this.balanceWeight = balanceWeight;
	}

}