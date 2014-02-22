package com.sclk.scwms.model;

import java.sql.Time;
import java.util.Date;

/**
 * SystemLog entity. @author MyEclipse Persistence Tools
 */
public class SystemLog extends AbstractSystemLog implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public SystemLog() {
	}

	/** full constructor */
	public SystemLog(String userName, String type, String loginAddress,
			Date operationTime, String operationContent) {
		super(userName, type, loginAddress, operationTime, operationContent);
	}

}
