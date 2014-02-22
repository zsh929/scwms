package com.sclk.scwms.vo;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Cargo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class ChargeVO implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer customerId;
	private String customerName;
	private String type;
	private String description;
	private String category;	
	private String categoryName;	
	private String typeName;
	private String unit;
	private String unitName;
	private Integer warehouseId;
	private String warehouseName;
	private String area;
	private Integer chargeDate1;
	private Integer chargeDate2;
	private String unitPrice;
	private String totalPrice;
	private Date createTime;
	private Date effectiveDate;
	private Date expiryDate;
	private Integer status;
	private Integer chargeMethod;
	
	private List<Integer> exceptWarehouseIdList;
	private List<String> exceptCategoryList;
		
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public Integer getWarehouseId() {
		return warehouseId;
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
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public Integer getChargeDate1() {
		return chargeDate1;
	}
	public void setChargeDate1(Integer chargeDate1) {
		this.chargeDate1 = chargeDate1;
	}
	public Integer getChargeDate2() {
		return chargeDate2;
	}
	public void setChargeDate2(Integer chargeDate2) {
		this.chargeDate2 = chargeDate2;
	}
	public String getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getEffectiveDate() {
		return effectiveDate;
	}
	public void setEffectiveDate(Date effectiveDate) {
		this.effectiveDate = effectiveDate;
	}
	public Date getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getUnitName() {
		return unitName;
	}
	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public List<Integer> getExceptWarehouseIdList() {
		return exceptWarehouseIdList;
	}
	public void setExceptWarehouseIdList(List<Integer> exceptWarehouseIdList) {
		this.exceptWarehouseIdList = exceptWarehouseIdList;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public List<String> getExceptCategoryList() {
		return exceptCategoryList;
	}
	public void setExceptCategoryList(List<String> exceptCategoryList) {
		this.exceptCategoryList = exceptCategoryList;
	}
	public Integer getChargeMethod() {
		return chargeMethod;
	}
	public void setChargeMethod(Integer chargeMethod) {
		this.chargeMethod = chargeMethod;
	}
	// Constructors

	

	

}