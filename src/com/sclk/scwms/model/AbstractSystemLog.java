package com.sclk.scwms.model;

import java.sql.Time;
import java.util.Date;

/**
 * AbstractSystemLog entity provides the base persistence definition of the
 * SystemLog entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractSystemLog implements java.io.Serializable {

	// Fields

	private Integer id;
	private String userName;
	private String type;
	private String loginAddress;
	private Date operationTime;
	private String operationContent;
	private String sessionId;
	// Constructors

	/** default constructor */
	public AbstractSystemLog() {
	}

	/** full constructor */
	public AbstractSystemLog(String userName, String type, String loginAddress,
			Date operationTime, String operationContent) {
		this.userName = userName;
		this.type = type;
		this.loginAddress = loginAddress;
		this.operationTime = operationTime;
		this.operationContent = operationContent;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getLoginAddress() {
		return this.loginAddress;
	}

	public void setLoginAddress(String loginAddress) {
		this.loginAddress = loginAddress;
	}

	public Date getOperationTime() {
		return this.operationTime;
	}

	public void setOperationTime(Date operationTime) {
		this.operationTime = operationTime;
	}

	public String getOperationContent() {
		return this.operationContent;
	}

	public void setOperationContent(String operationContent) {
		this.operationContent = operationContent;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

}