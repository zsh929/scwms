package com.sclk.scwms.model;

import java.util.Date;

/**
 * Customer entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Customer implements java.io.Serializable {

	// Fields
	 
	private Integer id;
	private String name;
	private String contact;
	private String phoneNumber1;
	private String phoneNumber2;
	private String fax;
	private String address;
	private String postcode;
	private String dutyId;
	private String openingBank;
	private String account;
	private String type;
	private Date createTime;
	private Date modifyTime;
	private String createUser;
	private String modifyUser;
	private String memo;
	private String shortName;
	private String symbol;

	// Constructors

	/** default constructor */
	public Customer() {
	}

	/** full constructor */
	public Customer(String name, String contact, String phoneNumber1,
			String phoneNumber2, String fax, String address, String postcode,
			String dutyId, String openingBank, String account, String type,
			Date createTime, Date modifyTime, String createUser,
			String modifyUser, String memo, String shortName, String symbol) {
		this.name = name;
		this.contact = contact;
		this.phoneNumber1 = phoneNumber1;
		this.phoneNumber2 = phoneNumber2;
		this.fax = fax;
		this.address = address;
		this.postcode = postcode;
		this.dutyId = dutyId;
		this.openingBank = openingBank;
		this.account = account;
		this.type = type;
		this.createTime = createTime;
		this.modifyTime = modifyTime;
		this.createUser = createUser;
		this.modifyUser = modifyUser;
		this.memo = memo;
		this.shortName = shortName;
		this.symbol = symbol;
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

	public String getContact() {
		return this.contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getPhoneNumber1() {
		return this.phoneNumber1;
	}

	public void setPhoneNumber1(String phoneNumber1) {
		this.phoneNumber1 = phoneNumber1;
	}

	public String getPhoneNumber2() {
		return this.phoneNumber2;
	}

	public void setPhoneNumber2(String phoneNumber2) {
		this.phoneNumber2 = phoneNumber2;
	}

	public String getFax() {
		return this.fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPostcode() {
		return this.postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getDutyId() {
		return this.dutyId;
	}

	public void setDutyId(String dutyId) {
		this.dutyId = dutyId;
	}

	public String getOpeningBank() {
		return this.openingBank;
	}

	public void setOpeningBank(String openingBank) {
		this.openingBank = openingBank;
	}

	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getModifyTime() {
		return this.modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

	public String getCreateUser() {
		return this.createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public String getModifyUser() {
		return this.modifyUser;
	}

	public void setModifyUser(String modifyUser) {
		this.modifyUser = modifyUser;
	}

	public String getMemo() {
		return this.memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getShortName() {
		return this.shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	public String getSymbol() {
		return this.symbol;
	}

	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}

}