package com.sclk.scwms.model;

import java.sql.Timestamp;

/**
 * ChargeRecord entity. @author MyEclipse Persistence Tools
 */
public class ChargeRecord extends AbstractChargeRecord implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public ChargeRecord() {
	}

	/** full constructor */
	public ChargeRecord(Integer customerId, Integer stockRecordId,
			Integer chargeId, String chargeType, Timestamp date, String weight,
			String unitPrice, String totalPrice) {
		super(customerId, stockRecordId, chargeId, chargeType, date, weight,
				unitPrice, totalPrice);
	}

}
