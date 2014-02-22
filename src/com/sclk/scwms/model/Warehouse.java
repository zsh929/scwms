package com.sclk.scwms.model;

import java.util.ArrayList;
import java.util.List;

import com.sclk.scwms.vo.WarehouseVO;

/**
 * Warehouse entity.      
 * 
 * @author MyEclipse Persistence Tools
 */

public class Warehouse implements java.io.Serializable,Comparable<Warehouse> {

	// Fields

	private Integer id;
	private String name;
	private String serialNumber;
	private String serialKey;
	private String parentKey;
	private String type;
	private String temperature;
	private String size;
	private Integer orderId;
	private String area;
	private String volume;
	private String length;
	private String width;
	private String height;
	private String memo;
	private List<WarehouseVO> subWarehouseList;
	private List locationList = new ArrayList();
	// Constructors

	/** default constructor */
	public Warehouse() {
	}

	/** full constructor */
	public Warehouse(String name, String serialNumber, String serialKey,
			String parentKey, String type, String temperature, String size,
			Integer orderId, String area, String volume, String length,
			String width, String height, String memo) {
		this.name = name;
		this.serialNumber = serialNumber;
		this.serialKey = serialKey;
		this.parentKey = parentKey;
		this.type = type;
		this.temperature = temperature;
		this.size = size;
		this.orderId = orderId;
		this.area = area;
		this.volume = volume;
		this.length = length;
		this.width = width;
		this.height = height;
		this.memo = memo;
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

	public String getSerialNumber() {
		return this.serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	public String getSerialKey() {
		return this.serialKey;
	}

	public void setSerialKey(String serialKey) {
		this.serialKey = serialKey;
	}

	public String getParentKey() {
		return this.parentKey;
	}

	public void setParentKey(String parentKey) {
		this.parentKey = parentKey;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTemperature() {
		return this.temperature;
	}

	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}

	public String getSize() {
		return this.size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public Integer getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getArea() {
		return this.area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getVolume() {
		return this.volume;
	}

	public void setVolume(String volume) {
		this.volume = volume;
	}

	public String getLength() {
		return this.length;
	}

	public void setLength(String length) {
		this.length = length;
	}

	public String getWidth() {
		return this.width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getHeight() {
		return this.height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getMemo() {
		return this.memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	

	public List<WarehouseVO> getSubWarehouseList() {
		return subWarehouseList;
	}

	public void setSubWarehouseList(List<WarehouseVO> subWarehouseList) {
		this.subWarehouseList = subWarehouseList;
	}

	public List<Location> getLocationList() {
		return locationList;
	}

	public void setLocationList(List locationList) {
		this.locationList = locationList;
	}
	     
	public int compareTo(Warehouse o) {
		if(o == null){
			return 0;
		}
		if(orderId == null || o.orderId == null){
			return 0;
		}
		if(orderId > o.orderId){
			
			return 1;
		} 
		return 0;
	}

}