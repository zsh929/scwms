package com.sclk.scwms.model;

/**
 * PostionRecord entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class PostionRecord implements java.io.Serializable {

	// Fields

	private Integer id;
	private CargoRecord cargoRecord;
	private String postionId;
	private String quantity;
	private Integer weight;

	// Constructors

	/** default constructor */
	public PostionRecord() {
	}

	/** full constructor */
	public PostionRecord(CargoRecord cargoRecord, String postionId,
			String quantity, Integer weight) {
		this.cargoRecord = cargoRecord;
		this.postionId = postionId;
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

	public CargoRecord getCargoRecord() {
		return this.cargoRecord;
	}

	public void setCargoRecord(CargoRecord cargoRecord) {
		this.cargoRecord = cargoRecord;
	}

	
	
	public String getPostionId() {
		return postionId;
	}

	public void setPostionId(String postionId) {
		this.postionId = postionId;
	}

	public String getQuantity() {
		return this.quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public Integer getWeight() {
		return this.weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

}