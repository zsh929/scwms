package com.sclk.scwms.vo;

import java.util.Date;
import java.util.List;

/**
 * Cargo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class MonthTotalVO implements java.io.Serializable {

	private Integer id;
	private Date month;
	private Integer cargoId;
	
	private String cargoName;
	private String number;
	private String weight;
	private String unit;

	private String inQuantity;
	private String inWeight;
	private String outQuantity;
	private String outWeight;
	private String balanceQuantity;
	private String balanceWeight;
	private String chargeType;
	private List monthWarehouseList;
	public List getMonthWarehouseList() {
		return monthWarehouseList;
	}
	public void setMonthWarehouseList(List monthWarehouseList) {
		this.monthWarehouseList = monthWarehouseList;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getMonth() {
		return month;
	}
	public void setMonth(Date month) {
		this.month = month;
	}
	public Integer getCargoId() {
		return cargoId;
	}
	public void setCargoId(Integer cargoId) {
		this.cargoId = cargoId;
	}
	public String getCargoName() {
		return cargoName;
	}
	public void setCargoName(String cargoName) {
		this.cargoName = cargoName;
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
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getChargeType() {
		return chargeType;
	}
	public void setChargeType(String chargeType) {
		this.chargeType = chargeType;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}

}