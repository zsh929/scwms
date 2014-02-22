package com.sclk.scwms.model;

/**
 * MonthWarehouse entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class MonthWarehouse implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer monthTotalId;
	private Integer warehouseId;
	private Integer quantity;
	private Integer weight;

	// Constructors

	/** default constructor */
	public MonthWarehouse() {
	}

	/** full constructor */
	public MonthWarehouse(Integer monthTotalId, Integer warehouseId,
			Integer quantity, Integer weight) {
		this.monthTotalId = monthTotalId;
		this.warehouseId = warehouseId;
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

	public Integer getWarehouseId() {
		return this.warehouseId;
	}

	public void setWarehouseId(Integer warehouseId) {
		this.warehouseId = warehouseId;
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