package com.sclk.scwms.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.sclk.scwms.vo.CargoVO;

/**
 * CargoRecord entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CargoRecord implements java.io.Serializable {

	// Fields

	private Integer id;
	private StockRecord stockRecord;
	private Integer cargoId;
	private String quantity;
	private String totalWeight;
	
	private String batchNumber;
	private Date dateProduce;
	private Integer warehouseId;
	private String locationName;
	private String unitPrice;
	private String countUnit;
	private String totalPrice;
	private CargoVO cargoVO;
	private Set postionRecords = new HashSet(0);
	// Constructors

	/** default constructor */
	public CargoRecord() {
	}

	/** full constructor */
	public CargoRecord(StockRecord stockRecord, Integer cargoId,
			String quantity, String totalWeight,String batchNumber,Date dateProduce,Set postionRecords) {
		this.stockRecord = stockRecord;
		this.cargoId = cargoId;
		this.quantity = quantity;
		this.totalWeight = totalWeight;
		this.batchNumber = batchNumber;
		this.dateProduce = dateProduce;
		this.postionRecords = postionRecords;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public StockRecord getStockRecord() {
		return this.stockRecord;
	}

	public void setStockRecord(StockRecord stockRecord) {
		this.stockRecord = stockRecord;
	}

	public Integer getCargoId() {
		return this.cargoId;
	}

	public void setCargoId(Integer cargoId) {
		this.cargoId = cargoId;
	}

	public String getQuantity() {
		return this.quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getTotalWeight() {
		return this.totalWeight;
	}

	public void setTotalWeight(String totalWeight) {
		this.totalWeight = totalWeight;
	}

	public CargoVO getCargoVO() {
		return cargoVO;
	}

	public void setCargoVO(CargoVO cargoVO) {
		this.cargoVO = cargoVO;
	}

	public String getBatchNumber() {
		return batchNumber;
	}

	public void setBatchNumber(String batchNumber) {
		this.batchNumber = batchNumber;
	}

	public Date getDateProduce() {
		return dateProduce;
	}

	public void setDateProduce(Date dateProduce) {
		this.dateProduce = dateProduce;
	}

	public Integer getWarehouseId() {
		return warehouseId;
	}

	public void setWarehouseId(Integer warehouseId) {
		this.warehouseId = warehouseId;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public Set getPostionRecords() {
		return postionRecords;
	}

	public void setPostionRecords(Set postionRecords) {
		this.postionRecords = postionRecords;
	}

	public String getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getCountUnit() {
		return countUnit;
	}

	public void setCountUnit(String countUnit) {
		this.countUnit = countUnit;
	}

	public String getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}



	

}