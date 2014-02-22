package com.sclk.scwms.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.sclk.scwms.common.StringUtil;

/**
 * StockRecord entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class StockRecord implements java.io.Serializable,Comparable<StockRecord> {

	// Fields

	private Integer id;
	private Short inOut;
	private Date time;
	private String type;
	private String personHandling;
	private Integer contractId;
	private Integer customerId;
	private String customerName;
	private Date createTime;
	private String createUser;
	private String serialNumber;
	private String wholeWeight;
	private String temperature;
	private String packing;
	private Set cargoRecords = new HashSet(0);
	private Set chargeRecords = new HashSet(0);
	
	private Integer cargoId;
	private String totalWeight;
	private Integer warehouseId;
	private String locationName;
	private String category;	
	
	public static final short stockIn = 1;
	public static final short stockOut = 0;
	public static final short stockTransfer = 2;
	public static final short stockEqual = 3;
	public static final short stockCancel = -1;
	// Constructors

	/** default constructor */
	public StockRecord() {
	}

	/** full constructor */
	public StockRecord(Short inOut, Date time, String type,
			String personHandling, Integer contractId, Integer customerName,
			Date createTime, String createUser, String serialNumber,
			Set cargoRecords) {
		this.inOut = inOut;
		this.time = time;
		this.type = type;
		this.personHandling = personHandling;
		this.contractId = contractId;
		this.customerId = customerName;
		this.createTime = createTime;
		this.createUser = createUser;
		this.serialNumber = serialNumber;
		this.cargoRecords = cargoRecords;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Short getInOut() {
		return this.inOut;
	}

	public void setInOut(Short inOut) {
		this.inOut = inOut;
	}

	public Date getTime() {
		return this.time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPersonHandling() {
		return this.personHandling;
	}

	public void setPersonHandling(String personHandling) {
		this.personHandling = personHandling;
	}

	public Integer getContractId() {
		return this.contractId;
	}

	public void setContractId(Integer contractId) {
		this.contractId = contractId;
	}

	public Integer getCustomerId() {
		return this.customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
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

	public String getSerialNumber() {
		return this.serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	public Set getCargoRecords() {
		return this.cargoRecords;
	}

	public void setCargoRecords(Set cargoRecords) {
		this.cargoRecords = cargoRecords;
	}

	public String getWholeWeight() {
		return wholeWeight;
	}

	public void setWholeWeight(String wholeWeight) {
		this.wholeWeight = wholeWeight;
	}

	public int compareTo(StockRecord o) {
		if(time.after(o.time)){
			
			return 1;
		}else if(time.before(o.time)){
			
			return 0;
		}else{
			Integer i1 = StringUtil.stringToInteger(serialNumber);
			Integer i2 = StringUtil.stringToInteger(o.serialNumber);
			if(i1 == null || i2 == null){
				
				return 0;
			}else if(i1 > i2){
				
				return 1;
			}else{
				return 0;
			}
			
		}
		
		
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getTemperature() {
		return temperature;
	}

	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}

	public String getPacking() {
		return packing;
	}

	public void setPacking(String packing) {
		this.packing = packing;
	}
	
	public Set getChargeRecords() {
		return chargeRecords;
	}

	public void setChargeRecords(Set chargeRecords) {
		this.chargeRecords = chargeRecords;
	}

	public Integer getCargoId() {
		return cargoId;
	}

	public void setCargoId(Integer cargoId) {
		this.cargoId = cargoId;
	}

	public String getTotalWeight() {
		return totalWeight;
	}

	public void setTotalWeight(String totalWeight) {
		this.totalWeight = totalWeight;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	
	
}