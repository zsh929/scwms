package com.sclk.scwms.model;

/**
 * SerialNumber entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class SerialNumber implements java.io.Serializable {

	// Fields

	private Integer id;
	private String serialNumber;

	// Constructors

	/** default constructor */
	public SerialNumber() {
	}

	/** full constructor */
	public SerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSerialNumber() {
		return this.serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

}