package com.sclk.scwms.model;

/**
 * Location entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Location implements java.io.Serializable {

	// Fields

	private Integer id;
	private String zoneId;
	private String rackId;
	private String storeyId;
	private String positionId;
	private String type;
	private Integer warehouseId;
	private String warehouseName;
	// Constructors

	/** default constructor */
	public Location() {
	}

	/** full constructor */
	public Location(String zoneId, String rackId, String storeyId,
			String positionId, String type, Integer warehouseId) {
		this.zoneId = zoneId;
		this.rackId = rackId;
		this.storeyId = storeyId;
		this.positionId = positionId;
		this.type = type;
		this.warehouseId = warehouseId;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getZoneId() {
		return this.zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}

	public String getRackId() {
		return this.rackId;
	}

	public void setRackId(String rackId) {
		this.rackId = rackId;
	}

	public String getStoreyId() {
		return this.storeyId;
	}

	public void setStoreyId(String storeyId) {
		this.storeyId = storeyId;
	}

	public String getPositionId() {
		return this.positionId;
	}

	public void setPositionId(String positionId) {
		this.positionId = positionId;
	}

	public String getType() {
		return this.type;
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

	public String getWarehouseName() {
		return warehouseName;
	}

	public void setWarehouseName(String warehouseName) {
		this.warehouseName = warehouseName;
	}
	
	public String getLocationName() {
		
		
		return this.warehouseName + "-"+ this.zoneId + "-"+this.rackId+ "-"+ this.storeyId+ "-"+ this.positionId;
	}

	@Override
	public boolean equals(Object obj) {
		if(this.id.equals(((Location)obj).getId())){
			
			return true;
			
		}
		
		return false;
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		
		String i = this.warehouseName;
		if(i == null){
			return 1;
		}
		return i.hashCode();
	}
}