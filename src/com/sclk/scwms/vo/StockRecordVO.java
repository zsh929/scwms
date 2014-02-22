package com.sclk.scwms.vo;

import java.util.Date;

import com.sclk.scwms.model.StockRecord;

public class StockRecordVO implements Comparable<StockRecordVO>{
	private Integer id;
	private Short inOut;
	private Date time;
	private Integer cargoId;
	private String quantity;
	private String totalWeight;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Short getInOut() {
		return inOut;
	}
	public void setInOut(Short inOut) {
		this.inOut = inOut;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public Integer getCargoId() {
		return cargoId;
	}
	public void setCargoId(Integer cargoId) {
		this.cargoId = cargoId;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getTotalWeight() {
		return totalWeight;
	}
	public void setTotalWeight(String totalWeight) {
		this.totalWeight = totalWeight;
	}
	public int compareTo(StockRecordVO o) {
		if(time.after(o.time)){
			
			return 1;
		} 
		return 0;
	}
	
}
