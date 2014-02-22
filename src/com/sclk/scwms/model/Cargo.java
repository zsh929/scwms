package com.sclk.scwms.model;

import java.util.HashSet;
import java.util.Set;

/**
 * Cargo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Cargo implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String category;
	private String size;
	private String unit;
	private String weight;
	private String number;
	private String customerId;
	private String chargeType;
	private String grossWeight;
	private Set monthTotals = new HashSet(0);
	// Constructors

	public Set getMonthTotals() {
		return monthTotals;
	}

	public void setMonthTotals(Set monthTotals) {
		this.monthTotals = monthTotals;
	}

	/** default constructor */
	public Cargo() {
	}

	/** full constructor */
	public Cargo(String name, String category, String size, String unit,
			String weight, String number) {
		this.name = name;
		this.category = category;
		this.size = size;
		this.unit = unit;
		this.weight = weight;
		this.number = number;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return this.category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSize() {
		return this.size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getUnit() {
		return this.unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getWeight() {
		return this.weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getNumber() {
		return this.number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getChargeType() {
		return chargeType;
	}

	public void setChargeType(String chargeType) {
		this.chargeType = chargeType;
	}

	public String getGrossWeight() {
		return grossWeight;
	}

	public void setGrossWeight(String grossWeight) {
		this.grossWeight = grossWeight;
	}

}