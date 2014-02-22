package com.sclk.scwms.vo;

/**
 * MonthWarehouse entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class MonthWarehouseVO implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer monthTotalId;
	private String warehouseName;
	private Integer quantity;
	private Integer weight;

	// Constructors

	/** default constructor */
	public MonthWarehouseVO() {
	}

	/** full constructor */
	public MonthWarehouseVO(Integer monthTotalId, String warehouseName,
			Integer quantity, Integer weight) {
		this.monthTotalId = monthTotalId;
		this.warehouseName = warehouseName;
		this.quantity = quantity;
		this.weight = weight;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getMonthTotalId() {
		return this.monthTotalId;
	}

	public void setMonthTotalId(Integer monthTotalId) {
		this.monthTotalId = monthTotalId;
	}

	

	public String getWarehouseName() {
		return warehouseName;
	}

	public void setWarehouseName(String warehouseName) {
		this.warehouseName = warehouseName;
	}

	public Integer getQuantity() {
		return this.quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getWeight() {
		return this.weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

}