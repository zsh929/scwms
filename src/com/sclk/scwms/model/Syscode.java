package com.sclk.scwms.model;

import java.util.Iterator;
import java.util.List;

/**
 * Syscode entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Syscode implements java.io.Serializable {

	// Fields

	private Integer id;
	private String codeKey;
	private String codeValue;
	private String parentKey;
	private Integer orderId;
	private Short isLeaf;
	private String memo;
	private List children;
	// Constructors

	/** default constructor */
	public Syscode() {
	}

	/** full constructor */
	public Syscode(String codeKey, String codeValue, String parentKey,
			Integer orderId, Short isLeaf, String memo) {
		this.codeKey = codeKey;
		this.codeValue = codeValue;
		this.parentKey = parentKey;
		this.orderId = orderId;
		this.isLeaf = isLeaf;
		this.memo = memo;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCodeKey() {
		return this.codeKey;
	}

	public void setCodeKey(String codeKey) {
		this.codeKey = codeKey;
	}

	public String getCodeValue() {
		return this.codeValue;
	}

	public void setCodeValue(String codeValue) {
		this.codeValue = codeValue;
	}

	public String getParentKey() {
		return this.parentKey;
	}

	public void setParentKey(String parentKey) {
		this.parentKey = parentKey;
	}

	public Integer getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Short getIsLeaf() {
		return this.isLeaf;
	}

	public void setIsLeaf(Short isLeaf) {
		this.isLeaf = isLeaf;
	}

	public String getMemo() {
		return this.memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}
	

	public List getChildren() {
		return children;
	}

	public void setChildren(List children) {
		this.children = children;
	}
	
	public String getTreeView(){
		
		StringBuffer sb = new StringBuffer();
		sb.append("<li name="+this.getCodeKey()+">");
		sb = sb.append("<div><a href=\"syscode.do?method=view&key="+ this.getCodeKey()+"\">"+this.getCodeValue()+"</a></div>");
		//sb = sb.append("<div>"+this.getCodeValue()+"</div>");
		
		if(children != null){
			Iterator it = children.iterator();
			sb.append("<ul>");
			while(it.hasNext()){
				Syscode d = (Syscode) it.next();
				sb.append( d.getTreeView());
			}
			sb.append("</ul>");
		}
		
		sb.append("</li>");
		return sb.toString();
		
	}
}