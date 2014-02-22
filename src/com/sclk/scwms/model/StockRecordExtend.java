package com.sclk.scwms.model;

/**
 * StockRecordExtend entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class StockRecordExtend implements java.io.Serializable {

	// Fields

	private Integer id;
	private StockRecord stockRecord;
	private Integer company;
	private Integer operator;
	private String freight;

	// Constructors

	/** default constructor */
	public StockRecordExtend() {
	}

	/** full constructor */
	public StockRecordExtend(StockRecord stockRecord, Integer company,
			Integer operator, String freight) {
		this.stockRecord = stockRecord;
		this.company = company;
		this.operator = operator;
		this.freight = freight;
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

	public Integer getCompany() {
		return this.company;
	}

	public void setCompany(Integer company) {
		this.company = company;
	}

	public Integer getOperator() {
		return this.operator;
	}

	public void setOperator(Integer operator) {
		this.operator = operator;
	}

	public String getFreight() {
		return this.freight;
	}

	public void setFreight(String freight) {
		this.freight = freight;
	}

}