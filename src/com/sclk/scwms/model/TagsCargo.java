package com.sclk.scwms.model;

/**
 * TagsCargo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class TagsCargo implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer tagsId;
	private Integer cargoId;

	// Constructors

	/** default constructor */
	public TagsCargo() {
	}

	/** full constructor */
	public TagsCargo(Integer tagsId, Integer cargoId) {
		this.tagsId = tagsId;
		this.cargoId = cargoId;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTagsId() {
		return this.tagsId;
	}

	public void setTagsId(Integer tagsId) {
		this.tagsId = tagsId;
	}

	public Integer getCargoId() {
		return this.cargoId;
	}

	public void setCargoId(Integer cargoId) {
		this.cargoId = cargoId;
	}

}